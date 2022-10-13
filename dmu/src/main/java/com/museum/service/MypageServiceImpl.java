package com.museum.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.museum.dao.DmuMypageDAO;
import com.museum.vo.DmuMemberVO;

public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private DmuMypageDAO mypageDao;
	
	//ȸ�� ���� �� ��ȸ
	@Override
	public DmuMemberVO memberContent(String mid) {
		return mypageDao.memberContent(mid);
	}
	
	//ȸ�� Ż�� ��û
	@Override
	public int memberUnregister(String mid) {
		return mypageDao.memberUnregister(mid);
	}
}
