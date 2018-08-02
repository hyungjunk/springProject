package com.jun.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SampleInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws Exception { //Handler는 현재 실행하려는 메소드 자체. 즉, preHandle의 대상
		System.out.println("pre handle....");

		HandlerMethod method = (HandlerMethod) handler; // handler(실행하는 메소드)를 HandlerMethod로 캐스팅
		Method methodObj = method.getMethod();
		
		System.out.println("Bean: " + method.getBean());	// 현재 실행되는 Bean 노출
		System.out.println("Method "+ methodObj);			// 현재 실행되는 Method 노출
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView modelAndView) throws Exception {
		System.out.println("post handle...");
		
		Object result = modelAndView.getModel().get("result");
		System.out.println("Interceptor result "+result);
		if(result!=null) {
			request.getSession().setAttribute("result", result);
			response.sendRedirect("/doB");
		}
	}
	
}
