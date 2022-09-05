package com.museum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TicketController {
	//exhibition_list :전시회 리스트
	@RequestMapping(value="/exhibition_list.do", method=RequestMethod.GET)
	public String exhibition_list() {
		return "list/exhibition_list";
	}
	//learn_list :프로그렘 리스트
	@RequestMapping(value="/learn_list.do", method=RequestMethod.GET)
	public String learn_list() {
		return "list/learn_list";
	}
	//event_list :이벤트 리스트
		@RequestMapping(value="/event_list.do", method=RequestMethod.GET)
		public String event_list() {
			return "list/event_list";
		}
		
	// ticketlist_write.do : 게시판 글쓰기 화면
		 
		@RequestMapping(value="/ticketlist_write.do", method=RequestMethod.GET)
		public String board_write() {
			return "/list/ticketlist_write";
		}
		
}
