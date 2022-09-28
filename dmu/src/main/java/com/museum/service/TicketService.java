package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuTicketVO;

public interface TicketService {
	int getWriteResult(DmuTicketVO vo); //티켓 계시판 작성하기 
	int getUpdate(DmuTicketVO vo); //티켓 계시판 업데이트 
	int getTotalCount(); // 티켓 계시판 로우 구하기 
	ArrayList<DmuTicketVO> getList(int startCount,int endCount); //티켓 계시판 리스트 출력 
	DmuTicketVO getContent(String did); // 티켓 계시판 상세보기 
	int getDelete(String did);		//티켓 계시판 삭제하기 
	int getTicketCount(String dcode); //티켓 계시판 총 갯수 구하기 
}
