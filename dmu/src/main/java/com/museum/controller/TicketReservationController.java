package com.museum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuMemberDAO;
import com.museum.dao.DmuTicketDAO;
import com.museum.vo.DmuTicketVO;

@Controller
public class TicketReservationController {
	
	/*
	 * ticket_reservation.do 페이지 호출
	 */
	@RequestMapping(value="/ticket_reservation.do", method=RequestMethod.GET)
	public ModelAndView ticket_reservation(String did) {
		 ModelAndView mv = new ModelAndView();
		 DmuTicketDAO dao = new DmuTicketDAO();
	 	 DmuTicketVO vo = dao.select(did);
		
		mv.addObject("vo",vo);
		mv.setViewName("ticket/ticket_reservation/ticket_reservation");
	
		return mv;
	}

	
	/*
	 * ticket_reservation.do 페이지 호출
	 */
	@RequestMapping(value="/complete.do", method=RequestMethod.GET)
	public ModelAndView complete(String did) {
		 ModelAndView mv = new ModelAndView();
		 DmuTicketDAO dao = new DmuTicketDAO();
		 
	 	 DmuTicketVO vo = dao.select(did);
		 
	 	mv.addObject("vo",vo);
		 mv.setViewName("ticket/ticket_reservation/complete");
		return mv;
	}
	
	
	
	
}
