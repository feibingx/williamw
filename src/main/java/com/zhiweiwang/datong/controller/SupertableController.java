package com.zhiweiwang.datong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.zhiweiwang.datong.mapper.StudentMapper;
import com.zhiweiwang.datong.mapper.UserMapper;

@Controller
@RequestMapping("/supertable")
public class SupertableController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StudentMapper studentMapper;

    @RequestMapping(method = GET)
    @ModelAttribute(DTContants.DT_STUDENT_LIST)
    public List get(){
    	ModelAndView mav = new ModelAndView();
    	
    	List<Map<?, ?>> passedstudents = studentMapper.getPassedStudents();
    	
    	updatePasswdstudents(passedstudents);
    	return passedstudents;
    }

	private void updatePasswdstudents(List<Map<?, ?>> passedstudents) {
		List<Map<String, ?>> totalcountlist = studentMapper.getInterviewing();
		
		int[] cnts = new int[MAX_SIZE];
		for(Map m : totalcountlist){
			if(m.get("interview")!=null){
				cnts[Integer.parseInt(m.get("interview").toString())]= Integer.parseInt(m.get("cnt").toString());
			}else{
				cnts[0]= Integer.parseInt(m.get("cnt").toString());
			}
		}
		logger.debug("the interview map: {} \n{}", new Object[]{cnts, totalcountlist});
		for(Map map : passedstudents){
			map.put("interview", PRE+getMin(cnts));
			studentMapper.updateSts(map);
		}
	}

	/**
	 * 确定最小的组
	 * @param cnts
	 * @return
	 */
	private Object getMin(int[] cnts) {
		int min = cnts[1];
		int ans = 1;
		for(int i=2; i<MAX_SIZE; i++){
			if(cnts[i]<min ){
				min = cnts[i];
				ans = i;
			}
		}
		cnts[ans]++;
		return ans;
	}

	private static final int MAX_SIZE = 4;
	private static final String PRE = "Time";
}
