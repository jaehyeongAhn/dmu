package com.museum.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuPurchaseVO;

@Repository
public class DmuMypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.mypage";
	
	
	/************ 예매 목록 **************/
	//예매 기한 만료 티켓 조회
	public List<String> purchaseExpire(){
		return sqlSession.selectList(namespace + ".reservation_expire_check");
	}
	
	//예매 기한 만료
	public int reservationExpire(List<String> expireList) {
		int result = 0;
		for(String rid : expireList) {
			result += sqlSession.update(namespace + ".reservation_expire", rid);
		}
		return result;
	}
	
	//예매 티켓 기한 만료
	public int ticketExpire(List<String> expireList) {
		int result = 0;
		for(String rid : expireList) {
			result += sqlSession.update(namespace + ".reservation_ticket_expire", rid);
		}
		return result;
	}
	
	//예매 목록 출력
	public List<DmuPurchaseVO> purchaseList(Map<String, Object> list_param){
		return sqlSession.selectList(namespace + ".reservationList", list_param);
	}
	
	//예매 목록 총 갯수
	public int purchaseListTotalCount(Map<String, Object> list_param) {
		return sqlSession.selectOne(namespace + ".reservationTotalCount", list_param);
	}
	
	//예매 정보 상세 보기
	public List<DmuPurchaseVO> purchaseContent(String rid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("rid", rid);
		
		return sqlSession.selectList(namespace + ".purchaseList", rid);
	}
	
	//예매 취소 신청
	public int purchaseCancel(List<String> ticketList) {
		int result = 0;
		for(String tid : ticketList) {
			result += sqlSession.update(namespace + ".ticket_update", tid);
		}
		return result;
	}
	
	//예매 취소 티켓 카운팅
	public int purchaseCancelTotalCount(String rid) {
		return sqlSession.selectOne(namespace + ".ticket_cancle_totalCount", rid);
	}
	
	//예매 정보 업데이트
	public int reservationCancel(String rid) {
		return sqlSession.update(namespace + ".ticket_reservation_update", rid);
	}
	
	/************ 나의 문의 **************/
	//문의 사항 등록
	public int inquiryInsert(DmuInquiryVO vo) {
		return sqlSession.insert(namespace + ".inquiry_insert", vo);
	}
	
	//문의 사항 총 갯수
	public int inquiryTotalCount(String mid) {
		return sqlSession.selectOne(namespace + ".inquiry_totalCount", mid);
	}
	
	//문의 사항 리스트
	public List<DmuInquiryVO> inquiryList(int startCount, int endCount, String mid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("mid", mid);
		
		return sqlSession.selectList(namespace + ".inquiry_list", param);
	}
	
	//문의 사항 상세 조회
	public DmuInquiryVO inquiryContent(String iqid) {
		return sqlSession.selectOne(namespace + ".inquiry_content", iqid);
	}
	
	/************ 개인 정보 변경/탈퇴 ****************/
	//회원 정보 조회
	public DmuMemberVO memberContent(String mid) {
		return sqlSession.selectOne(namespace + ".member_info", mid);
	}
	
	//회원 정보 수정
	public int memberUpdate(DmuMemberVO vo, String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("vo", vo);
		param.put("type", type);
		
		return sqlSession.update(namespace + ".member_info_update", param);
	}
	
	//회원 탈퇴 신청
	public int memberUnregister(String mid) {
		return sqlSession.update(namespace + ".member_unregister", mid);
	}
}
