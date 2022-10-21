package com.museum.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.museum.vo.DmuSessionVO;

public class MasterAuthInterceptor extends HandlerInterceptorAdapter{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception{
		
		HttpSession session = request.getSession();
		DmuSessionVO member = (DmuSessionVO)session.getAttribute("member");
		
		if(member == null) {
			response.sendRedirect("http://localhost:9000/dmu/login.do");
			return false;
		}else{
			if(!member.getMid().equals("master")) {
				response.sendRedirect("http://localhost:9000/dmu/adminpage_main.do");
				return false;
			}
		}
		return true;
	}
	
}
