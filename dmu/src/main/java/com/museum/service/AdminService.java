package com.museum.service;

import java.util.ArrayList;
import java.util.List;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuPurchaseVO;
import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuTicketVO;

public interface AdminService {
	
	int getTotalCount();
	int getTotalCount_public();
	int getTotalCount_admin();
	int getTotalCount_reservation();
	ArrayList<DmuMemberVO> memberList(int startCount, int endCount);
	ArrayList<DmuMemberVO> publicList(int startCount, int endCount);
	ArrayList<DmuMemberVO> adminList(int startCount, int endCount);
	DmuMemberVO getContent(String mid);
	DmuMemberVO memberContent(String mid);
	DmuMemberVO memberContent_admin(String mid);
	int updateStatus(String mid);
	
	ArrayList<DmuMemberVO> reservationList(int startCount, int endCount);
	DmuReJoinVO reservationContent(String rid);
	
 
	 ArrayList<DmuReJoinVO> reservationDet(String rid); 
	 DmuReJoinVO reservationDet1(String rid);
 
	//예매 정보 상세 보기
	public List<DmuPurchaseVO> getPurchaseContent(String rid);
	//예매 취소 신청
	public int getPurchaseCancel(List<String> ticketList);
	//예매 취소 티켓 카운팅
	public int getPurchaseCancelTotalCount(String rid);
	
	//예매 정보 업데이트
	public int getReservationCancel(String rid);
	
	/******* 1대1 문의 ***********/
	public List<DmuInquiryVO> getIquiryList(String answerType, int startCount, int endCount);
	public int getInquiryTotalCount(String answerType);
	public DmuInquiryVO getInquiryContent(String iqid);
	public String getInquiryEmail(String mid);
	public int getInquiryUpdate(String iqid);
 
}
