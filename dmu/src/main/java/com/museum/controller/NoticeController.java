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
import com.museum.dao.DmuNoticeDAO;
import com.museum.service.NoticeServiceImpl;
import com.museum.vo.DmuNoticeVO;

@Controller
public class NoticeController {

	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	@RequestMapping(value = "/notice_list.do", method = RequestMethod.GET)
	public ModelAndView notice_list(String rpage) {
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
	mv.setViewName("/notice/notice_list");

		
		return mv;
		 
	}
	
	@RequestMapping(value = "/notice_content.do", method = RequestMethod.GET)
	public ModelAndView notice_content(String nid) {	
		ModelAndView mv = new ModelAndView();
		DmuNoticeDAO dao = new DmuNoticeDAO();
		DmuNoticeVO vo = noticeService.getContent(nid);
		vo.setNcontent(vo.getNcontent().replace("\r\n", "<br/>"));
		
		mv.addObject("vo", vo);
		mv.setViewName("/notice/notice_content");
		
		return mv;
	}

	
	@ResponseBody
	@RequestMapping(value = "/notice_list_json.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String notice_list_json(String rpage, String ncategory, HttpServletRequest request, HttpServletResponse response) 
									throws Exception{
		
		DmuNoticeDAO dao = new DmuNoticeDAO();
		//String kind = request.getParameter("ncategory");
		//����¡ó��
		//����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 3;	//���������� �Խù� ��
		int reqPage = 1;	//��û������	
		int pageCount = 1;	//��ü ������ ��
		int dbCount = noticeService.getTotalCount_category(ncategory);	//DB���� ������ ��ü ���

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
		

		ArrayList<DmuNoticeVO> clist = new ArrayList<DmuNoticeVO>();
		
		if(ncategory.equals("all")) {
			clist = noticeService.getList(startCount, endCount);
		}else {
			clist = noticeService.categoryList(startCount, endCount, ncategory);
		}
		
		
		JsonObject job = new JsonObject();
		JsonArray jarray = new JsonArray();
		Gson gson = new Gson();
		
		for(DmuNoticeVO vo : clist) {
			JsonObject jo = new JsonObject();
			jo.addProperty("rno", vo.getRno());
			jo.addProperty("nid", vo.getNid());
			jo.addProperty("ncategory", vo.getNcategory());
			jo.addProperty("ntitle", vo.getNtitle());
			jo.addProperty("ncontent", vo.getNcontent());
			jo.addProperty("ndate", vo.getNdate());

			jarray.add(jo);
		}
		
		
		job.add("list", jarray);
		job.addProperty("dbCount", dbCount);
		job.addProperty("rpage", rpage);
		job.addProperty("pageSize", pageSize);
		
		return gson.toJson(job);

	}
	
	
	@ResponseBody
	@RequestMapping(value = "/notice_content_json.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String notice_content_json(String nid) {
		
		DmuNoticeDAO dao = new DmuNoticeDAO();
		DmuNoticeVO vo = new DmuNoticeVO();
		
		Gson gson = new Gson();
		JsonObject job = new JsonObject();
		job.addProperty("nid", vo.getNid());
		job.addProperty("ncategory", vo.getNcategory());
		job.addProperty("ntitle", vo.getNtitle());
		job.addProperty("ncontent", vo.getNcontent());
		job.addProperty("ndate", vo.getNdate());
		
		return gson.toJson(job);
		
		
	}
	

	
	@ResponseBody
	@RequestMapping(value = "/notice_search_json.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String notice_search_json(String rpage, String keyword, String searchList, HttpServletRequest request, HttpServletResponse response) 
									throws Exception{
		
		DmuNoticeDAO dao = new DmuNoticeDAO();
		
		if(searchList.equals("����")) {
			searchList = "title";
		}else {
			searchList = "content";
		}
		//String kind = request.getParameter("ncategory");
			//����¡ó��
			//����¡ ó�� - startCount, endCount ���ϱ�
			int startCount = 0;
			int endCount = 0;
			int pageSize = 3;	//���������� �Խù� ��
			int reqPage = 1;	//��û������	
			int pageCount = 1;	//��ü ������ ��
			int dbCount = noticeService.getTotalCount_search(keyword, searchList);	//DB���� ������ ��ü ���
			//System.out.println(noticeService.getTotalCount_search(keyword, searchList));
			//System.out.println(dbCount);
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
			ArrayList<DmuNoticeVO> noticeList = noticeService.noticeSearch(startCount, endCount, keyword, searchList);
			System.out.println(noticeList+"151");
			
			JsonObject job = new JsonObject();
			JsonArray jarray = new JsonArray();
			Gson gson = new Gson();
			
			for(DmuNoticeVO vo : noticeList) {
				JsonObject jo = new JsonObject();
				jo.addProperty("rno", vo.getRno());
				jo.addProperty("nid", vo.getNid());
				jo.addProperty("ncategory", vo.getNcategory());
				jo.addProperty("ntitle", vo.getNtitle());
				jo.addProperty("ndate", vo.getNdate());
				
				jarray.add(jo);
			}
			
			System.out.println(jarray+"11");
			job.add("list", jarray);
			job.addProperty("dbCount", dbCount);
			job.addProperty("rpage", rpage);
			job.addProperty("pageSize", pageSize);
			
			return gson.toJson(job);
			
	
	}
	

	
}//class-end
