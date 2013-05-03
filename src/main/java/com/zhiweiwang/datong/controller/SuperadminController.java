package com.zhiweiwang.datong.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.mapper.UserMapper;

@Controller
@RequestMapping("/superadmin")
public class SuperadminController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserMapper userMapper;

    @RequestMapping(method = POST)
    public ModelAndView superadmin(@RequestParam String username,@RequestParam String role,@RequestParam String action){

          ModelAndView mav = new ModelAndView();

          if("unable".equals(action)){
        	  role = "";
          }
          
          userMapper.updatRole(username, role);
          mav.getModel().put(DTContants.MSG_ERRER, DTMessage.UPDATE_ADMIN_SUCCESS);
          
          logger.debug("{} user: {}", new Object[]{action, username});
          return mav;
    }

    @ModelAttribute(DTContants.MSG_ERRER)
    @RequestMapping(method = GET)
    public void get(@ModelAttribute(DTContants.MSG_ERRER)String msg){

    }

}
