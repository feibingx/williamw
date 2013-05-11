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
import com.zhiweiwang.datong.SysConfContants;
import com.zhiweiwang.datong.mapper.SysconfMapper;
import com.zhiweiwang.datong.mapper.UserMapper;

@Controller
@RequestMapping("/supereditor")
public class SuperEditorController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SysconfMapper sysconfMapper;

	@RequestMapping(method = POST)
	public ModelAndView superadmin(@RequestParam String logintext) {
		ModelAndView mav = new ModelAndView();

		sysconfMapper.setValue(SysConfContants.LOGINTEXT, logintext);
		mav.getModel().put(DTContants.MSG_ERRER, DTMessage.UPDATE_LOGINTEXT_SUCCESS);
		mav.setViewName("redirect:/message");
		logger.debug("首页文字更新\n {}", new Object[] { logintext });
		return mav;
	}

	@ModelAttribute(SysConfContants.LOGINTEXT)
	@RequestMapping(method = GET)
	public String get() {
		return sysconfMapper.getValue(SysConfContants.LOGINTEXT);
	}

}
