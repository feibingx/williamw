package com.zhiweiwang.datong.controller;

import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTUtils;
import com.zhiweiwang.datong.mapper.StudentMapper;
import com.zhiweiwang.datong.model.User;
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
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class DetailController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StudentMapper studentMapper;
    
	@RequestMapping(value="/deal",method = POST)
    public String postDeal(@RequestParam(value="action",required=false) String action,@RequestParam(required=false) String interview, HttpSession session){
    	return deal(action, interview, (Integer)session.getAttribute(DTContants.STUDENT_ID_IN_SESSION), ((User)session.getAttribute(DTContants.USER_IN_SESSION)).getRole());
    }
	
	@RequestMapping(value="/deal",method = GET)
    public String getDeal(@RequestParam(required=false) String action,@RequestParam(required=false) String interview, HttpSession session) {
    	return deal(action, interview, (Integer)session.getAttribute(DTContants.STUDENT_ID_IN_SESSION), ((User)session.getAttribute(DTContants.USER_IN_SESSION)).getRole());

    }

	@RequestMapping(value="/pass",method = POST)
    public String pass(@RequestParam(required=false) int id,@RequestParam(required=false) String action,@RequestParam(required=false) String interview, HttpSession session) {
    	return deal(action, interview, id, ((User)session.getAttribute(DTContants.USER_IN_SESSION)).getRole());
    }
	
	@RequestMapping(value="/reject",method = GET)
    public String reject(@RequestParam int id, HttpSession session) {
    	return deal("sts_reject", null, id, ((User)session.getAttribute(DTContants.USER_IN_SESSION)).getRole());
    }
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	protected String deal(String action, String interview, int id, String role) {
    	logger.debug("action {}", new Object[]{action});
		Map map = new HashMap();		
		map.put("id", id);    	
		map.put("role", role );
		map.put("interview", interview);
		map.put("sts", action);

    	studentMapper.updateSts(map);
        return "redirect:/admin";
	}
    
	@ModelAttribute(DTContants.DT_STUDENT)
	@RequestMapping(value = "/detail/{nid}")
	public ModelAndView get(@PathVariable("nid") int id, HttpSession session) {
		session.removeAttribute(DTContants.STUDENT_ID_IN_SESSION);
		logger.info("user:  {} ", id);
		Map<?, ?> student = studentMapper.getStudent(id);
		session.setAttribute(DTContants.STUDENT_ID_IN_SESSION, id);
		
        DTUtils.makeJson2Map(student, "honors");
        DTUtils.makeJson2Map(student, "prices");
		
		return new ModelAndView("detail", DTContants.DT_STUDENT, student);
	}

}
