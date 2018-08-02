package com.jun.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	
	private void saveDest(HttpServletRequest req) {
		// temporarily save the original destination
		String uri = req.getRequestURI();
		logger.info(uri);
		String query = req.getQueryString();
		logger.info(query);
		
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		if (req.getMethod().equals("GET")) {
			logger.info("dest: " + (uri+query));
			req.getSession().setAttribute("dest", uri+query);
		}
	}
		
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception{
		
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			logger.info("user is not logged in");
			saveDest(request);
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}
}
