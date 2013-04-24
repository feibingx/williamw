package com.zhiweiwang.datong.interceptor;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.model.User;

public class UserAuthenticationInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
    private String[] inFilters;
    private String[] inAdminFilters;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	HttpSession session = request.getSession();
		Object admin = session.getAttribute(DTContants.USER_IN_SESSION);
		String servletPath = request.getServletPath();

		for (String f : inFilters) {
			if (servletPath.contains(f)) {
				if (admin == null) {
					return returnFalse(request, response);
				}
			}
		}
		
		for (String f : inAdminFilters) {
			if (servletPath.contains(f)) {
				if (admin == null || ((User) admin).getRole() == null) {
					return returnFalse(request, response);
				}
			}
		}

		if(servletPath.contains("superadmin")){
			if(admin == null || ((User) admin).getId()!=0){
				return returnFalse(request, response);
			}
		}
		return true;
    }

	private boolean returnFalse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.error("login first !");
		response.addHeader(DTContants.MSG_ERRER, "login first ! bitch!");
		response.sendRedirect(request.getContextPath() + "/login");
		return false;
	}

	public void setInFilters(String[] inFilters) {
		this.inFilters = inFilters;
	}

	public void setInAdminFilters(String[] inAdminFilters) {
		this.inAdminFilters = inAdminFilters;
	}



}
