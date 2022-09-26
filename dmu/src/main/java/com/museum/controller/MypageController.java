package com.museum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	//mypage_main.do : 마이페이지 메인
	@RequestMapping(value = "/mypage_main.do", method = RequestMethod.GET)
	public String mypage_main() {
		return "/mypage/mypage_main";
	}
	
	//mypage_member.do : 마이페이지 개인정보 변경/탈퇴
	@RequestMapping(value = "/mypage_member.do", method = RequestMethod.GET)
	public String mypage_member() {
		return "/mypage/mypage_member";
	}
	
	//mypage_member_check.do : 마이페이지 개인정보 변경/탈퇴 전 비밀번호 체크
	@RequestMapping(value = "/mypage_member_check.do", method = RequestMethod.GET)
	public String mypage_member_check() {
		return "/mypage/mypage_member_check";
	}
	
	//mypage_ticket.do : 마이페이지 티켓 예매
	@RequestMapping(value = "/mypage_ticket.do", method = RequestMethod.GET)
	public String mypage_ticket() {
		return "/mypage/mypage_ticket";
	}
	
	//mypage_ticket_content.do : 마이페이지 티켓 예매 상세보기
	@RequestMapping(value = "/mypage_ticket_content.do", method = RequestMethod.GET)
	public String mypage_ticket_content() {
		return "/mypage/mypage_ticket_content";
	}
	
	//mypage_review.do : 마이페이지 티켓 예매
	@RequestMapping(value = "/mypage_review.do", method = RequestMethod.GET)
	public String mypage_review() {
		return "/mypage/mypage_review";
	}
}
