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
	private FileServiceImpl  fileService;
	@Autowired
	private PageServiceImpl  pageService;
	
		@RequestMapping(value="/adminticketlist_write.do", method=RequestMethod.GET)
		public String board_write() {
			return "admin/adminticket/adminticketlist_write";
		}
		@RequestMapping(value="/adminticketlist_write_check.do", method=RequestMethod.POST)
		public ModelAndView ticketlist_write_check(DmuTicketVO vo, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView();
			System.out.println(vo.getDcode());
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
		public ModelAndView exhibition_list(String rpage , String day) {
			
			ModelAndView mv = new ModelAndView();

			Map<String,Integer> param = pageService.getPageResult(rpage, "exhibition", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"exhibition",day);
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("ticket/exhibition/exhibition_list");
			return mv;
		}
		@RequestMapping(value="/event_list.do", method=RequestMethod.GET)
		public ModelAndView event_list(String rpage,String day) {
			ModelAndView mv = new ModelAndView();
			
			Map<String,Integer> param = pageService.getPageResult(rpage, "event", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"),"event",day);
			
			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("ticket/event/event_list");
			return mv;
		}
		/**
		 * learn_list.do 
		 */
		@RequestMapping(value="/learn_list.do", method=RequestMethod.GET)
		public ModelAndView learn_list(String rpage,String day) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "learn", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"learn",day);

			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("ticket/learn/learn_list");

			return mv;
		}
		
		@RequestMapping(value="/adminlearn_list.do", method=RequestMethod.GET)
		public ModelAndView adminlearn_list(String rpage,String day) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			Map<String,Integer> param = pageService.getPageResult(rpage, "learn", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"learn",day);

			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("admin/adminticket/adminlearn_list");

			return mv;
		}
		@ResponseBody
		@RequestMapping(value="/learn_ajaxlist.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
		public String adminLearnAjaxList(String dtarget,String rpage,String day){
			ArrayList<DmuTicketVO> list;
			Map<String,Integer> param ;
			if(dtarget.equals("all")) {
				param = pageService.getPageResult(rpage, "learn", ticketService);
				
				list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"learn",day);
			}else {
				param = pageService.getPageResult(rpage, dtarget, ticketService);
				
				list = ticketService.getLists( param.get("startCount") ,param.get("endCount"),"learn",dtarget,day);
				
			}
			
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
		@ResponseBody
		@RequestMapping(value="/orderby_ajaxlist.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
		public String orderby(String day,String rpage,String dtarget){
			ArrayList<DmuTicketVO> list;
			Map<String,Integer> param ;	
			if(!dtarget.equals("all")) {
			param = pageService.getPageResult(rpage, dtarget, ticketService);
			
				list = ticketService.getLists( param.get("startCount") ,param.get("endCount"),"learn",dtarget,day);
				
			}else {
				
				param = pageService.getPageResult(rpage, "learn", ticketService);
				
				list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"learn",day);
			}
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
		@ResponseBody
		@RequestMapping(value="/orderby_exhibition_ajaxlist.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
		public String orderbyexhibition(String day,String rpage){
			
			Map<String,Integer>	param = pageService.getPageResult(rpage, "exhibition", ticketService);
			ArrayList<DmuTicketVO> list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"exhibition",day);
			
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
		@ResponseBody
		@RequestMapping(value="/orderby_event_ajaxlist.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
		public String orderbyevent(String day,String rpage){
			
			Map<String,Integer>	param = pageService.getPageResult(rpage, "event", ticketService);
			ArrayList<DmuTicketVO> list = ticketService.getList( param.get("startCount") ,param.get("endCount"),"event",day);
			
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
		@RequestMapping(value="/adminexhibition_list.do", method=RequestMethod.GET)
		public ModelAndView adminexhibition_list(String rpage,String day) {
			ModelAndView mv = new ModelAndView();
			

			Map<String,Integer> param = pageService.getPageResult(rpage, "exhibition", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"),"exhibition",day);

			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("admin/adminticket/adminexhibition_list");
			return mv;
		}
		@RequestMapping(value="/adminevent_list.do", method=RequestMethod.GET)
		public ModelAndView adminevent_list(String rpage,String day) {
			ModelAndView mv = new ModelAndView();
			
			Map<String,Integer> param = pageService.getPageResult(rpage, "event", ticketService);

			ArrayList<DmuTicketVO> list = ticketService.getList(param.get("startCount"), param.get("endCount"),"event",day);

			mv.addObject("list",list);
			mv.addObject("dbCount", param.get("dbCount"));
			mv.addObject("rpage", param.get("rpage"));
			mv.addObject("pageSize", param.get("pageSize"));
			mv.addObject("pageCount", param.get("pageCount"));
			mv.setViewName("admin/adminticket/adminevent_list");

			return mv;
		}

		@RequestMapping(value="/adminticketlist_content.do", method=RequestMethod.GET)
		public ModelAndView ticketlist_content(String did) {
			ModelAndView mv = new ModelAndView();
			
			DmuTicketVO vo = ticketService.getContent(did);
			
			if(vo.getDtime() != null) {
				vo.setDtime(vo.getDtime().replace("\r\n", "<br/>"));
			}
			mv.addObject("vo", vo);
			mv.setViewName("/admin/adminticket/adminticketlist_content");
			
			return mv;
		}
		@RequestMapping(value="/adminticket_update_check.do", method=RequestMethod.POST)
		public ModelAndView adminticket_update_check(DmuTicketVO vo,HttpServletRequest request)
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
		@RequestMapping(value="/adminticket_update.do", method=RequestMethod.GET)
		public ModelAndView adminticket_update(String did) {
			ModelAndView mv = new ModelAndView();
			
			DmuTicketVO vo = ticketService.getContent(did);
			
			mv.addObject("vo", vo);
			mv.setViewName("/admin/adminticket/adminticketlist_update");
			
			return mv;
		}
		@RequestMapping(value="/adminticket_delete.do", method=RequestMethod.GET)
		public ModelAndView admin_ticket_delete(String did) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("did", did);
			mv.setViewName("/admin/adminticket/adminticketlist_delete");
			
			return mv;
		}
		@RequestMapping(value="/adminticket_delete_check.do", method=RequestMethod.POST)
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