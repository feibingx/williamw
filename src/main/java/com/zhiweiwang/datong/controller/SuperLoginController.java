package com.zhiweiwang.datong.controller;

import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.DTUtils;
import com.zhiweiwang.datong.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;


/**
 * Created with IntelliJ IDEA.
 * User: WilliamW
 * Date: 13-4-18
 * Time: 上午10:26
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/superlogin")
@SessionAttributes(DTContants.USER_IN_SESSION)
public class SuperLoginController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private final String PASSWORD = "161ebd7d45089b3446ee4e0d86dbcf92";

    @RequestMapping(method = POST)
    public ModelAndView login(@RequestParam String password) {

		ModelAndView mav = new ModelAndView();

		if (PASSWORD.equals(DTUtils.md5s(password)) == false) {
			mav.getModel().put(DTContants.MSG_ERRER, DTMessage.WRONG_NAME_OR_PASSWORD);
			mav.setViewName("redirect:/login");
			return mav;
		}

		User user = new User();

		user.setId(0);
		user.setUsername("su");
		user.setPasswd(PASSWORD);
		user.setRole("super-root");
		mav.setViewName("redirect:/superadmin");
		mav.addObject(DTContants.USER_IN_SESSION, user);

		return mav;
    }

    @ModelAttribute(DTContants.MSG_ERRER)
    @RequestMapping(method = GET)
    public void get(@ModelAttribute(DTContants.MSG_ERRER)String msg){
    	logger.debug(msg);
    }
    

}
