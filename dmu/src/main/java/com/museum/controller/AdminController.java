package com.museum.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.museum.dao.DmuAdminDAO;
import com.museum.dao.DmuNoticeDAO;
import com.museum.service.AdminServiceImpl;
import com.museum.service.NoticeServiceImpl;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuReJoinVO;
@Controller
public class AdminController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	@Autowired
	private AdminServiceImpl adminService;

	/******************
	 * 
	 * admin_notice
	 *
	 ******************/

	@RequestMapping(value = "/admin_notice_list.do", method = RequestMethod.GET)
	public ModelAndView admin_notice_list(String rpage) {
		//String rpage = request.getParameter("rpage");
		ModelAndView mv = new ModelAndView();
		
		DmuNoticeDAO dao = new DmuNoticeDAO();
		
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 3;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = noticeService.getTotalCount();	//DB에서 가져온 전체 행수
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		
		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		
	ArrayList<DmuNoticeVO> list = noticeService.getList(startCount, endCount);

	
	mv.addObject("list", list);
	mv.addObject("dbCount", dbCount);
	mv.addObject("pageSize", pageSize);
	mv.addObject("rpage", reqPage);
	mv.setViewName("/admin/admin_notice/admin_notice_list");

		
		return mv;
		
	}

	

	@RequestMapping(value = "/admin_notice_write.do", method = RequestMethod.GET)
	public String admin_notice_write() {
		return "/admin/admin_notice/admin_notice_write";
	}

	/*
	 * admin_notice_write_check.do : 공지사항 글쓰기
	 */
	
	@RequestMapping(value = "/admin_notice_write_check.do", method = RequestMethod.POST)
	public ModelAndView admin_notice_write_check(DmuNoticeVO vo){
		ModelAndView mv = new ModelAndView();
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = noticeService.getWriteResult(vo);
		if(result == 1){
			mv.setViewName("redirect:/admin_notice_list.do");
		}else{
			mv.setViewName("error_page");
		}
		return mv;
	}

	/*
	 * admin_notice_content.do : 공지사항 상세보기
	 */
	
	@RequestMapping(value = "/admin_notice_content.do", method = RequestMethod.GET)
	public ModelAndView admin_notice_content(String nid) {
		ModelAndView mv = new ModelAndView();
		DmuNoticeDAO dao = new DmuNoticeDAO();
		DmuNoticeVO vo = noticeService.getContent(nid);
		vo.setNcontent(vo.getNcontent().replace("\r\n", "<br/>"));
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_notice/admin_notice_content");
		
		return mv;
	}

	
	/*
	 * admin_notice_update.do : 수정하기 페이지
	 */
	@RequestMapping(value = "/admin_notice_update.do", method = RequestMethod.GET)
	public ModelAndView admin_notice_update(String nid) {
		ModelAndView mv = new ModelAndView();
		
		DmuNoticeDAO dao = new DmuNoticeDAO();
		DmuNoticeVO vo = noticeService.getContent(nid);
		
		mv.addObject("vo", vo);
		mv.setViewName("admin/admin_notice/admin_notice_update");
		
		return mv;
	}
	
	/*
	 * admin_notice_update_check.do 
	 */
	
	@RequestMapping(value = "/admin_notice_update_check.do", method = RequestMethod.POST)
	public ModelAndView admin_notice_update_check(DmuNoticeVO vo) {
		ModelAndView mv = new ModelAndView();
		
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = noticeService.getUpdateResult(vo);
		if(result == 1){
			mv.setViewName("redirect:/admin_notice_list.do");
		}else{
			mv.setViewName("error_page");
		}
		return mv;
		
		
	}
	
	/*
	 * admin_notice_delete.do : 삭제 페이지
	 */
	
	@RequestMapping(value = "/admin_notice_delete.do", method = RequestMethod.GET)
	public ModelAndView admin_notice_delete(String nid) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("nid", nid);
		mv.setViewName("admin/admin_notice/admin_notice_delete");
		
		return mv;
		
	}
	
	/*
	 * admin_notice_delect_check.do
	 */
	@RequestMapping(value = "/admin_notice_delete_check.do", method = RequestMethod.POST)
	public ModelAndView admin_notice_delete_check(String nid) {
		ModelAndView mv = new ModelAndView();
		
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = noticeService.getDeleteResult(nid);
		
		if(result == 1) {
			mv.setViewName("redirect:/admin_notice_list.do");
		}else {
			mv.setViewName("error_page");
		}
		
		return mv;
		
		
		
	}

	
	/******************
	 * 
	 * admin_page
	 *
	 ******************/
	
	
	//adminpage_main 
	@RequestMapping(value = "/adminpage_main.do", method = RequestMethod.GET)
	public String adminpage_main() {
		return "/admin/adminpage_main";
	}
	

	
	@RequestMapping(value = "/adminpage_member_list.do", method = RequestMethod.GET)
	public ModelAndView adminpage_member_list(String rpage) {
		ModelAndView mv = new ModelAndView();

		DmuAdminDAO dao = new DmuAdminDAO();

		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = adminService.getTotalCount_public();	//DB에서 가져온 전체 행수

		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}


		ArrayList<DmuMemberVO> plist = adminService.publicList(startCount, endCount);
//		String address = mlist.get(0).getAddr1() + " " + mlist.get(0).getAddr2();
		

		mv.addObject("list", plist);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("rpage", reqPage);
