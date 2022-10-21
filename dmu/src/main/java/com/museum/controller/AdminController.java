package com.museum.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.museum.dao.DmuAdminDAO;
import com.museum.dao.DmuMemberDAO;
import com.museum.dao.DmuNoticeDAO;
import com.museum.service.AdminServiceImpl;
import com.museum.service.EmailServiceImpl;
import com.museum.service.NoticeServiceImpl;
import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuTicketVO;
@Controller
public class AdminController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	@Autowired
	private AdminServiceImpl adminService;

	@Autowired
	private EmailServiceImpl emailService;
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
		
		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 3;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = noticeService.getTotalCount();	//DB���� ������ ��ü ���
		
		//�� ������ �� ���
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		
		//��û ������ ���
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
	 * admin_notice_write_check.do : �������� �۾���
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
	 * admin_notice_content.do : �������� �󼼺���
	 */
	
	@RequestMapping(value = "/admin_notice_content.do", method = RequestMethod.GET)
	public ModelAndView admin_notice_content(String nid) {
		ModelAndView mv = new ModelAndView();
		DmuNoticeDAO dao = new DmuNoticeDAO();
		DmuNoticeVO vo = noticeService.getContent(nid);
		if(vo.getNcontent() != null) {
			vo.setNcontent(vo.getNcontent().replace("\r\n", "<br/>"));
		}
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_notice/admin_notice_content");
		
		return mv;
	}

	
	/*
	 * admin_notice_update.do : �����ϱ� ������
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
	 * admin_notice_delete.do : ���� ������
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

		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = adminService.getTotalCount_public();	//DB���� ������ ��ü ���

		//�� ������ �� ���
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//��û ������ ���
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

		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = adminService.getTotalCount_admin();	//DB���� ������ ��ü ���

		//�� ������ �� ���
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//��û ������ ���
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
	 * ���� ȸ�� ������ (�����ڸ�)
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
	
	@ResponseBody
	@RequestMapping(value="/acceptUpdate.do", method= RequestMethod.GET)
	public String acceptUpdate(String mid) {
		//ModelAndView mv = new ModelAndView();
		int result = 0;
		result = adminService.updateStatus(mid);
		
		
		/*
		 * if(result == 1) { mv.setViewName("redirect:/adminpage_admin_list.do?");
		 * }else{ mv.setViewName("error_page"); }
		 */
		 
		return String.valueOf(result);
	}
	
	
	/*
	 * reservation list
	 */
	
		@RequestMapping(value = "/adminpage_reservation_list.do", method = RequestMethod.GET)
		public ModelAndView adminpage_reservation_list(String rpage) {
			ModelAndView mv = new ModelAndView();		 

			//����¡ ó�� - startCount, endCount ���ϱ�
			int startCount = 0;
			int endCount = 0;
			int pageSize = 5;	//���������� �Խù� ��
			int reqPage = 1;	//��û������	
			int pageCount = 1;	//��ü ������ ��
			int dbCount = adminService.getTotalCount_reservation();	//DB���� ������ ��ü ���

			//�� ������ �� ���
			if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}

			//��û ������ ���
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

		/*
		 * �˻���� (member)	
		 */
		
			
			@ResponseBody
			@RequestMapping(value = "/admin_search_public_json.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
			public String admin_search_public_json(String rpage, String keyword, HttpServletRequest request, HttpServletResponse response) 
											throws Exception{
				
				DmuAdminDAO dao = new DmuAdminDAO();
				//String kind = request.getParameter("ncategory");
					//����¡ó��
					//����¡ ó�� - startCount, endCount ���ϱ�
					int startCount = 0;
					int endCount = 0;
					int pageSize = 5;	//���������� �Խù� ��
					int reqPage = 1;	//��û������	
					int pageCount = 1;	//��ü ������ ��
					int dbCount = dao.totalCount_publicSearch(keyword);	//DB���� ������ ��ü ���
					

					//�� ������ �� ���
					if(dbCount % pageSize == 0){
						pageCount = dbCount/pageSize;
					}else{
						pageCount = dbCount/pageSize+1;
					}

					//��û ������ ���
					if(rpage != null){
						reqPage = Integer.parseInt(rpage);
						startCount = (reqPage-1) * pageSize+1;
						endCount = reqPage *pageSize;
					}else{
						startCount = 1;
						endCount = pageSize;
					}
					

					ArrayList<DmuMemberVO> publicSearchList = dao.member_search_public(startCount, endCount, keyword);

					
					JsonObject job = new JsonObject();
					JsonArray jarray = new JsonArray();
					Gson gson = new Gson();
					
					for(DmuMemberVO vo : publicSearchList) {
						JsonObject jo = new JsonObject();
						jo.addProperty("rno", vo.getRno());
						jo.addProperty("mid", vo.getMid());
						jo.addProperty("mname", vo.getMname());
						jo.addProperty("pnumber", vo.getPnumber());
						jo.addProperty("email", vo.getEmail());
						jo.addProperty("ddate", vo.getDdate());
						jo.addProperty("unregister", vo.getUnregister());
						
						jarray.add(jo);
					}
					
					job.add("list", jarray);
					job.addProperty("dbCount", dbCount);
					job.addProperty("rpage", rpage);
					job.addProperty("pageSize", pageSize);
					
					return gson.toJson(job);
					
			
			}
			
		
		/*
		 * �˻���� (admin)	
		 */
		
			@ResponseBody
			@RequestMapping(value = "/admin_search_admin_json.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
			public String admin_search_admin_json(String rpage, String keyword, HttpServletRequest request, HttpServletResponse response) 
											throws Exception{
				
				DmuAdminDAO dao = new DmuAdminDAO();
				//String kind = request.getParameter("ncategory");
					//����¡ó��
					//����¡ ó�� - startCount, endCount ���ϱ�
					int startCount = 0;
					int endCount = 0;
					int pageSize = 5;	//���������� �Խù� ��
					int reqPage = 1;	//��û������	
					int pageCount = 1;	//��ü ������ ��
					int dbCount = dao.totalCount_adminSearch(keyword);	//DB���� ������ ��ü ���
					

					//�� ������ �� ���
					if(dbCount % pageSize == 0){
						pageCount = dbCount/pageSize;
					}else{
						pageCount = dbCount/pageSize+1;
					}

					//��û ������ ���
					if(rpage != null){
						reqPage = Integer.parseInt(rpage);
						startCount = (reqPage-1) * pageSize+1;
						endCount = reqPage *pageSize;
					}else{
						startCount = 1;
						endCount = pageSize;
					}
					

					ArrayList<DmuMemberVO> adminSearchList = dao.member_search_admin(startCount, endCount, keyword);

					
					JsonObject job = new JsonObject();
					JsonArray jarray = new JsonArray();
					Gson gson = new Gson();
					
					for(DmuMemberVO vo : adminSearchList) {
						JsonObject jo = new JsonObject();
						jo.addProperty("rno", vo.getRno());
						jo.addProperty("mid", vo.getMid());
						jo.addProperty("mname", vo.getMname());
						jo.addProperty("pnumber", vo.getPnumber());
						jo.addProperty("email", vo.getEmail());
						jo.addProperty("ddate", vo.getDdate());
						jo.addProperty("unregister", vo.getUnregister());
						jo.addProperty("status", vo.getStatus());
						
						jarray.add(jo);
					}
					
					job.add("list", jarray);
					job.addProperty("dbCount", dbCount);
					job.addProperty("rpage", rpage);
					job.addProperty("pageSize", pageSize);
					
					return gson.toJson(job);
					
			
			}
			
			
		
		/*
		 * �˻���� (reservation)
		 */
			
	@ResponseBody
	@RequestMapping(value = "/admin_search_reserve_json.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String admin_search_reserve_json(String rpage, String keyword, HttpServletRequest request, HttpServletResponse response) 
									throws Exception{
		
		DmuAdminDAO dao = new DmuAdminDAO();
		//String kind = request.getParameter("ncategory");
			//����¡ó��
			//����¡ ó�� - startCount, endCount ���ϱ�
			int startCount = 0;
			int endCount = 0;
			int pageSize = 5;	//���������� �Խù� ��
			int reqPage = 1;	//��û������	
			int pageCount = 1;	//��ü ������ ��
			int dbCount = dao.totalCount_reserve(keyword);	//DB���� ������ ��ü ���
			

			//�� ������ �� ���
			if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}

			//��û ������ ���
			if(rpage != null){
				reqPage = Integer.parseInt(rpage);
				startCount = (reqPage-1) * pageSize+1;
				endCount = reqPage *pageSize;
			}else{
				startCount = 1;
				endCount = pageSize;
			}
			

			ArrayList<DmuReJoinVO> reserveSearchList = dao.member_search_reserve(startCount, endCount, keyword);

			
			JsonObject job = new JsonObject();
			JsonArray jarray = new JsonArray();
			Gson gson = new Gson();
			
			for(DmuReJoinVO vo : reserveSearchList) {
				JsonObject jo = new JsonObject();
				jo.addProperty("dcode", vo.getDcode());
				jo.addProperty("rid", vo.getRid());
				jo.addProperty("dtitle", vo.getDtitle());
				jo.addProperty("mname", vo.getMname());
				jo.addProperty("dpricech", vo.getDpricech());
				jo.addProperty("rtotal", vo.getRtotal());
				jo.addProperty("rallpricech", vo.getRallpricech());
				jo.addProperty("rdateda", vo.getRdateda());
				jo.addProperty("rokdatech", vo.getRokdatech());
				
				jarray.add(jo);
			}
			
			job.add("list", jarray);
			job.addProperty("dbCount", dbCount);
			job.addProperty("rpage", rpage);
			job.addProperty("pageSize", pageSize);
			
			return gson.toJson(job);
 
	}
		
	/*********************************** 1��1 ���� ���� ***********************************/
	//adminpage_inquiry_list.do : ���� ���� ������
	@RequestMapping(value = "/adminpage_inquiry_list.do", method = RequestMethod.GET)
	public String adminpage_inquiry() {
		return "/admin/admin_member/adminpage_inquiry_list";
	}
	
	//adminpage_inquiry_list_ajax.do : ���� ���� ����Ʈ
	@ResponseBody
	@RequestMapping(value = "/adminpage_inquiry_list_ajax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String adminpage_inquiry_list_ajax(String rpage, String answerType) {
		//����¡ ó��
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = adminService.getInquiryTotalCount(answerType);
		
		if(dbCount % pageSize == 0) {
			pageCount = dbCount/pageSize;
		}else {
			pageCount = dbCount/pageSize + 1;
		}
		
		if(rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		}else {
			startCount = 1;
			endCount = pageSize;
		}
		
		//����Ʈ ó��
		ArrayList<DmuInquiryVO> list = (ArrayList<DmuInquiryVO>) adminService.getIquiryList(answerType, startCount, endCount);
		
		JsonObject jobject = new JsonObject();
		JsonArray jarray = new JsonArray();
		Gson gson = new Gson();

		for(DmuInquiryVO vo : list) {
			JsonObject jo = new JsonObject();
			jo.addProperty("iqid", vo.getIqid());
			jo.addProperty("mid", vo.getMid());
			jo.addProperty("iqcategory", vo.getIqcategory());
			jo.addProperty("iqtype", vo.getIqtype());
			jo.addProperty("iqtitle", vo.getIqtitle());
			jo.addProperty("iqanswer", vo.getIqanswer());
			jo.addProperty("iqdate", vo.getIqdate());
			
			jarray.add(jo);
		}
		
		jobject.add("list", jarray);
		jobject.addProperty("dbCount", dbCount);
		jobject.addProperty("pageSize", pageSize);
		jobject.addProperty("rpage", reqPage);
		
		return gson.toJson(jobject);
	}
	
	//adminpage_inquiry_content_ajax.do : ���� ���� �� ����
	@ResponseBody
	@RequestMapping(value = "/adminpage_inquiry_content_ajax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String adminpage_inquiry_content_ajax(String iqid) {
		DmuInquiryVO vo = adminService.getInquiryContent(iqid);
		
		JsonObject jobject = new JsonObject();
		Gson gson = new Gson();
		
		jobject.addProperty("iqid", vo.getIqid());
		jobject.addProperty("mid", vo.getMid());
		jobject.addProperty("iqcategory", vo.getIqcategory());
		jobject.addProperty("iqtype", vo.getIqtype());
		jobject.addProperty("iqtitle", vo.getIqtitle());
		jobject.addProperty("iqcontent", vo.getIqcontent());
		jobject.addProperty("iqanswer", vo.getIqanswer());
		jobject.addProperty("iqdate", vo.getIqdate());
		
		return gson.toJson(jobject);
	}
	
	//inquiry_response.do : ���� ���� �亯 ����
	@ResponseBody
	@RequestMapping(value = "/inquiry_response.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String inquiry_response(String answer, String iqid, String mid) {
		DmuInquiryVO vo = adminService.getInquiryContent(iqid);
		String email = adminService.getInquiryEmail(mid);
		
		String result = emailService.emailForm_inquiry(email, answer, vo);
		
		JsonObject jobject = new JsonObject();
		Gson gson = new Gson();
		
		if(result == "success") {
			int success_result = adminService.getInquiryUpdate(iqid);
			if(success_result == 1) {
				jobject.addProperty("email_response", result);					
			}
		}else {
			jobject.addProperty("email_response", "fail");
		}		
		
		return gson.toJson(jobject);
	}
	

	
	  //adminpage_reservation_list_det.do
	  
	  @RequestMapping(value = "/adminpage_reservation_list_det.do", method =
	  RequestMethod.GET)
	  
	  public ModelAndView adminpage_reservation_list_det(String rid) { ModelAndView
	  mv = new ModelAndView();
	  
	  ArrayList<DmuReJoinVO> rlist = adminService.reservationDet(rid);
	  
	  mv.addObject("list", rlist);
	  mv.setViewName("/admin/admin_member/adminpage_reservation_list_det");
	  
	  return mv; }
	  
	//adminpage_reservation_list_det.do
			/*
			 * @RequestMapping(value = "/adminpage_reservation_list_det.do", method =
			 * RequestMethod.GET)
			 * 
			 * public ModelAndView adminpage_reservation_list_det(String rid) { ModelAndView
			 * mv = new ModelAndView();
			 * 
			 * DmuReJoinVO vo = adminService.reservationDet(rid);
			 * 
			 * mv.addObject("vo", vo);
			 * mv.setViewName("/admin/admin_member/adminpage_reservation_list_det");
			 * 
			 * return mv; }
			 */
	 
		
}
