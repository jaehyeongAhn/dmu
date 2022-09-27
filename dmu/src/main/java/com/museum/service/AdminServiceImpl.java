package com.museum.service;

import java.util.ArrayList;

import com.museum.dao.DmuAdminDAO;
import com.museum.dao.DmuMemberDAO;
import com.museum.dao.DmuNoticeDAO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;

public class AdminServiceImpl implements AdminService{

	
	/*
	 * Admin 회원 총 로우 수
	 */
	@Override
	public int getTotalCount(){
		DmuAdminDAO dao = new DmuAdminDAO();
		int dbCount = dao.totalCount();
		return dbCount;
	}
	
	/*
	 * Admin 회원 리스트
	 */
	@Override
	public ArrayList<DmuMemberVO> memberList(int startCount, int endCount){
		DmuAdminDAO dao = new DmuAdminDAO();
		ArrayList<DmuMemberVO> mlist = dao.memberList(startCount, endCount);
		return mlist;
	}

	@Override
	public DmuMemberVO getContent(String nid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