//		mv.addObject("address", address);
		mv.setViewName("/admin/admin_member/adminpage_member_list");

		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/adminpage_member_list_detail.do", method= RequestMethod.POST, produces="test/plain;charset=UTF-8")
	public String adminpage_member_list_detail(String mid) {
		DmuMemberVO mvo = adminService.memberContent(mid);
		
		JsonObject jo = new JsonObject();
		Gson gson = new Gson();
		jo.addProperty("mid", mid);
		jo.addProperty("mname", mvo.getMname());
		jo.addProperty("pnumber", mvo.getPnumber());
		jo.addProperty("email", mvo.getEmail());
		jo.addProperty("birth", mvo.getBirth());
		jo.addProperty("address", mvo.getAddress());
		jo.addProperty("gender", mvo.getGender());
		jo.addProperty("nationality", mvo.getNationality());
		jo.addProperty("unregister", mvo.getUnregister());
		jo.addProperty("ddate", mvo.getDdate());
		
		return gson.toJson(jo);
		
		
	}
	
	@RequestMapping(value = "/adminpage_admin_list.do", method = RequestMethod.GET)
	public ModelAndView adminpage_admin_list(String rpage) {
		ModelAndView mv = new ModelAndView();

		DmuAdminDAO dao = new DmuAdminDAO();

		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = adminService.getTotalCount_admin();	//DB에서 가져온 전체 행수

		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}


		ArrayList<DmuMemberVO> alist = adminService.adminList(startCount, endCount);
//		String address = mlist.get(0).getAddr1() + " " + mlist.get(0).getAddr2();
		

		mv.addObject("list", alist);
		mv.addObject("dbCount", dbCount);
		mv.addObject("pageSize", pageSize);
		mv.addObject("rpage", reqPage);
//		mv.addObject("address", address);
		mv.setViewName("/admin/admin_member/adminpage_admin_list");

		return mv;
	}
	
	
	/*
	 * 어드민 회원 페이지 (관리자만)
	 */
	
	
	@ResponseBody
	@RequestMapping(value="/adminpage_admin_list_detail.do", method= RequestMethod.POST, produces="test/plain;charset=UTF-8")
	public String adminpage_admin_list_detail(String mid) {
		DmuMemberVO mvo = adminService.memberContent_admin(mid);
		
		JsonObject jo = new JsonObject();
		Gson gson = new Gson();
		jo.addProperty("mid", mid);
		jo.addProperty("mname", mvo.getMname());
		jo.addProperty("pnumber", mvo.getPnumber());
		jo.addProperty("email", mvo.getEmail());
		jo.addProperty("birth", mvo.getBirth());
		jo.addProperty("address", mvo.getAddress());
		jo.addProperty("gender", mvo.getGender());
		jo.addProperty("nationality", mvo.getNationality());
		jo.addProperty("unregister", mvo.getUnregister());
		jo.addProperty("ddate", mvo.getDdate());
		jo.addProperty("status", mvo.getStatus());
		
		return gson.toJson(jo);
		
		
	}
	
	
	@RequestMapping(value="/acceptUpdate.do", method= RequestMethod.POST)
	public ModelAndView acceptUpdate(String mid) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = adminService.updateStatus(mid);
		
		if(result == 1) {
			mv.setViewName("redirect:/adminpage_admin_list.do");
		}else {
			mv.setViewName("error_page");			
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
		@RequestMapping(value = "/adminpage_reservation_list.do", method = RequestMethod.GET)
		public ModelAndView adminpage_reservation_list(String rpage) {
			ModelAndView mv = new ModelAndView();		 

			//페이징 처리 - startCount, endCount 구하기
			int startCount = 0;
			int endCount = 0;
			int pageSize = 5;	//한페이지당 게시물 수
			int reqPage = 1;	//요청페이지	
			int pageCount = 1;	//전체 페이지 수
			int dbCount = adminService.getTotalCount_reservation();	//DB에서 가져온 전체 행수

			//총 페이지 수 계산
			if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}

			//요청 페이지 계산
			if(rpage != null){
				reqPage = Integer.parseInt(rpage);
				startCount = (reqPage-1) * pageSize+1;
				endCount = reqPage *pageSize;
			}else{
				startCount = 1;
				endCount = pageSize;
			}


			ArrayList<DmuMemberVO> mlist = adminService.reservationList(startCount, endCount);
//			String address = mlist.get(0).getAddr1() + " " + mlist.get(0).getAddr2();
			

			mv.addObject("list", mlist);
			mv.addObject("dbCount", dbCount);
			mv.addObject("pageSize", pageSize);
			mv.addObject("rpage", reqPage);
//			mv.addObject("address", address);
			mv.setViewName("/admin/admin_member/adminpage_reservation_list");

			return mv;
		}
	
		@ResponseBody
		@RequestMapping(value="/adminpage_reservation_list_detail.do", method= RequestMethod.POST, produces="test/plain;charset=UTF-8")
		public String adminpage_reservation_list_detail(String mid) {
			DmuReJoinVO mvo = adminService.reservationContent(mid);
			
			JsonObject jo = new JsonObject();
			Gson gson = new Gson();
			jo.addProperty("mid", mid);
			jo.addProperty("dcode", mvo.getDcode());
			jo.addProperty("rid", mvo.getRid());
			
			jo.addProperty("dtitle", mvo.getDtitle());
			jo.addProperty("mname", mvo.getMname());
			jo.addProperty("dpricech", mvo.getDpricech());
			jo.addProperty("rtotal", mvo.getRtotal());
			jo.addProperty("rallpricech", mvo.getRallpricech());
			jo.addProperty("rdateda", mvo.getRdateda());
			jo.addProperty("rokdatech", mvo.getRokdatech());
			 
			
			
			
			return gson.toJson(jo);
			
			
		}
	
}
