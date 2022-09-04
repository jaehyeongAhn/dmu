package com.dmu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dmu.dao.TicketDAO;
import com.dmu.vo.ExhibitionVO;

@Controller
public class ExhibitionController {
	
	/*
	 *  exhibition.do 페이지 호출
	 */
	@RequestMapping(value="/exhibition.do", method=RequestMethod.GET)
	public String exhibition() {
		return "/exhibition/exhibition";
	}
	
	@RequestMapping(value="/exhibition_write.do", method=RequestMethod.GET)
	public String exhibition_write() {
		return "/exhibition/exhibition_write";
	}
	
	@RequestMapping(value="/exhibition_write_check.do", method=RequestMethod.POST)
	public ModelAndView exhibition_write_check(ExhibitionVO vo) {
		ModelAndView mv = new ModelAndView();
		TicketDAO dao = new TicketDAO();
		int result =  dao.insert(vo);
		
		mv.addObject("vo",vo);
		mv.setViewName("redirect:/exhibition.do");
		
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/learn.do", method=RequestMethod.GET)
	public String learn() {
		return "/learn/learn";
	}
	
	@RequestMapping(value="/event.do", method=RequestMethod.GET)
	public String event() {
		return "/event/event";
	}
	 
}
