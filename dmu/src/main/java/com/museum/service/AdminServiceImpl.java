package com.museum.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuAdminDAO;
import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuPurchaseVO;
import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuTicketVO;

@Service
public class AdminServiceImpl implements AdminService{

	
	@Autowired
	private DmuAdminDAO adminDAO;
	
	/*
	 * Admin 회원 총 로우 수
	 */
	@Override
	public int getTotalCount(){
		return adminDAO.totalCount();
	}
	@Override	
	public int getTotalCount_public(){
		return adminDAO.totalCount_public();
	}
	@Override	
	public int getTotalCount_admin() {
		return adminDAO.totalCount_admin();
	}
	public int getTotalCount_reservation() {
		return adminDAO.totalCount_reservation();
	}
	
	/*
	 * Admin 회원 리스트
	 */
	@Override
	public ArrayList<DmuMemberVO> memberList(int startCount, int endCount){
		return adminDAO.memberList(startCount, endCount);
	}
	@Override
	public ArrayList<DmuMemberVO> publicList(int startCount, int endCount){
		return adminDAO.publicList(startCount, endCount);
	}
	@Override
	public ArrayList<DmuMemberVO> adminList(int startCount, int endCount){
		return adminDAO.adminList(startCount, endCount);
	}
	
	@Override
	public DmuMemberVO getContent(String mid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public DmuMemberVO memberContent(String mid) {
		return adminDAO.memberContent(mid);
	}
	
	@Override
	public DmuMemberVO memberContent_admin(String mid) {
		return adminDAO.memberContent_admin(mid);
	}

	
	
	/*
	 * admin 상태값 변경
	 */
	
	public int updateStatus(String mid) {
		return adminDAO.updateStatus(mid);
	}
	
	
	
	/*
	 * reservation
	 */
	
	
	@Override
	public ArrayList<DmuMemberVO> reservationList(int startCount, int endCount) {
		 
		return adminDAO.reservationList(startCount, endCount);
	}

	@Override
	public DmuReJoinVO reservationContent(String rid) {
	 
		return adminDAO.reservationContent(rid);
	}
	
	  @Override public ArrayList<DmuReJoinVO> reservationDet(String rid) {
		  ArrayList<DmuReJoinVO> list = adminDAO.reservationDet(rid);
		  return list; 
	  }
	
	  @Override public DmuReJoinVO reservationDet1(String rid) { 
		  return  adminDAO.reservationDet1(rid); 
		  
	  }
	 
	  //예매 정보 상세 보기
		@Override
		public List<DmuPurchaseVO> getPurchaseContent(String rid) {
			return adminDAO.purchaseContent(rid);
		}
		
		//예매 취소 신청
		@Override
		public int getPurchaseCancel(List<String> ticketList) {
			return adminDAO.purchaseCancel(ticketList);
		}

		//예매 취소 티켓 카운팅
		@Override
		public int getPurchaseCancelTotalCount(String rid) {
			return adminDAO.purchaseCancelTotalCount(rid);	
		}
		
		//예매 정보 업데이트
		@Override
		public int getReservationCancel(String rid) {
			return adminDAO.reservationCancel(rid);
		}
	
	/**
	 * 1대1 문의 사항
	 */
	//문의 사항 전체 리스트
	@Override
	public List<DmuInquiryVO> getIquiryList(String answerType, int startCount, int endCount) {
		return adminDAO.inquiryList(answerType, startCount, endCount);
	}

	//문의 사항 총 개수
	@Override
	public int getInquiryTotalCount(String answerType) {
		return adminDAO.inquiryTotalCount(answerType);
	}
	
	//문의 사항 상세 보기
	@Override
	public DmuInquiryVO getInquiryContent(String iqid) {
		return adminDAO.inquiryContent(iqid);
	}
	
	//문의 사항 이메일
	@Override
	public String getInquiryEmail(String mid) {
		return adminDAO.inquiryEmail(mid);
	}
	
	//문의 사항 상태 업데이트
	@Override
	public int getInquiryUpdate(String iqid) {
		return adminDAO.inquiryUpdate(iqid);
	}
}
