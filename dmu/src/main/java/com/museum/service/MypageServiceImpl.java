package com.museum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.museum.dao.DmuMypageDAO;
import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;

public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private DmuMypageDAO mypageDao;
	
	//���� ���� ���
	@Override
	public int inquiryInsert(DmuInquiryVO vo) {
		return mypageDao.inquiryInsert(vo);
	}

	//���� ���� �� ����
	public int getInquiryTotalCount(String mid) {
		return mypageDao.inquiryTotalCount(mid);
	}
	
	//���� ���� ����Ʈ
	@Override
	public List<DmuInquiryVO> getInquiryList(int startCount, int endCount, String mid) {
		return mypageDao.inquiryList(startCount, endCount, mid);
	}

	//���� ���� �� ��ȸ
	@Override
	public DmuInquiryVO getInquiryContent(String iqid) {
		return mypageDao.inquiryContent(iqid);
	}
	
	//ȸ�� ���� �� ��ȸ
	@Override
	public DmuMemberVO memberContent(String mid) {
		return mypageDao.memberContent(mid);
	}
	
	//ȸ�� ���� ����
	@Override
	public int memberUpdate(DmuMemberVO vo, String type) {
		return mypageDao.memberUpdate(vo, type);
	}
	
	//ȸ�� Ż�� ��û
	@Override
	public int memberUnregister(String mid) {
		return mypageDao.memberUnregister(mid);
	}
}
