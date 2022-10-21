package com.museum.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.museum.service.TagPageServiceImpl;
import com.museum.vo.DmuTicketVO;

@Controller
public class MainController {
	@Autowired TagPageServiceImpl tagpageService;
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		DmuTicketVO vo =tagpageService.getExhibition();
		mv.addObject("vo",vo);
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value="/header.do", method=RequestMethod.GET)
	public String header() {
		return "header";
	}
	
	@RequestMapping(value="/footer.do", method=RequestMethod.GET)
	public String footer() {
		return "footer";
	}
	
	/**
	 * main - visit
	 */
	
	@RequestMapping(value="/visit_main.do", method=RequestMethod.GET)
	public String visit_main() {
		return "/visit/visit_main";
	}
	@RequestMapping(value="/visit_info.do", method=RequestMethod.GET)
	public String visit_info() {
		return "/visit/visit_info";
	}
	
	@RequestMapping(value="/visit_map1.do", method=RequestMethod.GET)
	public String visit_map1() {
		return "/visit/visit_map1";
	}
	/*
	 * @RequestMapping(value="/visit_map2.do", method=RequestMethod.GET) public
	 * String visit_map2() { return "/visit/visit_map2"; }
	 */
	
	/**
	 * footer - sitemap
	 */
	@RequestMapping(value="/sitemap.do", method=RequestMethod.GET)
	public String sitemap() {
		return "sitemap";
	}
	
	/**
	 * footer - terms
	 */
	@RequestMapping(value="/terms_media.do", method=RequestMethod.GET)
	public String terms_media() {
		return "/terms/terms_media";
	}
	@RequestMapping(value="/terms_privacy.do", method=RequestMethod.GET)
	public String terms_privacy() {
		return "/terms/terms_privacy";
	}
	@RequestMapping(value="/terms_terms.do", method=RequestMethod.GET)
	public String terms_terms() {
		return "/terms/terms_terms";
	}
 
	
}
