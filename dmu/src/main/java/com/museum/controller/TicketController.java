package com.museum.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuTicketDAO;
import com.museum.service.PageServiceImpl;
import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuTicketVO;

@Controller
public class TicketController {
	@Autowired
	private TicketServiceImpl ticketService;
	@Autowired
	private PageServiceImpl pageService;
	
	

	// ticketlist_write.do : 게시판 글쓰기 화면
		 
		@RequestMapping(value="/ticketlist_write.do", method=RequestMethod.GET)
		public String board_write() {
			return "adminticket/ticketlist_write";
		}
		/**
		 * ticketlist_write_check.do : 게시판 글쓰기 처리
		 */
		@RequestMapping(value="/ticketlist_write.do", method=RequestMethod.POST)
		public ModelAndView ticketlist_write_check(DmuTicketVO vo, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			if(vo.getFile1().getOriginalFilename().equals("")) {
				vo.setDfile("");
				vo.setDsfile("");
			}else {
				UUID uuid = UUID.randomUUID();
				vo.setDfile(vo.getFile1().getOriginalFilename());
				vo.setDsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
			}
			
			int result = ticketService.getWriteResult(vo);
			
			if(result == 1){
				if(!vo.getFile1().getOriginalFilename().equals("")) {
					String path = request.getSession().getServletContext().getRealPath("/");
					path += "\\resources\\upload\\";
					
					File file = new File(path+vo.getDsfile());
					vo.getFile1().transferTo(file);
				}
				
				//mv.setViewName("/board/board_list"); //에러X, 아무런 게시글 출력되지 X
				mv.setViewName("redirect:/adminexhibition_list.do"); //DB연동을 Controller에서 진행하므로, 새로운 연결을 수행!!
			}else{
				mv.setViewName("error_page");
			}
			
			return mv;
		}
		/**
		 * exhibition_list.do : 전시회 전체 리스트 
		 */
		@RequestMapping(value="/exhibition_list.do", method=RequestMethod.GET)
		public ModelAndView exhibition_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "ticket", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"));
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.setViewName("ticket/exhibition/exhibition_list");
			
			
			return mv;
		}
		/**
		 * event_list.do : 전시회 전체 리스트 
		 */
		@RequestMapping(value="/event_list.do", method=RequestMethod.GET)
		public ModelAndView event_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "ticket", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"));
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.setViewName("ticket/event/event_list");
			
			
			return mv;
		}
		/**
		 * learn_list.do : 전시회 전체 리스트 
		 */
		@RequestMapping(value="/learn_list.do", method=RequestMethod.GET)
		public ModelAndView learn_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "ticket", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"));
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.setViewName("ticket/learn/learn_list");
			
			
			return mv;
		}
		
		//adminlearn list 관리자
		@RequestMapping(value="/adminlearn_list.do", method=RequestMethod.GET)
		public ModelAndView adminlearn_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "ticket", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"));
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.setViewName("adminticket/adminlearn_list");
			
			
			return mv;
		}
		
		//exhibition list 관리자
		@RequestMapping(value="/adminexhibition_list.do", method=RequestMethod.GET)
		public ModelAndView adminexhibition_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "ticket", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"));
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.setViewName("adminticket/adminexhibition_list");
			
			
			return mv;
		}
		//adminevent list 관리자
		@RequestMapping(value="/adminevent_list.do", method=RequestMethod.GET)
		public ModelAndView adminevent_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "ticket", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"));
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.setViewName("adminticket/adminevent_list");
			
			
			return mv;
		}
		//ticketcontent.do
		@RequestMapping(value="/ticketcontent.do", method=RequestMethod.GET)
		public ModelAndView ticketcontent(String did) {
			ModelAndView mv = new ModelAndView();
			DmuTicketDAO dao = new DmuTicketDAO();
			DmuTicketVO vo = dao.select(did);
			
			
			/*
			 * int startCount = 0; int endCount = 0;
			 * 
			 * // ArrayList<ExhibitionVO> list = dao.select(startCount, endCount);
			 */		
			mv.addObject("vo",vo);
			mv.setViewName("adminticket/ticketcontent");
			
			return mv;
		}
}
