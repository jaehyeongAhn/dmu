package com.museum.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.museum.service.EmailServiceImpl;
import com.museum.service.LoginServiceImpl;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuSessionVO;

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
		DmuSessionVO pw_result = loginService.login(vo);
		if(pw_result == null){
			int result = loginService.loginUpdate(vo);
			if(result == 1) {
				mv.addObject("result", result);
				mv.setViewName("/login/login_find");
			}else {
				mv.setViewName("error_page");
			}
		}else {
			mv.addObject("vo", vo);
			mv.addObject("pw_result", pw_result.getLoginresult());
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
	public ModelAndView login_check(DmuMemberVO vo, HttpServletRequest request, 
									HttpServletResponse response, boolean rememberId) throws Exception {
		ModelAndView mv = new ModelAndView();

		DmuSessionVO member = loginService.login(vo);
		
		if(member != null) {
			//운영자 및 일반 회원 구분
			if(!member.getStatus().equals("public") && !member.getStatus().equals("admin")) {
				//운영자 확인
				if(member.getStatus().equals("accept")) {
					mv.addObject("login_result", "accept");
					mv.setViewName("/login/login");
				}
			} else {
				//일반회원일 시
				if(member.getLoginresult() == 1) {
					//세션 저장
					HttpSession session = request.getSession();
					session.setAttribute("member", member);
					
					//쿠키 저장 여부 확인
					Cookie cookie = new Cookie("rememberId", vo.getMid());
					Cookie[] cookieList = request.getCookies();
					for(Cookie list : cookieList) {
						//쿠키가 존재하지 않을 시
						if(!list.getName().equals("rememberId")) {
							if(rememberId) {
								//체크 박스 true 시, cookie 저장
								cookie.setMaxAge(7 * 24 * 60 * 60); //초 단위, 일주일동안 쿠키 저장
								response.addCookie(cookie);
							}
						}else {
							//체크 박스 false 시, cookie 삭제
							if(!rememberId) {
								cookie.setMaxAge(0);
								response.addCookie(cookie);
							}
						}
					}
					
					mv.addObject("login_result", member.getLoginresult());
					mv.setViewName("index");
				}
			}
		}else {
			mv.addObject("login_result", "fail");
			mv.setViewName("/login/login");
		}

		return mv;
	}
	
	//logout.do : 로그아웃
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if(session != null) {
			session.invalidate();
		}
		
		mv.setViewName("/index");
		
		return mv;
	}
}
