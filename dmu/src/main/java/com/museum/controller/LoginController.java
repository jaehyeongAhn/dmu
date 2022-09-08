package com.museum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuMemberDAO;
import com.museum.service.EmailServiceImpl;
import com.museum.vo.DmuMemberVO;

@Controller
public class LoginController {

	@Autowired
	private EmailServiceImpl emailService;
	
	/***************************** ���̵� ã�� ***********************************/
	//emailCode.do : �̸��� ������ȣ �߼�
	@ResponseBody
	@RequestMapping(value = "/emailCode.do", method = RequestMethod.POST)
	public String emailCode(String email) {
		return emailService.emailForm(email);
	}
	
	//emailCheck.do : �̸� �� �̸��� ���� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST)
	public String emailCheck(String email, String name) {
		DmuMemberDAO dao = new DmuMemberDAO();
		
		int result = dao.emailCheckId(email, name);

		return String.valueOf(result);
	}
	
	/***************************** ��й�ȣ ã�� **********************************/
	//password_alter.do : ��й�ȣ ó��
	@RequestMapping(value = "/password_alter.do", method = RequestMethod.POST)
	public ModelAndView password_alter(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		DmuMemberDAO dao = new DmuMemberDAO();
		
		//��й�ȣ ������Ʈ
		int result = dao.login_update(vo);

		if(result == 1) {
			mv.addObject("result", result);
			mv.setViewName("/login/login_find");
		}else {
			mv.setViewName("error_page");
		}
		return mv;
	}
	
	//login_pw.do : ��й�ȣ �纯�� ������
	@RequestMapping(value = "/login_pw.do", method = RequestMethod.GET)
	public ModelAndView login_update(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("did", vo.getDid());
		mv.setViewName("/login/login_pw");
		return mv;
	}
	
	//pass_findOk.do : �̸� �� ���̵�, �̸��� ���� Ȯ��
	@RequestMapping(value = "/pass_findOk.do", method = RequestMethod.POST)
	public ModelAndView pass_findOk(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		mv.setViewName("/login/login_pw");
		
		return mv;
	}
	
	//emailCheckPass.do : �̸� �� ���̵�, �̸��� ���� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/emailCheckPass.do", method = RequestMethod.POST)
	public String emailCheckPass(String email, String name, String did) {
		DmuMemberDAO dao = new DmuMemberDAO();

		int result = dao.emailCheckPass(email, name, did);
		
		return String.valueOf(result);
	}
	
	//login_findOk.do : ���̵� ã�� �Ϸ� ������
	@RequestMapping(value = "/login_find.do", method = RequestMethod.GET)
	public String login_findOk(DmuMemberVO vo) {
		return "/login/login_find";
	}
	
	//login_findOk_Check.do : ���̵� ��ȯ
	@RequestMapping(value = "/login_findOk.do", method = RequestMethod.POST)
	public ModelAndView login_findOk_Check(DmuMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		DmuMemberDAO dao = new DmuMemberDAO();

		String result = dao.selectId(vo);

		if(!result.equals("")) {
			mv.addObject("find_information", "���̵�");
			mv.addObject("find_result", result);
			mv.setViewName("/login/login_find");
		}else {
			mv.setViewName("error_page");
		}
		
		return mv;
	}
	
	//login_idfind.do : ���̵�/��й�ȣ ã�� ������ ȣ��
	@RequestMapping(value = "/login_idfind.do", method = RequestMethod.GET)
	public ModelAndView login_idfind(String show) {
		ModelAndView mv = new ModelAndView();
		if(show != null) {
			mv.addObject("show", show);
		}
		mv.setViewName("/login/login_idfind");
		
		return mv;
	}
	
	//login.do : �α��� ������ ȣ��
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(String login_result) {
		return "/login/login";
	}
	
	//�α��� üũ
	@ResponseBody
	@RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	public ModelAndView login_check(DmuMemberVO vo){
		ModelAndView mv = new ModelAndView();
		
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.login(vo);
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
