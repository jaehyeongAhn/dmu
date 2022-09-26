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
import com.museum.service.FileServiceImpl;
import com.museum.service.PageServiceImpl;
import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuTicketVO;

@Controller
public class TicketController {
	@Autowired
	private TicketServiceImpl ticketService;
	@Autowired
	private PageServiceImpl pageService;
	@Autowired
	private FileServiceImpl  fileService;
	

	// ticketlist_write.do : 寃뚯떆�뙋 湲��벐湲� �솕硫�
		 
		@RequestMapping(value="/ticketlist_write.do", method=RequestMethod.GET)
		public String board_write() {
			return "adminticket/ticketlist_write";
		}
		/**
		 * ticketlist_write_check.do : 寃뚯떆�뙋 湲��벐湲� 泥섎━
		 */
		@RequestMapping(value="/ticketlist_write_check.do", method=RequestMethod.POST)
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
				
				//mv.setViewName("/board/board_list"); //�뿉�윭X, �븘臾대윴 寃뚯떆湲� 異쒕젰�릺吏� X
				mv.setViewName("redirect:/exhibition_list.do"); //DB�뿰�룞�쓣 Controller�뿉�꽌 吏꾪뻾�븯誘�濡�, �깉濡쒖슫 �뿰寃곗쓣 �닔�뻾!!
			}else{
				mv.setViewName("error_page");
			}
			
			return mv;
		}
		/**
		 * exhibition_list.do : �쟾�떆�쉶 �쟾泥� 由ъ뒪�듃 
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
		 * event_list.do : �쟾�떆�쉶 �쟾泥� 由ъ뒪�듃 
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
		 * learn_list.do : �쟾�떆�쉶 �쟾泥� 由ъ뒪�듃 
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
		
		//adminlearn list 愿�由ъ옄
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
		
		//exhibition list 愿�由ъ옄
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
		//adminevent list 愿�由ъ옄
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

	
		/**
		 * ticketlist_content : �떚耳� �긽�꽭蹂닿린
		 */
		@RequestMapping(value="/ticketlist_content.do", method=RequestMethod.GET)
		public ModelAndView ticketlist_content(String did) {
			ModelAndView mv = new ModelAndView();
			
			DmuTicketVO vo = ticketService.getContent(did);
			
			mv.addObject("vo", vo);
			mv.setViewName("/adminticket/ticketlist_content");
			
			return mv;
		}
		/**
		 * admin_ticket_update_check.do : 怨듭��궗�빆 �닔�젙 泥섎━
		 */
		@RequestMapping(value="/admin_ticket_update_check.do", method=RequestMethod.POST)
		public ModelAndView admin_ticket_update_check(DmuTicketVO vo,HttpServletRequest request)
																	throws Exception {
			ModelAndView mv = new ModelAndView();

			String old_filename = vo.getDsfile();	//�닔�젙�솕硫댁뿉�꽌 hidden�쑝濡� �꽆�뼱�삤�뒗 湲곗〈 upload �뤃�뜑�뿉 ���옣�맂 �뙆�씪紐�
			
			vo = fileService.update_fileCheck(vo);
			int result = ticketService.getUpdate(vo);
			
			if(result == 1){
				//�깉濡쒖슫 �뙆�씪�쓣 upload �뤃�뜑�뿉 ���옣�븳 �썑 湲곗〈�쓽 �뙆�씪�� �궘�젣
				fileService.update_filesave(vo, request, old_filename);
				mv.setViewName("redirect:/adminexhibition_list.do");
				
			}else{

				mv.setViewName("error_page");
			}		
			
			return mv;
		}
		/**
		 * admin_ticket_update.do : 怨듭��궗�빆 �닔�젙�솕硫� 
		 */
		@RequestMapping(value="/admin_ticket_update.do", method=RequestMethod.GET)
		public ModelAndView admin_ticket_update(String did) {
			ModelAndView mv = new ModelAndView();
			
			DmuTicketVO vo = ticketService.getContent(did);
			
			mv.addObject("vo", vo);
			mv.setViewName("/adminticket/ticketlist_update");
			
			return mv;
		}
		
		/**
		 * admin_ticket_delete.do : 怨듭��궗�빆 �궘�젣 �솕硫� 
		 */
		@RequestMapping(value="/admin_ticket_delete.do", method=RequestMethod.GET)
		public ModelAndView admin_ticket_delete(String did) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("did", did);
			mv.setViewName("/adminticket/ticketlist_delete");
			
			return mv;
		}
		
		/**
		 * admin_ticket_delete_check.do : 怨듭��궗�빆 �궘�젣 泥섎━
		 */
		@RequestMapping(value="/admin_ticket_delete_check.do", method=RequestMethod.POST)
		public ModelAndView admin_ticket_delete_check(String did, HttpServletRequest request)
																throws Exception {
			ModelAndView mv = new ModelAndView();
		
			DmuTicketVO vo = ticketService.getContent(did);
			int result = ticketService.getDelete(did);
			
			if(result == 1){	
				fileService.fileDelete(vo, request);
				mv.setViewName("redirect:/adminexhibition_list.do");
			}else{

				mv.setViewName("error_page");
			}		
			
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
