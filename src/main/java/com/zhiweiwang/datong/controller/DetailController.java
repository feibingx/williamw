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
public class DetailController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ReloadableResourceBundleMessageSource message;
    
    @RequestMapping(value="/detail",method = POST)
    public ModelAndView admin(@RequestParam String name,@RequestParam String password) throws UnsupportedEncodingException {
        logger.info("adminLogin selected User is {} ", new Object[]{name});

        ModelAndView mav = new ModelAndView();

        return mav;
    }
	
	@ModelAttribute(DTContants.DT_STUDENT)
	@RequestMapping(value = "/detail/{nid}")
	public ModelAndView get(@PathVariable("nid") int id) {
		logger.info("user:  {} ", id);
		Map<?, ?> student = studentMapper.getStudent(id);
		return new ModelAndView("detail", DTContants.DT_STUDENT, student);

	}

}
