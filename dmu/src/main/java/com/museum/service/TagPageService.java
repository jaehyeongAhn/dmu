package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuTicketVO;

public interface TagPageService {
	DmuTicketVO getExhibition();
	ArrayList<DmuTicketVO> getExhibitionList(String dcode);
	ArrayList<DmuTicketVO> getExhibitionList1(String dcode);
	ArrayList<DmuTicketVO> getDayList(String dcode ,String day);  
	ArrayList<DmuTicketVO> getDayList1(String dcode ,String day);  
	ArrayList<DmuTicketVO> getDayList2(String dcode ,String day);  
	ArrayList<DmuTicketVO> learnday(String dcode ,String day,String dtarget);  
	ArrayList<DmuTicketVO> learndayAll(String dcode ,String dtarget);  
	ArrayList<DmuTicketVO> getEventContent(String dcode);
	ArrayList<DmuTicketVO> getLists(String dcode , String dtarget); 
	ArrayList<DmuTicketVO> getLists2(String dcode , String dtarget); 
	int getLearnCount(String dtarget); 
}
