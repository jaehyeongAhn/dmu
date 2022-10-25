package com.museum.controller;

 
import java.io.File;



 
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

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
import com.museum.service.PageServiceImpl;
import com.museum.service.TagPageServiceImpl;
import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuTicketVO;

 


@Controller
public class TagPageController {
	 
	@Autowired TagPageServiceImpl tagpageService;
	@Autowired PageServiceImpl pageService;

		// event_page.do
		 
		@RequestMapping(value="/event_page.do", method=RequestMethod.GET)
 
		public ModelAndView event_page(String dplace ) {
			ModelAndView mv = new ModelAndView();
			
			
			ArrayList<DmuTicketVO> list = tagpageService.getEventContent("event");
			
			mv.addObject("list", list);
			mv.setViewName("/tag_page/event/event_page");
			return mv;
 
		}
		
	 
 
		
	// event_page_det.do
		@RequestMapping(value="/event_page_det.do", method=RequestMethod.GET)
		public String event_page_det( ) {		 
			return "tag_page/event/event_page_det";
		}
		 

 
 
		// exhibition_page.do
		 
		@RequestMapping(value="/exhibition_page.do", method=RequestMethod.GET)
		public ModelAndView exhibition_page() {
			ModelAndView mv = new ModelAndView();
			DmuTicketVO vo =tagpageService.getExhibition();
			mv.addObject("vo",vo);
			mv.setViewName("tag_page/exhibition/exhibition_page");
			return mv;
		}
		// exhibition_page1.do
		 
				@RequestMapping(value="/exhibition_page1.do", method=RequestMethod.GET)
				public ModelAndView exhibition_page1() {
					ModelAndView mv = new ModelAndView();
					DmuTicketVO vo =tagpageService.getExhibition();
					mv.addObject("vo",vo);
					mv.setViewName("tag_page/exhibition/exhibition_page1");
					return mv;
				}
		// exhibition_page.do2
		 
