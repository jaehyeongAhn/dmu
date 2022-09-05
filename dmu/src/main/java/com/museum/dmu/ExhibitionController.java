package com.museum.dmu;

 
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.dao.TicketDAO;
import com.museum.vo.ExhibitionVO;
 
 
 

@Controller
public class ExhibitionController {
	
	/*
	 *  exhibition.do 페이지 호출
	 */
	@RequestMapping(value="/exhibition.do", method=RequestMethod.GET)
	public ModelAndView exhibition(String did) {
		ModelAndView mv = new ModelAndView();
		TicketDAO dao = new TicketDAO();
		ExhibitionVO vo = dao.select(did);
		
		
		/*
		 * int startCount = 0; int endCount = 0;
		 * 
		 * // ArrayList<ExhibitionVO> list = dao.select(startCount, endCount);
		 */		
		mv.addObject("vo",vo);
		mv.setViewName("/exhibition/exhibition");
		
		return mv;
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
		 
		if(result == 1) {
		
	 
		mv.setViewName("redirect:/exhibition_list.do");
		 
		}else {			
			mv.setViewName("error_page");
		}
			
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
	
	
	
	/////////////////LIST////////////////
	
	@RequestMapping(value="/exhibition_list.do", method=RequestMethod.GET)
	public ModelAndView exhibition_list(String did) {
		
		ModelAndView mv = new ModelAndView();
		TicketDAO dao = new TicketDAO();
		
		
		mv.setViewName("/ticketlist/exhibition_list");
		
		return mv;
	}
	
	
	 
	@RequestMapping(value="/learn_list.do", method=RequestMethod.GET)
	public String learn_list() {
		return "ticketlist/learn_list";
	}
 
		@RequestMapping(value="/event_list.do", method=RequestMethod.GET)
		public String event_list() {
			return "ticketlist/event_list";
		}
	 
}
