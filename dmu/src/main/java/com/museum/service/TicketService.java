package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuReservationVO;
import com.museum.vo.DmuTicketVO;

public interface TicketService {
	int getWriteResult(DmuTicketVO vo); //�Խ��� �۾���
	int getTotalCount(); //��ü ȸ���� 
	ArrayList<DmuTicketVO> getList(int startCount,int endCount); //exhibition ��ü ����Ʈ
	
	DmuTicketVO getContent(String did);
	int getticketReservationCheck(DmuReservationVO vo);
	int getInsertDate(DmuReservationVO vo);
	DmuReservationVO getReservationcontent(String did);
}
