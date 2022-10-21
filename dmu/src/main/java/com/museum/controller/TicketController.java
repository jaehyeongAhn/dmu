package com.museum.controller;



 
import java.util.ArrayList;
 
import java.util.Map;

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
	
		@RequestMapping(value="/ticketlist_write.do", method=RequestMethod.GET)
		public String board_write() {
			return "admin/adminticket/ticketlist_write";
		}
		@RequestMapping(value="/ticketlist_write_check.do", method=RequestMethod.POST)
		public ModelAndView ticketlist_write_check(DmuTicketVO vo, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			vo = fileService.update_fileCheck(vo);
			int result = ticketService.getWriteResult(vo);

			if(result == 1){			
				fileService.fileSave(vo, request);
				mv.setViewName("redirect:/adminexhibition_list.do");
			}else{

				mv.setViewName("error_page");
			}		
			
			return mv;
		}
		@RequestMapping(value="/exhibition_list.do", method=RequestMethod.GET)
		public ModelAndView exhibition_list(String rpage) {
			
			ModelAndView mv = new ModelAndView();

			ArrayList<DmuTicketVO> list = ticketService.getList("exhibition");
			int	dbCount =ticketService.getTicketCount("exhibition");
			
			mv.addObject("list",list);
			mv.addObject("dbCount",dbCount);
			mv.setViewName("/ticket/exhibition/exhibition_list");
			return mv;
		}
		@RequestMapping(value="/event_list.do", method=RequestMethod.GET)
		public ModelAndView event_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			
			ArrayList<DmuTicketVO> list = ticketService.getList("event");
			int	dbCount =ticketService.getTicketCount("event");
			
			mv.addObject("list",list);
			mv.addObject("dbCount",dbCount);
			mv.setViewName("/ticket/event/event_list");
			return mv;
		}
		/**
		 * learn_list.do 
		 */
		@RequestMapping(value="/learn_list.do", method=RequestMethod.GET)
		public ModelAndView learn_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			
			ArrayList<DmuTicketVO> list = ticketService.getList("learn");
			int	dbCount =ticketService.getTicketCount("learn");
			
			mv.addObject("list",list);
			mv.addObject("dbCount",dbCount);
			mv.setViewName("/ticket/learn/learn_list");
			return mv;
		}
		
		@RequestMapping(value="/adminlearn_list.do", method=RequestMethod.GET)
		public ModelAndView adminlearn_list() throws Exception {
			ModelAndView mv = new ModelAndView();
			
			ArrayList<DmuTicketVO> list = ticketService.getList("learn");
			int	dbCount =ticketService.getTicketCount("learn");
			
			mv.addObject("list",list);
			mv.addObject("dbCount",dbCount);
			mv.setViewName("/admin/adminticket/adminlearn_list");
			return mv;
		}
		@ResponseBody
		@RequestMapping(value="/adminlearn_ajaxlist.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
		public String adminLearnAjaxList(String dtarget){
			
			
			
			ArrayList<DmuTicketVO> list = ticketService.getLists("learn",dtarget);
			
			int	dbCount =ticketService.getTicketLearnCount(dtarget);
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
			jobject.addProperty("dbCount", dbCount);
			
			
			
			
			return gson.toJson(jobject);
		}
		@RequestMapping(value="/adminexhibition_list.do", method=RequestMethod.GET)
		public ModelAndView adminexhibition_list() {
			ModelAndView mv = new ModelAndView();
			

			ArrayList<DmuTicketVO> list = ticketService.getList("exhibition");
			int	dbCount =ticketService.getTicketCount("exhibition");
			
			mv.addObject("list",list);
			mv.addObject("dbCount",dbCount);
			mv.setViewName("/admin/adminticket/adminexhibition_list");
			return mv;
		}
		@RequestMapping(value="/adminevent_list.do", method=RequestMethod.GET)
		public ModelAndView adminevent_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			
			ArrayList<DmuTicketVO> list = ticketService.getList("event");
			int	dbCount =ticketService.getTicketCount("event");
			
			mv.addObject("list",list);
			mv.addObject("dbCount",dbCount);
			mv.setViewName("/admin/adminticket/adminevent_list");
			return mv;
		}
		@RequestMapping(value="/ticketlist_content.do", method=RequestMethod.GET)
		public ModelAndView ticketlist_content(String did) {
			ModelAndView mv = new ModelAndView();
			
			DmuTicketVO vo = ticketService.getContent(did);
			
			mv.addObject("vo", vo);
			mv.setViewName("/admin/adminticket/ticketlist_content");
			
			return mv;
		}
		@RequestMapping(value="/admin_ticket_update_check.do", method=RequestMethod.POST)
		public ModelAndView admin_ticket_update_check(DmuTicketVO vo,HttpServletRequest request)
																	throws Exception {
			ModelAndView mv = new ModelAndView();

			String old_filename = vo.getDsfile();	
			
			vo = fileService.update_fileCheck(vo);
			int result = ticketService.getUpdate(vo);
			
			if(result == 1){
				
				fileService.update_filesave(vo, request, old_filename);
				mv.setViewName("redirect:/adminexhibition_list.do");
				
			}else{

				mv.setViewName("error_page");
			}		
			
			return mv;
		}
		@RequestMapping(value="/admin_ticket_update.do", method=RequestMethod.GET)
		public ModelAndView admin_ticket_update(String did) {
			ModelAndView mv = new ModelAndView();
			
			DmuTicketVO vo = ticketService.getContent(did);
			
			mv.addObject("vo", vo);
			mv.setViewName("/admin/adminticket/ticketlist_update");
			
			return mv;
		}
		@RequestMapping(value="/admin_ticket_delete.do", method=RequestMethod.GET)
		public ModelAndView admin_ticket_delete(String did) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("did", did);
			mv.setViewName("/admin/adminticket/ticketlist_delete");
			
			return mv;
		}
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