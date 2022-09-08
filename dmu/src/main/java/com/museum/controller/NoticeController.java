package com.museum.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuNoticeDAO;
import com.museum.vo.DmuNoticeVO;

@Controller
public class NoticeController {

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
		int dbCount = dao.totalCount();	//DB���� ������ ��ü ���
		
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
		
		
	ArrayList<DmuNoticeVO> list = dao.select(startCount, endCount);
	
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
		DmuNoticeVO vo = dao.select(nid);
		
		mv.addObject("vo", vo);
		mv.setViewName("/notice/notice_content");
		
		return mv;
	}

	
}//class-end
