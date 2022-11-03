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
	 * Admin ȸ�� �� �ο� ��
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
	 * Admin ȸ�� ����Ʈ
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
	 * admin ���°� ����
	 */
	
	@Override
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
	 
	  //���� ���� �� ����
		@Override
		public List<DmuPurchaseVO> getPurchaseContent(String rid) {
			return adminDAO.purchaseContent(rid);
		}
		
		//���� ��� ��û
		@Override
		public int getPurchaseCancel(List<String> ticketList) {
			return adminDAO.purchaseCancel(ticketList);
		}

		//���� ��� Ƽ�� ī����
		@Override
		public int getPurchaseCancelTotalCount(String rid) {
			return adminDAO.purchaseCancelTotalCount(rid);	
		}
		
		//���� ���� ������Ʈ
		@Override
		public int getReservationCancel(String rid) {
			return adminDAO.reservationCancel(rid);
		}
	
	/**
	 * 1��1 ���� ����
	 */
	//���� ���� ��ü ����Ʈ
	@Override
	public List<DmuInquiryVO> getIquiryList(String answerType, int startCount, int endCount) {
		return adminDAO.inquiryList(answerType, startCount, endCount);
	}

	//���� ���� �� ����
	@Override
	public int getInquiryTotalCount(String answerType) {
		return adminDAO.inquiryTotalCount(answerType);
	}
	
	//���� ���� �� ����
	@Override
	public DmuInquiryVO getInquiryContent(String iqid) {
		return adminDAO.inquiryContent(iqid);
	}
	
	//���� ���� �̸���
	@Override
	public String getInquiryEmail(String mid) {
		return adminDAO.inquiryEmail(mid);
	}
	
	//���� ���� ���� ������Ʈ
	@Override
	public int getInquiryUpdate(String iqid) {
		return adminDAO.inquiryUpdate(iqid);
	}
	
	
	
	
	/*********  �˻����  **********/
	
	@Override
	public ArrayList<DmuMemberVO> member_search_public(int startCount, int endCount, String keyword){
		return adminDAO.member_search_public(startCount, endCount, keyword);
	}
	@Override
	public ArrayList<DmuMemberVO> member_search_admin(int startCount, int endCount, String keyword){
		return adminDAO.member_search_admin(startCount, endCount, keyword);
	}
	@Override
	public ArrayList<DmuReJoinVO> member_search_reserve(int startCount, int endCount, String keyword){
		return adminDAO.member_search_reserve(startCount, endCount, keyword);
	}
	
	@Override
	public int totalCount_publicSearch(String keyword) {
		return adminDAO.totalCount_publicSearch(keyword);
	}
	@Override
	public int totalCount_adminSearch(String keyword) {
		return adminDAO.totalCount_adminSearch(keyword);
	}
	@Override
	public int totalCount_reserveSearch(String keyword) {		
		return adminDAO.totalCount_reserveSearch(keyword);
	}
	
	
	
	
	
}
