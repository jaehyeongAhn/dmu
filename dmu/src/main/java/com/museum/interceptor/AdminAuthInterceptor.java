package com.museum.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.museum.vo.DmuSessionVO;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception{
		
		HttpSession session = request.getSession();
		DmuSessionVO member = (DmuSessionVO)session.getAttribute("member");
		
		if(member == null) {
			response.sendRedirect("http://localhost:9000/dmu/login.do");
			return false;
		}else{
			if(!member.getStatus().equals("admin")) {
				response.sendRedirect("http://localhost:9000/dmu/login.do");
				return false;
			}
		}
		return true;
	}
	
}
