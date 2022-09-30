package com.museum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuMemberDAO;
import com.museum.service.EmailServiceImpl;
import com.museum.service.LoginServiceImpl;
import com.museum.vo.DmuMemberVO;

@Controller
public class LoginController {

	@Autowired
	private EmailServiceImpl emailService;
	
	@Autowired
	private LoginServiceImpl loginService;
	
	/***************************** 아이디 찾기 ***********************************/
	//emailCode.do : 이메일 인증번호 발송
	@ResponseBody
	@RequestMapping(value = "/emailCode.do", method = RequestMethod.POST)
	public String emailCode(String email) {
		return emailService.emailForm(email);
	}
	
	//emailCheck.do : 이름 및 이메일 존재 확인
	@ResponseBody
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST)
	public String emailCheck(String email, String name) {
		int result = loginService.emailCheckId(email, name);

		return String.valueOf(result);
	}
	
	/***************************** 비밀번호 찾기 **********************************/
	//password_alter.do : 비밀번호 처리
	@RequestMapping(value = "/password_alter.do", method = RequestMethod.POST)
	public ModelAndView password_alter(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		//비밀번호 업데이트
		int pw_result = loginService.login(vo);
		if(pw_result == 0){
			int result = loginService.loginUpdate(vo);
			if(result == 1) {
				mv.addObject("result", result);
				mv.setViewName("/login/login_find");
			}else {
				mv.setViewName("error_page");
			}
		}else {
			mv.addObject("vo", vo);
			mv.addObject("pw_result", pw_result);
			mv.setViewName("/login/login_pw");
		}
		
		return mv;
	}
	
	//login_pw.do : 비밀번호 재변경 페이지
	@RequestMapping(value = "/login_pw.do", method = RequestMethod.GET)
	public ModelAndView login_pw(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("mid", vo.getMid());
		mv.setViewName("/login/login_pw");
		return mv;
	}
	
	//pass_findOk.do : 이름 및 아이디, 이메일 존재 확인
	@RequestMapping(value = "/pass_findOk.do", method = RequestMethod.POST)
	public ModelAndView pass_findOk(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		mv.setViewName("/login/login_pw");
		
		return mv;
	}
	
	//emailCheckPass.do : 이름 및 아이디, 이메일 존재 확인
	@ResponseBody
	@RequestMapping(value = "/emailCheckPass.do", method = RequestMethod.POST)
	public String emailCheckPass(String email, String name, String mid) {
		int result = loginService.emailCheckPass(email, name, mid);
		
		return String.valueOf(result);
	}
	
	//login_findOk.do : 아이디 찾기 완료 페이지
	@RequestMapping(value = "/login_find.do", method = RequestMethod.GET)
	public ModelAndView login_findOk(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
			mv.addObject("find_information", "회원");
			mv.addObject("find_result", "tester");
			mv.setViewName("/login/login_find");
		
		return mv;
		//return "/login/login_find";
	}
	
	//login_findOk_Check.do : 아이디 반환
	@RequestMapping(value = "/login_findOk.do", method = RequestMethod.POST)
	public ModelAndView login_findOk_Check(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();

		String result = loginService.findId(vo);

		if(!result.equals("")) {
			mv.addObject("find_information", vo.getMname());
			mv.addObject("find_result", result);
			mv.setViewName("/login/login_find");
		}else {
			mv.setViewName("error_page");
		}
		
		return mv;
	}
	
	//login_idfind.do : 아이디/비밀번호 찾기 페이지 호출
	@RequestMapping(value = "/login_idfind.do", method = RequestMethod.GET)
	public ModelAndView login_idfind(String show) {
		ModelAndView mv = new ModelAndView();
		if(show != null) {
			mv.addObject("show", show);
		}
		mv.setViewName("/login/login_idfind");
		
		return mv;
	}
	
	//login.do : 로그인 페이지 호출
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(String login_result) {
		return "/login/login";
	}
	
	//로그인 체크
	@ResponseBody
	@RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	public ModelAndView login_check(DmuMemberVO vo){
		ModelAndView mv = new ModelAndView();

		int result = loginService.login(vo);
		if(result == 1) {
			mv.addObject("login_result", result);
			mv.setViewName("index");
		}else {
			mv.addObject("login_result", result);
			mv.setViewName("/login/login");
		}

		return mv;
	}
}
