package com.museum.service;

import com.museum.vo.DmuMemberVO;

public interface MypageService {
	//ȸ�� ���� ��ȸ
	public DmuMemberVO memberContent(String mid);
	
	//ȸ�� Ż�� ��û
	public int memberUnregister(String mid);
}
