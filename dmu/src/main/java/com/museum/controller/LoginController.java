package com.museum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuMemberDAO;
import com.museum.vo.DmuMemberVO;

@Controller
public class LoginController {
	
	//login_check.do : �α��� ó��
	@RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	public ModelAndView login_check(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.login(vo);

		if(result == 1) {
			//���� �� �Ѿ
			mv.setViewName("index");
		}else {
			mv.addObject("login_result", result);
			mv.setViewName("/login/login");
		}
		return mv;
	}
	
	//login.do : �α��� ������ ȣ��
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
}
