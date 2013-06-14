package com.zhiweiwang.datong.controller;

import com.zhiweiwang.datong.mapper.StudentMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static com.zhiweiwang.datong.DTContants.QUERY_CONF;
import static com.zhiweiwang.datong.DTContants.DT_STUDENT_LIST;
import static com.zhiweiwang.datong.DTContants.LINES_PER_PAGE;
import static com.zhiweiwang.datong.DTContants.TOTAL_COUNT;

@Controller
public class ExportController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private StudentMapper studentMapper;

	@RequestMapping(value = "/export", method = GET)
	@ModelAttribute(DT_STUDENT_LIST)
	public List<Map<String, ?>> export(){
		return studentMapper.getAllStudents();
		//return new ModelAndView("export", , result);
	}

}
