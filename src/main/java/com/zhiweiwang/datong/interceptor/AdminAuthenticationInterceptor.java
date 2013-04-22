package com.zhiweiwang.datong.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.model.User;

public class AdminAuthenticationInterceptor extends HandlerInterceptorAdapter {

	private String[] inFilters;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Object admin = session.getAttribute(DTContants.USER_IN_SESSION);
		String servletPath = request.getServletPath();

		for (String f : inFilters) {
			if (servletPath.contains(f)) {
				if (admin == null || ((User) admin).getRole() == null) {
					logger.error("login first ! bitch!");
					response.addHeader(DTContants.MSG_ERRER, "login first ! bitch!");
					response.sendRedirect(request.getContextPath() + "/login");
					return false;
				}
			}
		}

		return true;
	}

	public void setInFilters(String[] inFilters) {
		this.inFilters = inFilters;
	}

}
