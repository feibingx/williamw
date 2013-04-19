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
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import java.io.UnsupportedEncodingException;


/**
 * Created with IntelliJ IDEA.
 * User: WilliamW
 * Date: 13-4-18
 * Time: 上午10:26
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/login")
@SessionAttributes(DTContants.USER_IN_SESSION)
public class LoginController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    
    protected String errmsg = "中文测试";

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ReloadableResourceBundleMessageSource message;
    
    @RequestMapping(method = POST)
    public ModelAndView login(@RequestParam String name,@RequestParam String password) throws UnsupportedEncodingException {
        logger.info("login selected User is {} ", new Object[]{name});

        ModelAndView mav = new ModelAndView();

        User user = userMapper.get_user(name);
        if (user == null || user.getPasswd().equals(MD5.md5s(password)) == false) {
            mav.getModel().put(DTContants.MSG_ERRER, DTMessage.WRONG_NAME_OR_PASSWORD);
            mav.setViewName("redirect:/login");
            return mav;
        }

        mav.setViewName("redirect:/fillin");
        mav.addObject(DTContants.USER_IN_SESSION, user);

        return mav;
    }

    @ModelAttribute(DTContants.MSG_ERRER)
    @RequestMapping(method = GET)
    public void get(@ModelAttribute(DTContants.MSG_ERRER)String msg) throws UnsupportedEncodingException {
    	logger.debug(errmsg);
    }

}
