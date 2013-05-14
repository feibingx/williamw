package com.zhiweiwang.datong.controller;

import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.DTUtils;
import com.zhiweiwang.datong.mapper.StudentMapper;
import com.zhiweiwang.datong.model.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes(DTContants.USER_IN_SESSION)
public class ResultController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	protected StudentMapper studentMapper;

	@ModelAttribute(DTContants.DT_STUDENT)
	@RequestMapping(value = "/result", method = GET)
	public Map<?, ?> get(@ModelAttribute(DTContants.USER_IN_SESSION) User user) {
		return studentMapper.getStudent(user.getId());
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ModelAttribute(DTContants.DT_STUDENT)
	@RequestMapping(value = "/result/{id}", method = GET)
	public ModelAndView getResult(@ModelAttribute(DTContants.USER_IN_SESSION) User user) {
		ModelAndView mav = new ModelAndView("showresult");
		logger.info("user getting result:  {} ", user.getId());
		Map map = studentMapper.getStudent(user.getId());
		Object sts = map.get(DTContants.DT_STS);
		if (sts == null) {
			logger.debug("sts is null");
			return null;
		}
		
		
		String status = sts.toString();
		map.put(DTContants.DT_RESULT_MSG, "msg_" + status);
		if (map.get(DTContants.DT_INTERVIEW) != null) {
			map.put(DTContants.DT_INTERVIEW_TIME, "Time" + map.get(DTContants.DT_INTERVIEW));
		}else{
			logger.debug("DT_INTERVIEW_TIME is null!");
			update(map);
		}
		mav.addObject(DTContants.DT_STUDENT,map);
		return mav;
	}

	@ModelAttribute(DTContants.MSG_ERRER)
	@RequestMapping(value = "/result/{id}", method = POST)
	public ModelAndView postResult(@ModelAttribute(DTContants.USER_IN_SESSION) User user) {
		ModelAndView mav = new ModelAndView();
		logger.info("user post feedback result:  {} ", user.getId());
		studentMapper.updateFeedback(user.getId());
		mav.setViewName("redirect:/message");
		mav.addObject(DTContants.MSG_ERRER, DTMessage.ECHO_ACCEPTED);
		return mav;
	}
	
	
	private void update(Map map) {
		List<Map<String, ?>> totalcountlist = studentMapper.getInterviewing();

		int[] cnts = new int[DTContants.MAX_SIZE];
		for (Map<String, ?> m : totalcountlist) {
			if (m.get(DTContants.DT_INTERVIEW) != null) {
				cnts[Integer.parseInt(m.get(DTContants.DT_INTERVIEW).toString())] = Integer.parseInt(m.get("cnt").toString());
			} else {
				cnts[0] = Integer.parseInt(m.get("cnt").toString());
			}
		}
		logger.debug("the interview map: {} \n{}", new Object[] { cnts, totalcountlist });
		
		if (map.get(DTContants.DT_INTERVIEW) == null) {
			Object min = DTUtils.getMin(cnts);
			map.put("interview", min);
			map.put(DTContants.DT_INTERVIEW_TIME, "Time" + min);
			studentMapper.updateSts(map);
		}
	}
}
