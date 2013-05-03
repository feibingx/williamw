package com.zhiweiwang.datong.controller;

import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.DTUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import static com.zhiweiwang.datong.DTContants.QUERY_CONF;

@Controller
@SessionAttributes(QUERY_CONF)
public class SearchController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private String[] conditions = { "name", "number", "pid", "gradeschool" };
	private String[] resultnames = { "pid", "name", "sex", "gradeschool", "sts" };
	@Autowired
	private DataSource datasource;

	@RequestMapping(value = "/search", method = POST)
	@ModelAttribute("dtstudentlist")
	@ResponseBody
	public ModelAndView post(HttpServletRequest request) {

		ModelAndView mav = null;
		Connection conn = null;
		Statement statement = null;
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		boolean where = false;
		try {
			StringBuffer query = new StringBuffer("select * FROM dt_students");

			for (String c : conditions) {
				String param = request.getParameter(c);
				if (param != null && param.trim().length() > 0) {
					if(DTUtils.regexMatches(param) == false){
						//包含特殊字符，不能进行sql
						mav = new ModelAndView();
						mav.addObject(DTContants.MSG_ERRER, DTMessage.SEARCH_INVALID);
						mav.addObject(DTContants.RET_VIEWER, "admin");
						mav.setViewName("redirect:/message");
						return mav;
					}
					if (where == false) {
						query.append(" where ");
						query.append(c + " Like '%" + param + "%'");
						where = true;
					} else {
						query.append(" and ");
						query.append(c + " Like '%" + param + "%'");
					}
				}
			}
			
			if(where == false){
				// 没有带上任何查询条件 报错
				mav = new ModelAndView();
				mav.addObject(DTContants.MSG_ERRER, DTMessage.SEARCH_WITH_NO_WHERE);
				mav.setViewName("redirect:/message");
				return mav;
			}
			conn = datasource.getConnection();
			statement = conn.createStatement();

			logger.debug("### SQL QUERY ### \n{}", new Object[] { query });
			ResultSet result = statement.executeQuery(query.toString());
			while (result.next()) {
				Map<String, Object> row = new HashMap<String, Object>();
				for (String rname : resultnames) {
					
					row.put(rname, result.getObject(rname));
				}
				row.put("id", result.getInt("id"));
				resultList.add(row);
			}
		} catch (SQLException e) {

			try {
				conn.close();
			} catch (Exception ex) {
				e.printStackTrace();
			}
			e.printStackTrace();
		}

		return new ModelAndView("search","dtstudentlist",resultList);

	}

	@RequestMapping(value = "/search", method = GET)
	public void get() {
	}
}