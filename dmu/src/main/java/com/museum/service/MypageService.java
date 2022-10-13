package com.museum.service;

import com.museum.vo.DmuMemberVO;

public interface MypageService {
	//회원 정보 조회
	public DmuMemberVO memberContent(String mid);
	
	//회원 탈퇴 신청
	public int memberUnregister(String mid);
}
