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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

  
 
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
 
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
	

	// ticketlist_write.do : 占쌉쏙옙占쏙옙 占쌜억옙占쏙옙 화占쏙옙
		 
		@RequestMapping(value="/ticketlist_write.do", method=RequestMethod.GET)
		public String board_write() {
			return "admin/adminticket/ticketlist_write";
		}
		/**
		 * ticketlist_write_check.do : 占쌉쏙옙占쏙옙 占쌜억옙占쏙옙 처占쏙옙
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
					  path += "resources/upload/";
					File file = new File(path+vo.getDsfile());
					vo.getFile1().transferTo(file);
				}
				

				//mv.setViewName("/board/board_list"); //�뿉�윭X, �븘臾대윴 寃뚯떆湲� 異쒕젰�릺吏� X
				mv.setViewName("redirect:/adminexhibition_list.do"); //DB�뿰�룞�쓣 Controller�뿉�꽌 吏꾪뻾�븯誘�濡�, �깉濡쒖슫 �뿰寃곗쓣 �닔�뻾!!

			}else{
				mv.setViewName("error_page");
			}
			
			return mv;
		}
		/**
		 * exhibition_list.do : 占쏙옙占쏙옙회 占쏙옙체 占쏙옙占쏙옙트 
		 */
		@RequestMapping(value="/exhibition_list.do", method=RequestMethod.GET)
		public ModelAndView exhibition_list(String rpage) {
			
			ModelAndView mv = new ModelAndView();

			Map<String,Integer> param = pageService.getPageResult(rpage, "exhibition", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"exhibition");
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("ticket/exhibition/exhibition_list");
			
			
			return mv;
		}
		/**
		 * event_list.do : 占쏙옙占쏙옙회 占쏙옙체 占쏙옙占쏙옙트 
		 */
		@RequestMapping(value="/event_list.do", method=RequestMethod.GET)
		public ModelAndView event_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "event", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"),"event");
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("ticket/event/event_list");
			
			
			return mv;
		}
		/**
		 * learn_list.do : 占쏙옙占쏙옙회 占쏙옙체 占쏙옙占쏙옙트 
		 */
		@RequestMapping(value="/learn_list.do", method=RequestMethod.GET)
		public ModelAndView learn_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "learn", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"learn");
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("ticket/learn/learn_list");
			
			
			return mv;
		}
		
		//adminlearn list 占쏙옙占쏙옙占쏙옙
		@RequestMapping(value="/adminlearn_list.do", method=RequestMethod.GET)
		public ModelAndView adminlearn_list(String rpage) throws Exception {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "learn", ticketService);
			
			ArrayList<DmuTicketVO> list;
			
				
		 list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"learn");
			
			
			
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("admin/adminticket/adminlearn_list");
			
			
			return mv;
		}
		

		//admin leran ajax
		@ResponseBody
		@RequestMapping(value="/adminlearn_ajaxlist.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
		public String adminLearnAjaxList(String dtarget,String rpage){
			

			Map<String,Integer> param = pageService.getPageResult(rpage, dtarget, ticketService);
			
			ArrayList<DmuTicketVO> list = ticketService.getLists( param.get("startCount") ,param.get("endCount"),"learn",dtarget);
			
			JsonObject jobject = new JsonObject(); //DmuTicketVO
			JsonArray jarray = new JsonArray();  //ArrayList
			Gson gson = new Gson();
			
			for(DmuTicketVO vo : list){
				JsonObject jo = new JsonObject();
				jo.addProperty("rno", vo.getRno());
				jo.addProperty("did", vo.getDid());
				jo.addProperty("dplace", vo.getDplace());
				jo.addProperty("dtitle", vo.getDtitle());
				jo.addProperty("dstart", vo.getDstart());
				jo.addProperty("dend", vo.getDend());
				jo.addProperty("dfile", vo.getDfile());
				jo.addProperty("dsfile", vo.getDsfile());
				jo.addProperty("dcode", vo.getDcode());
				jo.addProperty("dtime", vo.getDtime());
				jo.addProperty("dprice", vo.getDprice());
				jo.addProperty("dtarget", vo.getDtarget());
				jo.addProperty("dnum", vo.getDnum());
				jo.addProperty("dtitle2", vo.getDtitle2());
				
				jarray.add(jo);
			}
			jobject.add("list", jarray); 
			jobject.addProperty("dbCount", param.get("dbCount"));
			jobject.addProperty("pageSize", param.get("pageSize"));
			jobject.addProperty("rpage", param.get("rpage"));
			jobject.addProperty("pageCount", param.get("pageCount"));
			
			
			
			
			return gson.toJson(jobject);
		}
		//exhibition list 愿�由ъ옄

		@RequestMapping(value="/adminexhibition_list.do", method=RequestMethod.GET)
		public ModelAndView adminexhibition_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "exhibition", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"),"exhibition");
				
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("admin/adminticket/adminexhibition_list");
			
			
			return mv;
		}
		//adminevent list 占쏙옙占쏙옙占쏙옙
		@RequestMapping(value="/adminevent_list.do", method=RequestMethod.GET)
		public ModelAndView adminevent_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "event", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"),"event");
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("admin/adminticket/adminevent_list");
			
			
			return mv;
		}

	
		/**
		 * ticketlist_content :
		 */
		@RequestMapping(value="/ticketlist_content.do", method=RequestMethod.GET)
		public ModelAndView ticketlist_content(String did) {
			ModelAndView mv = new ModelAndView();
			
			DmuTicketVO vo = ticketService.getContent(did);
			
			mv.addObject("vo", vo);
			mv.setViewName("admin//adminticket/ticketlist_content");
			
			return mv;
		}
		/**
		 * admin_ticket_update_check.do : 
		 */
		@RequestMapping(value="/admin_ticket_update_check.do", method=RequestMethod.POST)
		public ModelAndView admin_ticket_update_check(DmuTicketVO vo,HttpServletRequest request)
																	throws Exception {
			ModelAndView mv = new ModelAndView();

			String old_filename = vo.getDsfile();	//
			
			vo = fileService.update_fileCheck(vo);
			int result = ticketService.getUpdate(vo);
			
			if(result == 1){
				//
				fileService.update_filesave(vo, request, old_filename);
				mv.setViewName("redirect:/adminexhibition_list.do");
				
			}else{

				mv.setViewName("error_page");
			}		
			
			return mv;
		}
		/**
		 * admin_ticket_update.do :
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
		 * admin_ticket_delete.do : 
		 */
		@RequestMapping(value="/admin_ticket_delete.do", method=RequestMethod.GET)
		public ModelAndView admin_ticket_delete(String did) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("did", did);
			mv.setViewName("/adminticket/ticketlist_delete");
			
			return mv;
		}
		
		/**
		 * admin_ticket_delete_check.do : 
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
		
 
	  

}