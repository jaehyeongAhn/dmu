package com.dmu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dmu.dao.TestDAO;

@Controller
public class CalendarController {

	//캘린더 테스트 컨트롤러
	@RequestMapping(value = "/calendarTestCheck.do", method = RequestMethod.POST)
	public ModelAndView calendarTestCheck(String date) { 
		ModelAndView mv = new ModelAndView();
		
		TestDAO dao = new TestDAO();
		int result = dao.insertCalendar(date);
		if(result == 1) {
			String cdate = dao.selectCalendar(date);
			mv.addObject("cdate", cdate);
			mv.setViewName("calendarResult");
		}else {
			mv.setViewName("error_page");
		}
		
		return mv;
	}
	
	//캘린더 테스트 페이지 호출
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public ModelAndView calendar() {
		ModelAndView mv = new ModelAndView();
		
		TestDAO dao = new TestDAO();
		int date_count = dao.initCalendar();

		mv.addObject("date_count", date_count);
		mv.setViewName("calendar");
		
		return mv;
	}
}
