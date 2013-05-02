package com.zhiweiwang.datong.controller;

import java.util.HashMap;
import java.util.Map;

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
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.MD5;
import com.zhiweiwang.datong.mapper.UserMapper;
import com.zhiweiwang.datong.model.User;

@Controller
@RequestMapping("/register")
public class RegisterController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserMapper userMapper;

    @RequestMapping(method = POST)
    public ModelAndView newUser(@ModelAttribute User user){

          ModelAndView mav = new ModelAndView();

          User userx = userMapper.get_user(user.getUsername());
          if(userx!=null){
        	  logger.debug(userx.toString());
        	  mav.addObject(DTContants.MSG_ERRER, "user_existed");
        	  mav.setViewName("redirect:/message");
          }
          else{
	          String password = MD5.md5s(user.getPasswd());
	          logger.debug(user.getUsername());
	          logger.debug(password);
	          
	          userMapper.insertRow(user.getUsername(), password, user.getEmail());
	          
	          mav.addObject(DTContants.MSG_ERRER, DTMessage.REGIST_SUCCESS);
	          mav.setViewName("redirect:/message");
          }
          return mav;
    }

	@RequestMapping(method = GET)
    public void get() {
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
