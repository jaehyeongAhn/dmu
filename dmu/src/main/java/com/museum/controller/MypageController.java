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

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.museum.service.LoginServiceImpl;
import com.museum.service.MypageServiceImpl;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuSessionVO;

@Controller
public class MypageController {
	
	@Autowired
	private LoginServiceImpl loginService;
	
	@Autowired
	private MypageServiceImpl mypageService;
	
	//mypage_main.do : ���������� ����
	@RequestMapping(value = "/mypage_main.do", method = RequestMethod.GET)
	public String mypage_main() {
		return "/mypage/mypage_main";
	}
	
	//mypage_member.do : ���������� �������� ����/Ż��
	@RequestMapping(value = "/mypage_member.do", method = RequestMethod.GET)
	public ModelAndView mypage_member(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		DmuSessionVO member = (DmuSessionVO)session.getAttribute("member");
		DmuMemberVO vo = mypageService.memberContent(member.getMid());
		
		if(vo != null) {
			mv.addObject("vo", vo);
			mv.setViewName("/mypage/mypage_member");
		}else {
			mv.setViewName("/error_page");
		}
		
		return mv;
	}
	
	//mypage_member_check.do : ���������� �������� ����/Ż�� �� ��й�ȣ üũ ������
	@RequestMapping(value = "/mypage_member_check.do", method = RequestMethod.GET)
	public String mypage_member_check() {
		return "/mypage/mypage_member_check";
	}
	
	//mypage_member_confirm.do : ���������� �������� ����/Ż�� �� ��й�ȣ üũ
	@ResponseBody
	@RequestMapping(value = "/mypage_member_confirm.do", method = RequestMethod.POST)
	public String mypage_member_confirm(String pass, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		DmuMemberVO vo = new DmuMemberVO();
		DmuSessionVO member = (DmuSessionVO)session.getAttribute("member");
		vo.setMid(member.getMid());
		vo.setPass(pass);
		
		DmuSessionVO result = loginService.login(vo);
		
		JsonObject jobject = new JsonObject();
		Gson gson = new Gson();
		
		if(result != null) {
			if(result.getLoginresult() == 1) {
				//mv.setViewName("/mypage/mypage_member");
				jobject.addProperty("check_result", "success");
			}
		}else {
			//mv.addObject("member_check_result", "fail");
			//mv.setViewName("/mypage/mypage_member_check");
			
			jobject.addProperty("check_result", "fail");
		}
		
		return gson.toJson(jobject);
	}
	
	//mypage_ticket.do : ���������� Ƽ�� ����
	@RequestMapping(value = "/mypage_ticket.do", method = RequestMethod.GET)
	public String mypage_ticket() {
		return "/mypage/mypage_ticket";
	}
	
	//mypage_ticket_content.do : ���������� Ƽ�� ���� �󼼺���
	@RequestMapping(value = "/mypage_ticket_content.do", method = RequestMethod.GET)
	public String mypage_ticket_content() {
		return "/mypage/mypage_ticket_content";
	}
	
	//mypage_inquire.do : ���������� ���� ����
	@RequestMapping(value = "/mypage_inquire.do", method = RequestMethod.GET)
	public String mypage_inquire() {
		return "/mypage/mypage_inquire";
	}
	
	//mypage_review.do : ���������� ����
	@RequestMapping(value = "/mypage_review.do", method = RequestMethod.GET)
	public String mypage_review() {
		return "/mypage/mypage_review";
	}
	
	//delete_member.do : ȸ�� Ż��
	@RequestMapping(value = "/delete_member.do", method = RequestMethod.POST)
	public ModelAndView delete_member(String mid, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = mypageService.memberUnregister(mid);
		if(result == 1) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			//��Ű ����
			Cookie[] cookieList = request.getCookies();
			for(Cookie list : cookieList) {
				if(list.getName().equals("rememberId")) {
					list.setMaxAge(0);
					response.addCookie(list);
				}
			}
			
			mv.setViewName("/mypage/mypage_member_unregister");
		}else {
			mv.setViewName("/error_page");
		}
		return mv;
	}
	
	//ȸ�� Ż�� ���� �ȳ� ������
	@RequestMapping(value = "/mypage_member_unregister.do", method = RequestMethod.GET)
	public String delete_member() {
		return "/mypage/mypage_member_unregister";
	}
	
	//
}
