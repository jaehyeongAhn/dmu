package com.museum.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuSessionVO;

@Controller
public class MypageController {
	
	@Autowired
	private LoginServiceImpl loginService;
	
	@Autowired
	private MypageServiceImpl mypageService;
	
	/**************** ���� ******************/
	//mypage_main.do : ���������� ����
	@RequestMapping(value = "/mypage_main.do", method = RequestMethod.GET)
	public String mypage_main() {
		return "/mypage/mypage_main";
	}
	
	
	
	/******************** ���� ��� ***********************/
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
	
	
	/******************** ���� ���� ***********************/
	//mypage_inquire.do : ���������� ���� ����
	@RequestMapping(value = "/mypage_inquiry.do", method = RequestMethod.GET)
	public ModelAndView mypage_inquiry(HttpSession session, String rpage, String inquiry_write_result) {
		ModelAndView mv = new ModelAndView();
		
		DmuSessionVO member = (DmuSessionVO)session.getAttribute("member");
		HashMap<String, Integer> param = (HashMap<String, Integer>)getPageResult(member.getMid(), rpage);
		ArrayList<DmuInquiryVO> list = (ArrayList<DmuInquiryVO>)mypageService.getInquiryList(param.get("startCount"), param.get("endCount"), member.getMid());
		
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("rpage", param.get("rpage"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("inquiry_write_result", inquiry_write_result);
		mv.setViewName("/mypage/mypage_inquiry");
		
		return mv;
	}
	
	//mypage_inquiry_write.do : ���������� ���� ���
	@RequestMapping(value = "/mypage_inquiry_write.do", method = RequestMethod.POST)
	public ModelAndView mypage_inquiry_write(HttpServletRequest request, DmuInquiryVO vo) {
		ModelAndView mv = new ModelAndView();
		
		//vo�� ȸ�� ���� ����
		HttpSession session = request.getSession();
		DmuSessionVO member = (DmuSessionVO)session.getAttribute("member");
		vo.setMid(member.getMid());
		
		int result = mypageService.inquiryInsert(vo);
		if(result == 1) {
			//mv.addObject("inquiry_write_result", "ok");
			mv.setViewName("redirect:/mypage_inquiry.do?inquiry_write_result=ok");
		}else {
			mv.setViewName("error_page");
		}
		
		return mv;
	}
	
	//mypage_inquiry_content.do : ����������
	@ResponseBody
	@RequestMapping(value = "/mypage_inquiry_content.do", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String mypage_inquiry_content(String iqid) {
		DmuInquiryVO vo = mypageService.getInquiryContent(iqid);
		vo.setIqcontent(vo.getIqcontent().replace("\r\n", "<br/>"));
		
		JsonObject jobject = new JsonObject();
		Gson gson = new Gson();

		jobject.addProperty("iqid", vo.getIqid());
		jobject.addProperty("iqcategory", vo.getIqcategory());
		jobject.addProperty("iqtype", vo.getIqtype());
		jobject.addProperty("iqtitle", vo.getIqtitle());
		jobject.addProperty("iqcontent", vo.getIqcontent());
		jobject.addProperty("iqanswer", vo.getIqanswer());
		jobject.addProperty("iqdate", vo.getIqdate());
		
		return gson.toJson(jobject);
	}
	
	//mypage_review.do : ���������� ����
	@RequestMapping(value = "/mypage_review.do", method = RequestMethod.GET)
	public String mypage_review() {
		return "/mypage/mypage_review";
	}

	
	/**************** �������� ���� Ż�� ******************/
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
	
	//update_info.do : ȸ�� ���� ������Ʈ
	@ResponseBody
	@RequestMapping(value = "/update_info.do", method = RequestMethod.POST)
	public String update_info(HttpSession session, String type, DmuMemberVO vo) {
		DmuSessionVO member = (DmuSessionVO) session.getAttribute("member");
		vo.setMid(member.getMid());
		
		//��й�ȣ üũ
		JsonObject jobject = new JsonObject();
		Gson gson = new Gson();

		if(type.equals("password")) {
			DmuSessionVO check_reuslt = loginService.login(vo);
			if(check_reuslt == null) {
				//ȸ�� ���� ����
				int update_result = mypageService.memberUpdate(vo, type);
				if(update_result == 1) {
					jobject.addProperty("update_result", "success");
				}else {
					jobject.addProperty("update_result", "fail");
				}
			}else {
				jobject.addProperty("update_result", "exist");
			}
		}else {
			int update_result = mypageService.memberUpdate(vo, type);
			if(update_result == 1) {
				jobject.addProperty("update_result", "success");
			}
		}
			
		return gson.toJson(jobject);
	}
	
	//mypage_member_unregister.do : ȸ�� Ż�� ���� �ȳ� ������
	@RequestMapping(value = "/mypage_member_unregister.do", method = RequestMethod.GET)
	public String delete_member() {
		return "/mypage/mypage_member_unregister";
	}
	
	//pageService - Session ó���� �ʿ��ϹǷ� ������ �޼ҵ� ����
	public Map<String,Integer> getPageResult(String mid, String rpage) {
		Map<String,Integer> param =new HashMap<String,Integer>();

		int startCount = 0;
		int endCount = 0;
		int pageSize = 3;	 
		int reqPage = 1;	
		int pageCount = 1;	
		int dbCount = mypageService.getInquiryTotalCount(mid);	
		
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("dbCount", dbCount);
		param.put("pageSize", pageSize);
		param.put("pageCount", pageCount);
		param.put("rpage", reqPage);
		
		return param;
			
	 }
}
