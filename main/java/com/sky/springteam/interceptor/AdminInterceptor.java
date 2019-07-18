package com.sky.springteam.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sky.springteam.model.user.dto.UserDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/user/login.go?message1=havetologin");
			
			return false;
		} else {
			
			UserDTO dto = (UserDTO)session.getAttribute("user");
			
			if(dto.getUser_group() == "1") {
				
				session.invalidate();
				response.sendRedirect(request.getContextPath() + "/user/login.go?message1=havetologin");
				
				return false;
			} else {
				
				return true;
			}
		}
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}
