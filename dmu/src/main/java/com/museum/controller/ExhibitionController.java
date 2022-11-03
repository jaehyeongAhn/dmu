package com.museum.controller;

 
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuTicketVO;
 
 
 
 

@Controller
public class ExhibitionController {
	
	@Autowired
	private TicketServiceImpl ticketService;
	
	//ticketSellout.do
	@ResponseBody
	@RequestMapping(value = "/ticketSellout.do", method = RequestMethod.POST)
	public String ticketSellout(String did, String rdate) {
		String total = ticketService.ticketSellout(did, rdate);
		
		return String.valueOf(total);
	}
	
	
	/*
	 *  exhibition.do 
	 */
	@RequestMapping(value="/exhibition.do", method=RequestMethod.GET)
	public ModelAndView exhibition(String did) {
 
		ModelAndView mv = new ModelAndView();
		 
		DmuTicketVO vo =  ticketService.getContent(did);
		if(vo.getDtime() != null) {
			vo.setDtime(vo.getDtime().replace("\r\n", "<br/>"));
		}
		if(vo.getDinformation() != null) {
			vo.setDinformation(vo.getDinformation().replace("\r\n", "<br/>"));
		}
		mv.addObject("vo",vo);
		mv.setViewName("ticket/exhibition/exhibition");
		
		return mv;
	}
 
	@RequestMapping(value="/learn.do", method=RequestMethod.GET)
	public ModelAndView learn(String did) {
		ModelAndView mv = new ModelAndView();
		 
		DmuTicketVO vo =  ticketService.getContent(did);
		if(vo.getDtime() != null) {
			vo.setDtime(vo.getDtime().replace("\r\n", "<br/>"));
		}
		if(vo.getDinformation() != null) {
			vo.setDinformation(vo.getDinformation().replace("\r\n", "<br/>"));
		}
		mv.addObject("vo",vo);
		mv.setViewName("ticket/learn/learn");
		
		return mv;
		
		
		 
	}
	
	@RequestMapping(value="/event.do", method=RequestMethod.GET)
	public ModelAndView event(String did) {
		ModelAndView mv = new ModelAndView();
		 
		DmuTicketVO vo =  ticketService.getContent(did);
		if(vo.getDtime() != null) {
			vo.setDtime(vo.getDtime().replace("\r\n", "<br/>"));
		}
		if(vo.getDinformation() != null) {
			vo.setDinformation(vo.getDinformation().replace("\r\n", "<br/>"));
		}
		mv.addObject("vo",vo);
		mv.setViewName("ticket/event/event");
		
		return mv;
	}
	
	
	
	 
	
	
	 
	 
	 
}
