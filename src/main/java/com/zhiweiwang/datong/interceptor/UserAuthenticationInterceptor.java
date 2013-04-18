package com.zhiweiwang.datong.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.zhiweiwang.datong.DTContants;

public class UserAuthenticationInterceptor extends HandlerInterceptorAdapter {

    private String[] noFilters;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object user = session.getAttribute(DTContants.USER_IN_SESSION);
        String servletPath = request.getServletPath();

        for (String f : noFilters) {
            if (servletPath.contains(f)) {
                return true;
            }
        }

        if (user != null) {
            return true;
        }

        response.sendRedirect(request.getContextPath() + "/login");
        return false;
    }

    public void setNoFilters(String[] noFilters) {
        this.noFilters = noFilters;
    }

}
