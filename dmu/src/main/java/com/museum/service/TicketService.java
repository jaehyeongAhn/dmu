package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuReservationVO;
import com.museum.vo.DmuTicketVO;

public interface TicketService {
	int getWriteResult(DmuTicketVO vo); //게시판 글쓰기
	int getUpdate(DmuTicketVO vo); //게시판 업데이트
	int getTotalCount(); //전체 회원수 
	ArrayList<DmuTicketVO> getList(int startCount,int endCount); //exhibition 전체 리스트
	
	DmuTicketVO getContent(String did);
	int getDelete(String did);		//공지사항 삭제 처리
	
	 
	int getInsertDate(DmuReJoinVO vo); //reservation 에 값 넣기
	DmuReJoinVO getReservationcontent(String did);  //reservation 페이지 호출
	DmuReJoinVO getcompletecontent(String did);  //complete 페이지 호출
	
}
