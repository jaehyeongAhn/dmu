package com.museum.controller;

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
}
