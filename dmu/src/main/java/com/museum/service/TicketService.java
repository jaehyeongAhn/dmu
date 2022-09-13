package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuTicketVO;

public interface TicketService {
	int getWriteResult(DmuTicketVO vo); //게시판 글쓰기
	int getTotalCount(); //전체 회원수 
	ArrayList<DmuTicketVO> getList(int startCount,int endCount); //exhibition 전체 리스트
}
