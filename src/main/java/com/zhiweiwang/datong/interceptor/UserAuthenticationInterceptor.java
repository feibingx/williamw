package com.zhiweiwang.datong.interceptor;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.SysConfContants;
import com.zhiweiwang.datong.mapper.SysconfMapper;
import com.zhiweiwang.datong.model.User;

public class UserAuthenticationInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
    private String[] inFilters;
    private String[] inAdminFilters;

    private SysconfMapper sysconfMapper;
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	HttpSession session = request.getSession();
		Object userinsession = session.getAttribute(DTContants.USER_IN_SESSION);
		String servletPath = request.getServletPath();

		for (String f : inFilters) {
			if (servletPath.contains(f)) {
				if (userinsession == null) {
					return returnFalse(request, response);
				}
				
				String phase = sysconfMapper.getValue(SysConfContants.SYSPHASE);
				
				if(phase != null && phase.equals(SysConfContants.eSYSPHASE.applying)){
					
				}else{
					response.addHeader(DTContants.MSG_ERRER, "login first ! bitch!");
					response.sendRedirect(request.getContextPath() + "/info/"+phase);
					return false;
				}
			}
		}
		
		for (String f : inAdminFilters) {
			if (servletPath.contains(f)) {
				if (userinsession == null || ((User) userinsession).getRole() == null) {
					return returnFalse(request, response);
				}
			}
		}

		if(servletPath.contains("superadmin")){
			if(userinsession == null || ((User) userinsession).getId()!=0){
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

	public SysconfMapper getSysconfMapper() {
		return sysconfMapper;
	}

	public void setSysconfMapper(SysconfMapper sysconfMapper) {
		this.sysconfMapper = sysconfMapper;
	}



}
