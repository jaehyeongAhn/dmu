package com.museum.service;

import java.util.List;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuPurchaseVO;

public interface MypageService {
	
	/*************** 예매 목록 ***************/
	//예매 리스트
	
	//예매 정보 상세 보기
	public List<DmuPurchaseVO> getPurchaseContent(String rid);
	
	/*************** 나의 문의 ***************/
	//문의 사항 등록
	public int inquiryInsert(DmuInquiryVO vo);

	//문의 사항 총 갯수
	public int getInquiryTotalCount(String mid);
	
	//문의 사항 리스트
	public List<DmuInquiryVO> getInquiryList(int startCount, int endCount, String mid);

	//문의 사항 상세 조회
	public DmuInquiryVO getInquiryContent(String iqid);
	
	
	/************** 개인정보 변경/탈퇴 ***************/
	//회원 정보 조회
	public DmuMemberVO memberContent(String mid);

	//회원 정보 수정
	public int memberUpdate(DmuMemberVO vo, String type);
	
	//회원 탈퇴 신청
	public int memberUnregister(String mid);
}
