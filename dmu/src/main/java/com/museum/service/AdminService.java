package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuReJoinVO;

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
	DmuReJoinVO reservationContent(String mid);
}
