package com.museum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

 
import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuReJoinVO;
 

@Controller
public class TicketReservationController {

	@Autowired
	private TicketServiceImpl ticketService;

	/*
	 * ticket_reservation.do 페이지 호출
	 */
	@RequestMapping(value = "/ticket_reservation.do", method = RequestMethod.POST)
	public ModelAndView ticket_reservation(DmuReJoinVO vo) {		
		  ModelAndView mv = new ModelAndView();
		  
		  mv.addObject("vo", vo);
		  mv.setViewName("ticket/ticket_reservation/ticket_reservation");
		 

		return mv;
	}

	/*
	 * ticketReservationCheck.do 페이지 호출
	 */

	@RequestMapping(value = "/ticketReservationCheck.do", method = RequestMethod.POST)
	public ModelAndView ticketReservationCheck(DmuReJoinVO vo) {
		ModelAndView mv = new ModelAndView();

		int result = ticketService.getInsertDate(vo);

		if (result == 1) {

			mv.setViewName("redirect:/complete.do");
		} else {

			mv.setViewName("error_page");
		}

		return mv;

	}

	/*
	 * ticket_complete.do 페이지 호출
	 */
	@RequestMapping(value = "/complete.do", method = RequestMethod.GET)
	public ModelAndView complete(String mid) {
		ModelAndView mv = new ModelAndView();

		DmuReJoinVO vo = ticketService.getcompletecontent(mid);

		mv.addObject("vo", vo);
		mv.setViewName("ticket/ticket_reservation/complete");
		return mv;
	}

	
	 
	 

}
