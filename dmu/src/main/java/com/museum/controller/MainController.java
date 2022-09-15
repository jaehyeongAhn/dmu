package com.museum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/header.do", method=RequestMethod.GET)
	public String header() {
		return "header";
	}
	
	@RequestMapping(value="/footer.do", method=RequestMethod.GET)
	public String footer() {
		return "footer";
	}
	@RequestMapping(value="/sitemap.do", method=RequestMethod.GET)
	public String sitemap() {
		return "sitemap";
	}
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
	@RequestMapping(value="/visit_map2.do", method=RequestMethod.GET)
	public String visit_map2() {
		return "/visit/visit_map2";
	}
	
}