				@RequestMapping(value="/exhibition_page2.do", method=RequestMethod.GET)
				public String exhibition_page2() {
					return "tag_page/exhibition/exhibition_page2";
				}	
		// exhibition_past_page.do
		@RequestMapping(value="/exhibition_past_page.do", method=RequestMethod.GET)
		public ModelAndView exhibition_past_page() {
			ModelAndView mv = new ModelAndView();
			
			ArrayList<DmuTicketVO> list = tagpageService.getEventContent("exhibition");
			
		 
			mv.addObject("list", list);
			mv.setViewName("tag_page/exhibition/exhibition_past_page");
			return mv;
 
		}
		//exhibition_past_ajaxlist
				@ResponseBody
				@RequestMapping(value="/exhibition_past_ajaxlist.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
				public String exhibitionPastAjax(String day){
					
					
					
					ArrayList<DmuTicketVO> list = tagpageService.getDayList("exhibition", day);
					
					JsonObject jobject = new JsonObject(); //DmuTicketVO
					JsonArray jarray = new JsonArray();  //ArrayList
					Gson gson = new Gson();
					
					for(DmuTicketVO vo : list){
						JsonObject jo = new JsonObject();
						jo.addProperty("did", vo.getDid());
						jo.addProperty("dtitle", vo.getDtitle());
						jo.addProperty("dplace", vo.getDplace());
						jo.addProperty("dfile", vo.getDfile());
						jo.addProperty("dsfile", vo.getDsfile());
						jo.addProperty("dcode", vo.getDcode());
						jo.addProperty("dstart", vo.getDstart());
						jo.addProperty("dend", vo.getDend());
						jo.addProperty("dtitle2", vo.getDtitle2());
						jarray.add(jo);
					}
					jobject.add("list", jarray); 
					
					return gson.toJson(jobject);
				}
				//exhibition_past_ajaxlist1
				@ResponseBody
				@RequestMapping(value="/exhibition_past_ajaxlist1.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
				public String exhibitionPastAjax1(String day){
					
					
					
					ArrayList<DmuTicketVO> list = tagpageService.getDayList1("exhibition", day);
					
					JsonObject jobject = new JsonObject(); //DmuTicketVO
					JsonArray jarray = new JsonArray();  //ArrayList
					Gson gson = new Gson();
					
					for(DmuTicketVO vo : list){
						JsonObject jo = new JsonObject();
						jo.addProperty("did", vo.getDid());
						jo.addProperty("dtitle", vo.getDtitle());
						jo.addProperty("dplace", vo.getDplace());
						jo.addProperty("dfile", vo.getDfile());
						jo.addProperty("dsfile", vo.getDsfile());
						jo.addProperty("dcode", vo.getDcode());
						jo.addProperty("dstart", vo.getDstart());
						jo.addProperty("dend", vo.getDend());
						jo.addProperty("dtitle2", vo.getDtitle2());
						jarray.add(jo);
					}
					jobject.add("list", jarray); 
					
					return gson.toJson(jobject);
				}
				//exhibition_past_ajaxlist2
				@ResponseBody
				@RequestMapping(value="/exhibition_past_ajaxlist2.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
				public String exhibitionPastAjax2(String day){
					
					
					
					ArrayList<DmuTicketVO> list = tagpageService.getDayList2("exhibition", day);
					
					JsonObject jobject = new JsonObject(); //DmuTicketVO
					JsonArray jarray = new JsonArray();  //ArrayList
					Gson gson = new Gson();
					
					for(DmuTicketVO vo : list){
						JsonObject jo = new JsonObject();
						jo.addProperty("did", vo.getDid());
						jo.addProperty("dtitle", vo.getDtitle());
						jo.addProperty("dplace", vo.getDplace());
						jo.addProperty("dfile", vo.getDfile());
						jo.addProperty("dsfile", vo.getDsfile());
						jo.addProperty("dcode", vo.getDcode());
						jo.addProperty("dstart", vo.getDstart());
						jo.addProperty("dend", vo.getDend());
						jo.addProperty("dtitle2", vo.getDtitle2());
						jarray.add(jo);
					}
					jobject.add("list", jarray); 
					
					return gson.toJson(jobject);
				}
		// exhibition_past_page1.do
		@RequestMapping(value="/exhibition_past_page1.do", method=RequestMethod.GET)
		public ModelAndView exhibition_past_page1() {
			ModelAndView mv = new ModelAndView();
					
			ArrayList<DmuTicketVO> list = tagpageService.getExhibitionList("exhibition");
					
				 
			mv.addObject("list", list);
			mv.setViewName("tag_page/exhibition/exhibition_past_page1");
			return mv;
		 
		}
		// exhibition_past_page2.do
		@RequestMapping(value="/exhibition_past_page2.do", method=RequestMethod.GET)
		public ModelAndView exhibition_past_page2() {
			ModelAndView mv = new ModelAndView();
							
			ArrayList<DmuTicketVO> list = tagpageService.getExhibitionList1("exhibition");
							
						 
			mv.addObject("list", list);
			mv.setViewName("tag_page/exhibition/exhibition_past_page2");
			return mv;
				 
		}	
		// exhibition_page_det.do
		
		@RequestMapping(value="/exhibition_page_det.do", method=RequestMethod.GET)
		public ModelAndView exhibition_page_det() {
			ModelAndView mv = new ModelAndView();
			DmuTicketVO vo =tagpageService.getExhibition();
			mv.addObject("vo",vo);
			mv.setViewName("tag_page/exhibition/exhibition_page_det");
			return mv;
		}	
		// learn_page.do
		 
		@RequestMapping(value="/learn_page.do", method=RequestMethod.GET)
		public ModelAndView learn_page(String dtarget) {
			ModelAndView mv = new ModelAndView();
			
			ArrayList<DmuTicketVO> list = tagpageService.getLists2("learn",dtarget);
			ArrayList<DmuTicketVO> list2 = tagpageService.learndayAll("learn",dtarget);
			int count = tagpageService.getLearnCount(dtarget);
			
			mv.addObject("dtarget", dtarget);
			mv.addObject("count",count);
			mv.addObject("list",list);
			mv.addObject("list2",list2);
			mv.setViewName("tag_page/learn/learn_page");
			return mv;
		}
		// learn_page_ajax.do
		@ResponseBody
		@RequestMapping(value="/learn_page_ajaxlist.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
		public String learn_page_ajax(String day, String dtarget){
				ArrayList<DmuTicketVO> list;
			if(Integer.parseInt(day) == 0) {
				 list = tagpageService.getLists("learn",dtarget);
			}else {
				 list = tagpageService.getLists2("learn", dtarget);
			}
			
			JsonObject jobject = new JsonObject(); //DmuTicketVO
			JsonArray jarray = new JsonArray();  //ArrayList
			Gson gson = new Gson();
			
			for(DmuTicketVO vo : list){
				JsonObject jo = new JsonObject();
				jo.addProperty("did", vo.getDid());
				jo.addProperty("dtitle", vo.getDtitle());
				jo.addProperty("dplace", vo.getDplace());
				jo.addProperty("dfile", vo.getDfile());
				jo.addProperty("dsfile", vo.getDsfile());
				jo.addProperty("dcode", vo.getDcode());
				jo.addProperty("dstart", vo.getDstart());
				jo.addProperty("dend", vo.getDend());
				jo.addProperty("dtitle2", vo.getDtitle2());
				jo.addProperty("dnum", vo.getDnum());
				jo.addProperty("dpersonnel", vo.getDpersonnel());
				jo.addProperty("dtime", vo.getDtime());
				jo.addProperty("dprice", vo.getDprice());
				
				
				jarray.add(jo);
			}
			jobject.add("list", jarray); 
			
			return gson.toJson(jobject);
		}
		// learn_past_ajax.do
		@ResponseBody
		@RequestMapping(value="/learn_past_ajax.do", method =RequestMethod.GET,produces="text/plain;charset=UTF-8")
		public String learn_past_ajax(String day, String dtarget){
			
			ArrayList<DmuTicketVO> list=tagpageService.learnday("learn", day, dtarget);
			
			
			JsonObject jobject = new JsonObject(); //DmuTicketVO
			JsonArray jarray = new JsonArray();  //ArrayList
			Gson gson = new Gson();
			for(DmuTicketVO vo : list){
				JsonObject jo = new JsonObject();
				jo.addProperty("did", vo.getDid());
				jo.addProperty("dtitle", vo.getDtitle());
				jo.addProperty("dplace", vo.getDplace());
				jo.addProperty("dfile", vo.getDfile());
				jo.addProperty("dsfile", vo.getDsfile());
				jo.addProperty("dcode", vo.getDcode());
				jo.addProperty("dstart", vo.getDstart());
				jo.addProperty("dend", vo.getDend());
				jo.addProperty("dtarget", vo.getDtarget());
				jo.addProperty("dinformation", vo.getDinformation());
				jarray.add(jo);
			}
			jobject.add("list", jarray); 
			
			return gson.toJson(jobject);
		}
		
}
