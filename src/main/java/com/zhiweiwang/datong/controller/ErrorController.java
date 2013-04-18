package com.zhiweiwang.datong.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.mapper.UserMapper;
import com.zhiweiwang.datong.model.User;

@Controller
public class ErrorController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private UserMapper userMapper;
    
    @RequestMapping(value="/error", method = RequestMethod.GET)
    @ModelAttribute(DTContants.ERROR_MSG)
    public String getError(@ModelAttribute(DTContants.ERROR_MSG)String msg) {
    	logger.debug(msg);
		return msg;
    }

    @RequestMapping(value="/getUser", method = RequestMethod.GET)
    @ResponseBody
    public String getUser(@RequestParam String username)  {
    	logger.debug("try finding user "+username);
    	User user = userMapper.get_user(username);
    	if(user!=null){
    		return "true";
    	}
    	return "false";
    }
}
