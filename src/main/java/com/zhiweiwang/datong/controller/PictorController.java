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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA. User: WilliamW Date: 13-4-18 Time: 上午10:26 To
 * change this template use File | Settings | File Templates.
 */
@Controller
@SessionAttributes(DTContants.USER_IN_SESSION)
public class PictorController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/pic", method = POST)
	@ModelAttribute(DTContants.IMG_PATH)
	public ModelAndView login(
			@RequestParam("fileToUpload") MultipartFile file,
			/*@ModelAttribute(DTContants.USER_IN_SESSION) User user,*/
			HttpServletRequest request, RedirectAttributes attr) {
		 ModelAndView mav = new ModelAndView();
		String uploadDirPath = request.getSession().getServletContext()
				.getRealPath("/upload");
		MultipartFile image = file;
		logger.debug("uploadDirPath: " +uploadDirPath);
		File destFile = new File(uploadDirPath + "/"
				+ image.getOriginalFilename());
		try {
			if(destFile.exists() == false)
				destFile.createNewFile();
			FileCopyUtils.copy(image.getBytes(), destFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String destPath = request.getContextPath() + "/upload/"
				+ destFile.getName();
		logger.debug("destPath: " +destPath);
		mav.getModel().put(DTContants.IMG_PATH, destPath);
		attr.addAttribute(DTContants.IMG_PATH, destPath);
       // mav.setViewName("redirect:/pic");
		return mav;

	}

	@RequestMapping(value = "/pic", method = GET)
	public void get( /* @ModelAttribute(DTContants.USER_IN_SESSION) Student user */) {
		

	}

}
