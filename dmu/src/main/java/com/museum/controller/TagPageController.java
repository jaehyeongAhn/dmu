package com.museum.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

 


@Controller
public class TagPageController {
	 
	

		// event_page.do
		 
		@RequestMapping(value="/event_page.do", method=RequestMethod.GET)
		public String event_page() {
			return "tag_page/event/event_page";
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