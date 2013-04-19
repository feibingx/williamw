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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA. User: WilliamW Date: 13-4-18 Time: 上午10:26 To
 * change this template use File | Settings | File Templates.
 */
@Controller
@SessionAttributes(DTContants.USER_IN_SESSION)
public class FillController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	protected StudentMapper studentMapper;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/fillin", method = RequestMethod.POST)
	public ModelAndView fillin(HttpServletRequest request, @ModelAttribute(DTContants.USER_IN_SESSION) User user) {
		
		logger.info("user is:  {} ",user.getId());
		
		Map map = new HashMap(request.getParameterMap());
		Set<String> keys = map.keySet();
        for (Iterator it = keys.iterator(); it.hasNext();) {
            String key = (String) it.next();
            Object student = request.getParameter(key);
            map.put(key, student.toString());
            logger.info("params:  {} - {}",new Object[]{key, student});
        }
        map.put(DTContants.DT_ID, user.getId());
        map.put(DTContants.DT_USERNAME, user.getUsername());
        
        logger.info("{} ", map);        
        studentMapper.insertRow(map);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/message");
        mav.addObject(DTContants.MSG_ERRER, DTMessage.FILLIN_SUCCESS);
		return mav;
	}



	@ModelAttribute(DTContants.DT_STUDENT)
	@RequestMapping(value = "/fillin", method = GET)
	public Map get(@ModelAttribute(DTContants.USER_IN_SESSION) User user) {
		logger.info("user:  {} ",user.getId());
//		ModelAndView mav = new ModelAndView();
        return studentMapper.getStudent(user.getId());
//		return mav;
	}

}
