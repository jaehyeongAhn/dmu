package com.museum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TicketController {
	//exhibition_list :����ȸ ����Ʈ
	@RequestMapping(value="/exhibition_list.do", method=RequestMethod.GET)
	public String exhibition_list() {
		return "list/exhibition_list";
	}
	//learn_list :���α׷� ����Ʈ
	@RequestMapping(value="/learn_list.do", method=RequestMethod.GET)
	public String learn_list() {
		return "list/learn_list";
	}
	//event_list :�̺�Ʈ ����Ʈ
		@RequestMapping(value="/event_list.do", method=RequestMethod.GET)
		public String event_list() {
			return "list/event_list";
		}
		
	// ticketlist_write.do : �Խ��� �۾��� ȭ��
		 
		@RequestMapping(value="/ticketlist_write.do", method=RequestMethod.GET)
		public String board_write() {
			return "/list/ticketlist_write";
		}
		
}
