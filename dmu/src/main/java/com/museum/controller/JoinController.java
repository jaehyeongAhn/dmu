package com.museum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuMemberDAO;
import com.museum.service.JoinServiceImpl;
import com.museum.vo.DmuMemberVO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinServiceImpl joinService;
	/*
	 * join_ok.do : 회원 가입 성공 페이지
	 */
	@RequestMapping(value = "/join_ok.do", method = RequestMethod.GET)
	public String join_ok() {
		return "/join/join_ok";
	}
	
	/*
	 * joinController.do : 회원 가입 성공
	 */
	@RequestMapping(value = "/joinController.do", method = RequestMethod.POST)
	public ModelAndView joinController(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		int result = joinService.join(vo);
		if(result == 1) {
			mv.setViewName("/join/join_ok");
		}else {
			mv.setViewName("error_page");
		}
		return mv;
	}
	
	//idCheck.do : 아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/join_idCheck.do", method = RequestMethod.POST)
	public String idCheck(String mid) {
		int result = joinService.idCheck(mid);
		
		return String.valueOf(result);
	}

	/*
	 * join_terms.do : 회원가입 페이지
	 */
	@RequestMapping(value = "/join_terms.do", method = RequestMethod.GET)
	public String join_terms() {
		return "/join/join_terms";
	}
	
	/*
	 * join_terms_ok.do : 약관 동의 체크
	 */
	@RequestMapping(value = "/join_terms_ok.do", method = RequestMethod.POST)
	public ModelAndView join_terms_ok(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		mv.setViewName("/join/join");
		
		return mv;
	}
	
	/*
	 * join.do : 회원가입 페이지
	 */
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		return "/join/join";
	}
	
}
