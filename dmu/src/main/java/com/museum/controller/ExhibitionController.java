package com.museum.controller;

 
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.DmuTicketDAO;
import com.museum.service.TicketService;
import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuTicketVO;
 
 
 
 

@Controller
public class ExhibitionController {
	
	@Autowired
	private TicketServiceImpl ticketService;
	
	
	
	/*
	 *  exhibition.do ������ ȣ��
	 */
	@RequestMapping(value="/exhibition.do", method=RequestMethod.GET)
	public ModelAndView exhibition(String did) {
		ModelAndView mv = new ModelAndView();
		 
		DmuTicketVO vo =  ticketService.getContent(did);
 	 
		mv.addObject("vo",vo);
		mv.setViewName("ticket/exhibition/exhibition");
		
		return mv;
	}
 
	@RequestMapping(value="/learn.do", method=RequestMethod.GET)
	public ModelAndView learn(String did) {
		ModelAndView mv = new ModelAndView();
		 
		DmuTicketVO vo =  ticketService.getContent(did);
 	 
		mv.addObject("vo",vo);
		mv.setViewName("ticket/learn/learn");
		
		return mv;
		
		
		 
	}
	
	@RequestMapping(value="/event.do", method=RequestMethod.GET)
	public ModelAndView event(String did) {
		ModelAndView mv = new ModelAndView();
		 
		DmuTicketVO vo =  ticketService.getContent(did);
 	 
		mv.addObject("vo",vo);
		mv.setViewName("ticket/event/event");
		
		return mv;
	}
	
	
	
	 
	
	
	 
	 
	 
}
