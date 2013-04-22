package com.zhiweiwang.datong.controller;

import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.MD5;
import com.zhiweiwang.datong.mapper.StudentMapper;
import com.zhiweiwang.datong.mapper.UserMapper;
import com.zhiweiwang.datong.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;


/**
 * Created with IntelliJ IDEA.
 * User: WilliamW
 * Date: 13-4-18
 * Time: 上午10:26
 * To change this template use File | Settings | File Templates.
 */
@Controller
@SessionAttributes(DTContants.USER_IN_SESSION)
public class AdminController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ReloadableResourceBundleMessageSource message;
    
    @RequestMapping(value="/admin",method = POST)
    public ModelAndView admin(@RequestParam String name,@RequestParam String password) throws UnsupportedEncodingException {
        logger.info("adminLogin selected User is {} ", new Object[]{name});

        ModelAndView mav = new ModelAndView();

        User user = null; //userMapper.get_user(name);
        if (user == null || user.getPasswd().equals(MD5.md5s(password)) == false) {
            mav.getModel().put(DTContants.MSG_ERRER, DTMessage.WRONG_NAME_OR_PASSWORD);
            mav.setViewName("redirect:/admin");
            return mav;
        }
        mav.setViewName("redirect:/select");
        mav.addObject(DTContants.USER_IN_SESSION, user);

        return mav;
    }

	@ModelAttribute(DTContants.DT_STUDENT_LIST)
	@RequestMapping(value = "/admin/${limit}/${start}", method = GET)
	public /*List<?>*/ ModelAndView get(@PathVariable int start,@PathVariable int limit, RedirectAttributes redirectAttrs) {
        
        //redirectAttrs.addAttribute(TRANSACTION_ID,transactionId);
		if(limit==0){
			limit = 100;
		}
		List<Map<?, ?>> list = studentMapper.getStudentsLimit(start, limit);
		//redirectAttrs.addAttribute(DTContants.DT_STUDENT_LIST,studentMapper.getStudentsLimit(start, limit));
		//return ;
		return new ModelAndView("admin", "admin", list);
    }
	
	@ModelAttribute(DTContants.DT_STUDENT_LIST)
	@RequestMapping(value = "/admin", method = GET)
	public List<?> getinit() {
		return studentMapper.getStudentsLimit(0, 100);
    } 

}
