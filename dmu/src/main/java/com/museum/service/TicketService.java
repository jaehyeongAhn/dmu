package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuReservationVO;
import com.museum.vo.DmuTicketVO;

public interface TicketService {
	int getWriteResult(DmuTicketVO vo); //게시판 글쓰기
	int getTotalCount(); //전체 회원수 
	ArrayList<DmuTicketVO> getList(int startCount,int endCount); //exhibition 전체 리스트
	
	DmuTicketVO getContent(String did);
	int getticketReservationCheck(DmuReservationVO vo);
	int getInsertDate(DmuReservationVO vo);
	DmuReservationVO getReservationcontent(String did);
}
