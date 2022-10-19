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
	ArrayList<DmuTicketVO> getLists(int startCount,int endCount,String dcode , String dtarget);  
	ArrayList<DmuTicketVO> getList(int startCount,int endCount,String dcode );  
	int getTicketCount(String dcode);  
	 
	
	//tag_page
	ArrayList<DmuTicketVO> getEventContent(String dcode);
}
