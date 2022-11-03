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

	//ticketSellout_check.do : ���� �ܿ� Ƽ�� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/ticketSellout_check.do", method = RequestMethod.POST)
	public String ticketSellout_check(DmuReservationVO vo, String dpersonnel) {
		
		JsonObject jobject = new JsonObject();
		Gson gson = new Gson();
		String result = ticketService.ticketSellout(vo.getDid(), vo.getRdate());

		//���� ���� ���� ���
		if(dpersonnel != null) {
			//Ƽ�� ���� �������� �۰ų� ���� ���
			if(vo.getRtotal() <= Integer.parseInt(dpersonnel)) {
				//����� null�� �ƴ� ���
				if(result != null) {
					if(Integer.parseInt(result) < vo.getRtotal()) {
						//�ܿ� Ƽ���� ������ Ƽ�� ������ ���� ��
						jobject.addProperty("ticket", "no");
					}else {
						//�ܿ� Ƽ���� ������ Ƽ�� ������ ���� ��
						jobject.addProperty("ticket", "ok");
					}
				}else {
					jobject.addProperty("ticket", "ok");
				}
			}else {
				//ó������ ���� ������ ���� Ƽ���� �������� ��
				jobject.addProperty("ticket", "not_personnel");
			}

		}
		jobject.addProperty("ticket_count", result);
		return gson.toJson(jobject);
	}
	
	/*
	 * ticket_reservation.do ������ ȣ��
	 */
	@RequestMapping(value = "/ticket_reservation.do", method = RequestMethod.POST)
	public ModelAndView ticket_reservation(DmuReJoinVO vo) {		
		  ModelAndView mv = new ModelAndView();
	
		  mv.addObject("vo", vo);
		  mv.setViewName("ticket/ticket_reservation/ticket_reservation");
		 
		return mv;
	}

	/*
	 * ticketReservationCheck.do ������ ȣ��
	 */

	@RequestMapping(value = "/paymenInsert.do", method = RequestMethod.POST)
	public ModelAndView ticketReservationCheck(DmuReJoinVO vo) {
		ModelAndView mv = new ModelAndView();

		//���� ��¥
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		String today = now.format(formatter);
		
		//����
		Random random_rid = new Random();
		int random = random_rid.nextInt(9999);
		String rid = today + String.format("%04d", random);
		vo.setRid(rid);
		
		int result = ticketService.getInsertDate(vo);
		
			vo.setRid(vo.getRid() + ticketService.ridNew());
			
			//pid ����
			Random random_pid = new Random();
			random = random_pid.nextInt(9999);
			vo.setPid(rid + String.format("%04d", random));
			
			result += ticketService.getreservationdatePay(vo);

		if (result == 2) {
		 
			//vo.setPid(ticketService.pidNew());
			
			for(int i=0; i<vo.getRtotal(); i++) {
				//tid ����
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
	 * ticket_complete.do ������ ȣ��
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
