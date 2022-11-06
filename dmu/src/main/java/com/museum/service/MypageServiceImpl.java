package com.museum.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuMypageDAO;
import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuPurchaseTicketVO;
import com.museum.vo.DmuPurchaseVO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private DmuMypageDAO mypageDao;

	/********************* 예매 목록 ************************/
	//예매 기한 만료 티켓 조회
	@Override
	public List<String> getPurchaseExpire() {
		return mypageDao.purchaseExpire();
	}
	
	//예매 기한 만료
	@Override
	public int getReservationExpire(List<String> expireList) {
		return mypageDao.reservationExpire(expireList);
	}
	
	//예매 티켓 기한 만료
	@Override
	public int getTicketExpire(List<String> expireList) {
		return mypageDao.ticketExpire(expireList);
	}
	
	//예매 리스트
	@Override
	public List<DmuPurchaseVO> getPurchaseList(Map<String, Object> list_param){
		return mypageDao.purchaseList(list_param);		
	}

	//예매 목록 총 갯수
	@Override
	public int getPurchaseListTotalCount(Map<String, Object> list_param) {
		return mypageDao.purchaseListTotalCount(list_param);
	}
	
	//예매 정보 상세 보기
	@Override
	public List<DmuPurchaseVO> getPurchaseContent(String rid) {
		return mypageDao.purchaseContent(rid);
	}
	
	//예매 취소 신청
	@Override
	public int getPurchaseCancel(List<String> ticketList) {
		return mypageDao.purchaseCancel(ticketList);
	}

	//예매 취소 티켓 카운팅
	@Override
	public int getPurchaseCancelTotalCount(String rid) {
		return mypageDao.purchaseCancelTotalCount(rid);	
	}
	
	//예매 정보 업데이트
	@Override
	public int getReservationCancel(String rid) {
		return mypageDao.reservationCancel(rid);
	}
	
	/********************* 나의 문의 ************************/
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
	
	
	/********************* 개인정보 변경/탈퇴 ************************/
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
	
	//회원 탈퇴 신청 - 일주일 이상 경과 회원
	@Override
	public int memberWithdraw() {
		return mypageDao.memberWithdraw();
	};
}
