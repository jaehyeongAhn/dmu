package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuReJoinVO;

public interface AdminService {
	
	int getTotalCount();
	ArrayList<DmuMemberVO> memberList(int startCount, int endCount);
	DmuMemberVO getContent(String mid);
	DmuMemberVO memberContent(String mid);
	
	ArrayList<DmuMemberVO> reservationList(int startCount, int endCount);
	DmuReJoinVO reservationContent(String mid);
}
