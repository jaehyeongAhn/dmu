package com.museum.controller;

 
import java.io.File;

 
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
 

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuTicketVO;

 


@Controller
public class TagPageController {
	 
	@Autowired TicketServiceImpl ticketService;

		// event_page.do
		 
		@RequestMapping(value="/event_page.do", method=RequestMethod.GET)
 
		public ModelAndView event_page( ) {
			ModelAndView mv = new ModelAndView();
			
			ArrayList<DmuTicketVO> list = ticketService.getEventContent("event");
			
		 
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
		public String exhibition_page() {
			return "tag_page/exhibition/exhibition_page";
		}	
		// exhibition_past_page.do
		
		@RequestMapping(value="/exhibition_past_page.do", method=RequestMethod.GET)
		public String exhibition_past_page() {
			return "tag_page/exhibition/exhibition_past_page";
		}	
		// exhibition_page_det.do
		
		@RequestMapping(value="/exhibition_page_det.do", method=RequestMethod.GET)
		public String exhibition_page_det() {
			return "tag_page/exhibition/exhibition_page_det";
		}	
		// learn_page.do
		 
		@RequestMapping(value="/learn_page.do", method=RequestMethod.GET)
		public String learn_page() {
			return "tag_page/learn/learn_page";
		}
		// learn_page_det.do
		
		@RequestMapping(value="/learn_page_det.do", method=RequestMethod.GET)
		public String learn_page_det() {
			return "tag_page/learn/learn_page_det";
		}
}
