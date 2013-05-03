package com.zhiweiwang.datong.controller;

import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.ModelAndView;

import com.zhiweiwang.datong.mapper.StudentMapper;
import com.zhiweiwang.datong.model.User;


import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:comm.xml")
public class FillinControllerTest {
	@Autowired
	FillController controller;
	
	@Autowired
	StudentMapper studentMapper;
	
	@Before
	public void perpare(){
		studentMapper.deleteStudent(100);
	}
	
	@SuppressWarnings("rawtypes")
	@Test
	public void should_inserted(){
		
		MockHttpServletRequest request = new MockHttpServletRequest();
		User user = new User();

		perparedata(request, user);
		ModelAndView mav = controller.fillin(request, user);
		
		Map student = studentMapper.getStudent(100);
		
		assertThat(student, notNullValue());
		assertThat(mav.getViewName(), is("redirect:/message"));
		assertThat(student.get("prices").toString(), is("DT_PRICES"));
	}

	private void perparedata(MockHttpServletRequest request, User user) {
		request.addParameter("id","100");
		request.addParameter("username","DT_USERNAME");
		request.addParameter("name","姓名哈");
		request.addParameter("sex","女");
		request.addParameter("policy","DT_POLICY");
		request.addParameter("birthyear","1999");
		request.addParameter("birthmonth","12");
		request.addParameter("birthday","12");
		request.addParameter("healthy","DT_HEALTHY");
		request.addParameter("city","DT_CITY");
		request.addParameter("address","DT_ADDRESS");
		request.addParameter("addcode","DT_ADDCODE");
		request.addParameter("phone","DT_PHONE");
		request.addParameter("cell","DT_CELL");
		request.addParameter("gradeschool","DT_GRADESCHOOL");
		request.addParameter("gradesection","DT_GRADESECTION");
		request.addParameter("number","DT_NUMBER");
		request.addParameter("daddy","DT_DADDY");
		request.addParameter("daddyname","DT_DADDYNAME");
		request.addParameter("daddyjob","DT_DADDYJOB");
		request.addParameter("daddyphone","DT_DADDYPHONE");
		request.addParameter("mummy","DT_MUMMY");
		request.addParameter("mummyname","DT_MUMMYNAME");
		request.addParameter("mummyjob","DT_MUMMYJOB");
		request.addParameter("mummyphone","DT_MUMMYPHONE");
		request.addParameter("prices","DT_PRICES");
		request.addParameter("history","DT_HISTORY");
		request.addParameter("applyreason","DT_APPLYREASON");
		request.addParameter("yuwem1","22");
		request.addParameter("yuwem2","23");
		request.addParameter("shuxue1","24");
		request.addParameter("shuxue2","25");
		request.addParameter("yingyu1","26");
		request.addParameter("yingyu2","27");
		request.addParameter("wuli1","28");
		request.addParameter("wuli2","29");
		request.addParameter("huaxue1","30");
		request.addParameter("huaxue2","31");
		request.addParameter("zongfen1","32");
		request.addParameter("zongfen2","33");
		request.addParameter("paimin1","34");
		request.addParameter("paimin2","35");
		
		user.setId(100);
		user.setUsername("username");
		user.setEmail("email@e.mail");
		user.setPasswd("hahah");
	
	}
}