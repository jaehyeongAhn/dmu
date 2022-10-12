package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuAdminDAO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuReJoinVO;

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
	
	/*
	 * Admin ȸ�� ����Ʈ
	 */
	@Override
	public ArrayList<DmuMemberVO> memberList(int startCount, int endCount){
		return adminDAO.memberList(startCount, endCount);
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
	public ArrayList<DmuMemberVO> reservationList(int startCount, int endCount) {
		 
		return adminDAO.reservationList(startCount, endCount);
	}

	@Override
	public DmuReJoinVO reservationContent(String mid) {
	 
		return adminDAO.reservationContent(mid);
	}
	
	
	
}
