package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuReservationVO;
import com.museum.vo.DmuTicketVO;

public interface TicketService {

	int getWriteResult(DmuTicketVO vo);  
	int getUpdate(DmuTicketVO vo);  
	DmuTicketVO getContent(String did);
	int getDelete(String did);	
	int getInsertDate(DmuReJoinVO vo);   
	String ridNew();
	int getreservationdatePay(DmuReJoinVO vo);   
	String pidNew();
	int getTicketinfo(DmuReJoinVO vo);
	DmuReJoinVO getcompletecontent(String mid);  
	int getTicketLearnCount(String dtarget); 
	ArrayList<DmuTicketVO> getLists(int startCount,int endCoiunt,String dcode , String dtarget,String day); 
	ArrayList<DmuTicketVO> getList(int startCount,int endCoiunt,String dcode,String day ); 
	
	int getTicketCount(String dcode);  
 


}
