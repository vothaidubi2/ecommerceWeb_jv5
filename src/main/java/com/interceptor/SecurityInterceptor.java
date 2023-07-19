package com.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.entities.Account;

@Service
public class SecurityInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)	throws Exception {
		HttpSession session = request.getSession();
		String uri =  request.getRequestURI();
		if(session.getAttribute("currentuser") == null){
			response.sendRedirect("/account/login");
			return false;
		}
		else if(!session.getAttribute("currentrole").toString().equals("1") && uri.startsWith("/admin/")) {
			response.sendRedirect("/account/login");
			return false;
		}
		return true;
	}
}
