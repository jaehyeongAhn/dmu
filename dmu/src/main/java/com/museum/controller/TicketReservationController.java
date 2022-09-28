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
import com.museum.vo.DmuReservationVO;
import com.museum.vo.DmuTicketVO;
 

@Controller
public class TicketReservationController {
	
	@Autowired
	private TicketServiceImpl ticketService;
	
	/*
	 * ticket_reservation.do 페이지 호출
	 */
	@RequestMapping(value="/ticket_reservation.do", method=RequestMethod.GET)
	public ModelAndView ticket_reservation(String did) {
		 ModelAndView mv = new ModelAndView();
		 
	 	 DmuTicketVO vo = ticketService.getContent(did); 
		
		mv.addObject("vo",vo);
		mv.setViewName("ticket/ticket_reservation/ticket_reservation");
	
		return mv;
	}

	/*
	 * ticketReservationCheck.do 페이지 호출
	 */
	
	@RequestMapping(value="/ticketReservationCheck.do",  method=RequestMethod.POST)
	public ModelAndView ticketReservationCheck(DmuReservationVO vo) {   
		ModelAndView mv = new ModelAndView();	
	
		int result = ticketService.getInsertDate(vo);
		
		if(result == 1){
			
		//	mv.addObject("join_result","ok");
			mv.setViewName("/ticket_reservation/complete");
		//	response.sendRedirect("../login/login.jsp?join=ok");  //방법 2
		}else{
  
			mv.setViewName("error_page");
		}
	
		return mv;   
	
	}
	
	
	
	
	
	
	
	
	/*
	 * ticket_complete.do 페이지 호출
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
