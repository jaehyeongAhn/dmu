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
public class TagPageController {
	@Autowired
	private TicketServiceImpl ticketService;
	 
	

	// event_page.do
		 
		@RequestMapping(value="/event_page.do", method=RequestMethod.GET)
		public ModelAndView event_page( ) {
			ModelAndView mv = new ModelAndView();
			
			ArrayList<DmuTicketVO> list = ticketService.getEventContent("event");
			
		 
			mv.addObject("list", list);
			mv.setViewName("tag_page/event/event_page");
			return mv;
		}
		
	// event_page_det.do
		@RequestMapping(value="/event_page_det.do", method=RequestMethod.GET)
		public String event_page_det( ) {
		 

			return "tag_page/event/event_page_det";
		}
		 
}
 