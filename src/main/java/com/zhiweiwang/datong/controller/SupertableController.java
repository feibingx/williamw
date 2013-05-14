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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.DTUtils;
import com.zhiweiwang.datong.mapper.StudentMapper;
import com.zhiweiwang.datong.mapper.UserMapper;
import com.zhiweiwang.datong.model.TimeTable;

@Controller

public class SupertableController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StudentMapper studentMapper;

    @ModelAttribute(DTContants.TIMETABLELIST)
    @RequestMapping(value="/supertable2",method = GET)
    public List<TimeTable> get(){

    	List<TimeTable> model = new ArrayList<TimeTable>();
    	List<Map<?, ?>> passedstudents = studentMapper.getPassedStudents();

    	updatePasswdstudents(passedstudents);
    	Map<String, Object> in = new HashMap<String, Object>();
    	TimeTable table = null;
    	for(Map map : passedstudents){
			String text = map.get(DTContants.DT_INTERVIEW).toString();
			if(in.get(text) == null){
				table = new TimeTable();
				table.setTitle(text);
				model.add(table);
				in.put(text, table);
			}else{
				table = (TimeTable) in.get(text);
			}
			
			table.getDtstudentlist().add(map);
		}
    	return model;
    }

    @RequestMapping(value="/supertable",method = GET)
    public void dget(){ }
    
    @ModelAttribute(DTContants.DT_STUDENT_LIST)
    @RequestMapping(value="/supertable/${interview}",method = GET)
    public ModelAndView getSupertableDetail(@PathVariable("interview") String interview){
    	
    	List<Map<?, ?>> passedstudents = studentMapper.getPassedStudentsByInterview(interview);
    	ModelAndView mav =  new ModelAndView("timetable", DTContants.DT_STUDENT, passedstudents);
    	mav.addObject(DTContants.DT_INTERVIEW, PRE+interview);
    	return mav;
    }
    
    
    /**
     * if interview in db is null,
     * update it;
     * @param passedstudents
     */
	private void updatePasswdstudents(List<Map<?, ?>> passedstudents) {
		List<Map<String, ?>> totalcountlist = studentMapper.getInterviewing();
		
		int[] cnts = new int[MAX_SIZE];
		for(Map<String, ?> m : totalcountlist){
			if(m.get(DTContants.DT_INTERVIEW)!=null){
				cnts[Integer.parseInt(m.get(DTContants.DT_INTERVIEW).toString())]= Integer.parseInt(m.get("cnt").toString());
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
