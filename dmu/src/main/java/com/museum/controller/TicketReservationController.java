package com.museum.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.museum.service.TicketServiceImpl;
import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuReservationVO;
 

@Controller
public class TicketReservationController {

	@Autowired
	private TicketServiceImpl ticketService;

	//ticketSellout_check.do : 남은 잔여 티켓 확인
	@ResponseBody
	@RequestMapping(value = "/ticketSellout_check.do", method = RequestMethod.POST)
	public String ticketSellout_check(DmuReservationVO vo, String dpersonnel) {
		
		JsonObject jobject = new JsonObject();
		Gson gson = new Gson();
		String result = ticketService.ticketSellout(vo.getDid(), vo.getRdate());

		//정원 수가 있을 경우
		if(dpersonnel != null) {
			//티켓 수가 정원보다 작거나 같은 경우
			if(vo.getRtotal() <= Integer.parseInt(dpersonnel)) {
				//결과가 null이 아닐 경우
				if(result != null) {
					if(Integer.parseInt(result) < vo.getRtotal()) {
						//잔여 티켓이 선택한 티켓 수보다 적을 때
						jobject.addProperty("ticket", "no");
					}else {
						//잔여 티켓이 선택한 티켓 수보다 많을 때
						jobject.addProperty("ticket", "ok");
					}
				}else {
					jobject.addProperty("ticket", "ok");
				}
			}else {
				//처음부터 정원 수보다 많은 티켓을 선택했을 때
				jobject.addProperty("ticket", "not_personnel");
			}

		}
		jobject.addProperty("ticket_count", result);
		return gson.toJson(jobject);
	}
	
	/*
	 * ticket_reservation.do 페이지 호출
	 */
	@RequestMapping(value = "/ticket_reservation.do", method = RequestMethod.POST)
	public ModelAndView ticket_reservation(DmuReJoinVO vo) {		
		  ModelAndView mv = new ModelAndView();
	
		  mv.addObject("vo", vo);
		  mv.setViewName("ticket/ticket_reservation/ticket_reservation");
		 
		return mv;
	}

	/*
	 * ticketReservationCheck.do 페이지 호출
	 */

	@RequestMapping(value = "/paymenInsert.do", method = RequestMethod.POST)
	public ModelAndView ticketReservationCheck(DmuReJoinVO vo) {
		ModelAndView mv = new ModelAndView();

		//현재 날짜
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		String today = now.format(formatter);
		
		//랜덤
		Random random_rid = new Random();
		int random = random_rid.nextInt(9999);
		String rid = today + String.format("%04d", random);
		vo.setRid(rid);
		
		int result = ticketService.getInsertDate(vo);
		
			vo.setRid(vo.getRid() + ticketService.ridNew());
			
			//pid 랜덤
			Random random_pid = new Random();
			random = random_pid.nextInt(9999);
			vo.setPid(rid + String.format("%04d", random));
			
			result += ticketService.getreservationdatePay(vo);

		if (result == 2) {
		 
			//vo.setPid(ticketService.pidNew());
			
			for(int i=0; i<vo.getRtotal(); i++) {
				//tid 랜덤
				Random random_tid = new Random();
				random = random_tid.nextInt(9999);
				vo.setTid(vo.getPid() + random);
				
				result += ticketService.getTicketinfo(vo);
			}
			
			int total_count = vo.getRtotal() + 2;
			if(result == total_count) {
				mv.setViewName("redirect:/complete.do");					
			}else {
				mv.setViewName("error_page");				
			}
			
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
 
	 

}
