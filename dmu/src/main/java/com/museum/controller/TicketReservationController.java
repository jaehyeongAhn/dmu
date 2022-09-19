package com.museum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TicketReservationController {
	
	/*
	 * ticket_reservation.do 페이지 호출
	 */
	@RequestMapping(value="/ticket_reservation.do", method=RequestMethod.GET)
	public String ticket_reservation() {
		 
	
		return "ticket/ticket_reservation/ticket_reservation";
	}

	
	
	
	
	
	
}
