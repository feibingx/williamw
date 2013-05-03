package com.zhiweiwang.datong.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.zhiweiwang.datong.DTContants;

@Controller
public class MessageController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @RequestMapping(value="/message", method = RequestMethod.GET)
    @ModelAttribute(DTContants.MSG_ERRER)
    public String getError(@ModelAttribute(DTContants.MSG_ERRER)String msg) {
    	logger.debug(msg);
		return msg;
    }

}
