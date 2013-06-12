package com.zhiweiwang.datong.controller;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTUtils;
import com.zhiweiwang.datong.mapper.StudentMapper;
import com.zhiweiwang.datong.mapper.SysconfMapper;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class PureGetController {
    
	@Autowired
	protected StudentMapper studentMapper;

	@Autowired
	private SysconfMapper sysconfMapper;

//	private Logger logger = LoggerFactory.getLogger(this.getClass());
  
	@RequestMapping(value = "/index", method = GET)
	@ModelAttribute("logintext")
	public String getIndex(){
		return sysconfMapper.getValue("logintext");
	}
	
	@RequestMapping(value = "/logo", method = GET)
	public void getlogo(){}
	
	@ModelAttribute(DTContants.DT_STUDENT)
	@RequestMapping(value = "/print/{nid}")
	public ModelAndView get(@PathVariable("nid") int id) {
		Map<?, ?> student = studentMapper.getStudent(id);		
        DTUtils.makeJson2Map(student, "honors");
        DTUtils.makeJson2Map(student, "prices");		
		return new ModelAndView("print", DTContants.DT_STUDENT, student);
	}
}
