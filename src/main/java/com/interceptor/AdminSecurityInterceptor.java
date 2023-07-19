package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.dao.SessionService;
import com.entities.Account;

@Service
public class AdminSecurityInterceptor implements HandlerInterceptor{
	@Autowired
	SessionService session;
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)throws Exception {
//		HttpSession session = request.getSession();
		request.setAttribute("uri", request.getRequestURI());
		Account user = session.get("currentuser");
		if(user == null && user.getRole() != 1) {
			response.sendRedirect("/account/login");
			return false;
		}
		return true;
	}
}
