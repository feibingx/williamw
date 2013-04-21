package com.zhiweiwang.datong.controller;

import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.MD5;
import com.zhiweiwang.datong.mapper.UserMapper;
import com.zhiweiwang.datong.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * Created with IntelliJ IDEA.
 * User: WilliamW
 * Date: 13-4-18
 * Time: 上午10:26
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/logout")
public class LogoutController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ReloadableResourceBundleMessageSource message;
    
//    @RequestMapping(method = POST)
//    public ModelAndView login(@RequestParam String name,@RequestParam String password) throws UnsupportedEncodingException {
//
//        ModelAndView mav = new ModelAndView();
//
//        mav.setViewName("redirect:/fillin");
//        mav.getModel().remove(DTContants.USER_IN_SESSION);
//        
//        return mav;
//    }

    @RequestMapping(method = GET)
    public ModelAndView get(HttpServletRequest request) throws UnsupportedEncodingException {

        HttpSession session = request.getSession();
        session.removeAttribute(DTContants.USER_IN_SESSION);
        
        ModelAndView mav = new ModelAndView();

        mav.setViewName("redirect:/message");
        mav.getModel().remove(DTContants.USER_IN_SESSION);
        
        return mav;
    }

}
