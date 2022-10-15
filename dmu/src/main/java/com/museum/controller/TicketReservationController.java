package com.museum.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuMemberDAO;
import com.museum.dao.DmuTicketDAO;
import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuReservationVO;
import com.museum.vo.DmuTicketVO;

@Controller
public class TicketReservationController {

	@Autowired
	private TicketServiceImpl ticketService;

	/*
	 * ticket_reservation.do 페이지 호출
	 */
	@RequestMapping(value = "/ticket_reservation.do", method = RequestMethod.GET)
	public ModelAndView ticket_reservation(String did) {
		ModelAndView mv = new ModelAndView();

		DmuReJoinVO vo = ticketService.getReservationcontent(did);

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

			mv.setViewName("redirect:/ticket_reservation.do");
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

	
	/* ticketCompletenCheck.do 페이지 호출 */
	  
	   
	  @RequestMapping(value="/ticketCompletenCheck.do", method=RequestMethod.POST)
	  public ModelAndView ticketCompletenCheck(DmuReJoinVO vo) { 
		  ModelAndView mv =  new ModelAndView();
	  
	  
	  int result = ticketService.getInsertDateComplete(vo);
	  
	  if(result == 1){
	  
	  mv.setViewName("redirect:/complete.do"); 
	 
	  }else{
	  
		  mv.setViewName("error_page"); }
	  
	  return mv;
	  
	  }
	 

}
