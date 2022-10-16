package com.museum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.museum.dao.DmuMypageDAO;
import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;

public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private DmuMypageDAO mypageDao;
	
	//문의 사항 등록
	@Override
	public int inquiryInsert(DmuInquiryVO vo) {
		return mypageDao.inquiryInsert(vo);
	}

	//문의 사항 총 갯수
	public int getInquiryTotalCount(String mid) {
		return mypageDao.inquiryTotalCount(mid);
	}
	
	//문의 사항 리스트
	@Override
	public List<DmuInquiryVO> getInquiryList(int startCount, int endCount, String mid) {
		return mypageDao.inquiryList(startCount, endCount, mid);
	}

	//문의 사항 상세 조회
	@Override
	public DmuInquiryVO getInquiryContent(String iqid) {
		return mypageDao.inquiryContent(iqid);
	}
	
	//회원 정보 상세 조회
	@Override
	public DmuMemberVO memberContent(String mid) {
		return mypageDao.memberContent(mid);
	}
	
	//회원 정보 수정
	@Override
	public int memberUpdate(DmuMemberVO vo, String type) {
		return mypageDao.memberUpdate(vo, type);
	}
	
	//회원 탈퇴 신청
	@Override
	public int memberUnregister(String mid) {
		return mypageDao.memberUnregister(mid);
	}
}
