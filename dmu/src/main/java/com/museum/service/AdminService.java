package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;

public interface AdminService {
	
	int getTotalCount();
	ArrayList<DmuMemberVO> memberList(int startCount, int endCount);
	DmuMemberVO getContent(String nid);
	
	
	
}
