package com.museum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuPurchaseVO;
import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuTicketVO;

@Repository
public class DmuAdminDAO extends DBConn {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/*
	 * adminpage_member_list : 어드민 페이지 회원 리스트 출력
	 */
	public ArrayList<DmuMemberVO> memberList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<DmuMemberVO> mlist = sqlSession.selectList("mapper.admin.memberList", param);

		return (ArrayList<DmuMemberVO>) mlist;
	}

	/*
	 * adminpage_member_list_public : 회원 리스트 출력 (회원만)
	 */
	public ArrayList<DmuMemberVO> publicList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<DmuMemberVO> plist = sqlSession.selectList("mapper.admin.memberList_public", param);

		return (ArrayList<DmuMemberVO>) plist;
	}

	/*
	 * adminpage_member_list_public : 회원 리스트 출력 (관리자만)
	 */
	public ArrayList<DmuMemberVO> adminList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<DmuMemberVO> alist = sqlSession.selectList("mapper.admin.memberList_admin", param);

		return (ArrayList<DmuMemberVO>) alist;
	}

	/*
	 * 관리자 승인 완료 상태값 변경
	 */

	public int updateStatus(String mid) {
		return sqlSession.update("mapper.admin.updateStatus", mid);
	}

	/*
	 * totalCount() : 회원 총 로우수
	 */

	public int totalCount() {

		return sqlSession.selectOne("mapper.admin.totalCount");
	}

	public int totalCount_public() {

		return sqlSession.selectOne("mapper.admin.totalCount_public");
	}

	public int totalCount_admin() {

		return sqlSession.selectOne("mapper.admin.totalCount_admin");
	}

	public int totalCount_reservation() {

		return sqlSession.selectOne("mapper.admin.totalCount_reservation");
	}

	/*
	 * adminpage_member_content : 어드민 페이지 회원 상세내용
	 */

	public DmuMemberVO memberContent(String mid) {
		return sqlSession.selectOne("mapper.admin.memberContent", mid);
	}

	public DmuMemberVO memberContent_admin(String mid) {
		return sqlSession.selectOne("mapper.admin.memberContent_admin", mid);
	}

	/*
	 * adminpage_reservation_list : 어드민 페이지 예매 관리 리스트 출력
	 */
	public ArrayList<DmuMemberVO> reservationList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<DmuMemberVO> mlist = sqlSession.selectList("mapper.admin.reservationList", param);

		return (ArrayList<DmuMemberVO>) mlist;
	}

	/*
	 * adminpage_reservation_content : 어드민 페이지 예약 상세내용
	 */

	public DmuReJoinVO reservationContent(String rid) {
		return sqlSession.selectOne("mapper.admin.reservationContent", rid);
	}

 
	
	 // adminpage_reservation_det : 어드민 페이지 예약취소 진행
	  
	  
	  public ArrayList<DmuReJoinVO> reservationDet(String rid) {
		  List<DmuReJoinVO> list = sqlSession.selectList("mapper.admin.reservationDet", rid);
		  return (ArrayList<DmuReJoinVO>)list;
		  
	  }

	/*
	 * adminpage_reservation_det : 어드민 페이지 예약취소 진행_리스트
	 */

	public DmuReJoinVO  reservationDet1(String rid) {
		return sqlSession.selectOne("mapper.admin.reservationDet1", rid);
	}
	
	//예매 정보 상세 보기
	public List<DmuPurchaseVO> purchaseContent(String rid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("rid", rid);
		
		return sqlSession.selectList("mapper.admin.purchaseList", rid);
	}
	
	//예매 취소 신청
	public int purchaseCancel(List<String> ticketList) {
		int result = 0;
		for(String tid : ticketList) {
			result += sqlSession.update("mapper.admin.ticket_update", tid);
		}
		return result;
	}
	
	//예매 취소 티켓 카운팅
	public int purchaseCancelTotalCount(String rid) {
		return sqlSession.selectOne("mapper.admin.ticket_cancle_totalCount", rid);
	}
	
	//예매 정보 업데이트
	public int reservationCancel(String rid) {
		return sqlSession.update("mapper.admin.ticket_reservation_update", rid);
	}

 
	
	/************************  검색기능  ***********************/
	
	
	/*
	 * 검색기능 (member)
	 */
	
	public ArrayList<DmuMemberVO> member_search_public(int startCount, int endCount, String keyword){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("keyword", keyword);
	
		List<DmuMemberVO> searchList_public = sqlSession.selectList("mapper.admin.admin_publicsearch", param);
		return (ArrayList<DmuMemberVO>)searchList_public;
		
	}
	
	/*
	 * 검색기능 (public 로우 수 출력)
	 */
	
	public int totalCount_publicSearch(String keyword) {

		return sqlSession.selectOne("mapper.admin.totalCount_publicSearch", keyword);
	}
	
	
	/*
	 * 검색기능 (admin)
	 */
	
	public ArrayList<DmuMemberVO> member_search_admin(int startCount, int endCount, String keyword){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("keyword", keyword);
		
		List<DmuMemberVO> searchList_admin = sqlSession.selectList("mapper.admin.admin_adminsearch", param);
	
		return (ArrayList<DmuMemberVO>)searchList_admin;
		
	}
	
	
	/*
	 * 검색기능 (admin 로우 수 출력)
	 */
	
	public int totalCount_adminSearch(String keyword) {
		
		return sqlSession.selectOne("mapper.admin.totalCount_adminSearch", keyword);
	}
	
	
	/*
	 * 검색기능 (reservation)
	 */
	
	
	public ArrayList<DmuReJoinVO> member_search_reserve(int startCount, int endCount, String keyword){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("keyword", keyword);
		
		
		List<DmuReJoinVO> searchList_reservation = sqlSession.selectList("mapper.admin.admin_reservationSearch", param);
		
		return (ArrayList<DmuReJoinVO>)searchList_reservation;
		
	}

	public int totalCount_reserveSearch(String keyword) {
		
		return sqlSession.selectOne("mapper.admin.totalCount_reservationSearch", keyword);
		
		
	}
	
	
	
	/******************************* 1대1 문의 ************************************/
	//문의 사항 전체 리스트
	public List<DmuInquiryVO> inquiryList(String answerType, int startCount, int endCount) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("answerType", answerType);
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		return sqlSession.selectList("mapper.admin.inquiryList", param);
	}
	
	//문의 사항 총 개수
	public int inquiryTotalCount(String answerType) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("answerType", answerType);
		return sqlSession.selectOne("mapper.admin.inquiryTotalCount", param);
	}
	
	//문의 사항 상세 보기
	public DmuInquiryVO inquiryContent(String iqid) {
		return sqlSession.selectOne("mapper.admin.inquiryContent", iqid);
	}
	
	//문의 사항 이메일 반환
	public String inquiryEmail(String mid) {
		return sqlSession.selectOne("mapper.admin.inquiryResponse", mid);
	}
	
	//문의 사항 상태 업데이트
	public int inquiryUpdate(String iqid) {
		return sqlSession.update("mapper.admin.inquiryUpdate", iqid);
	}

	
	
}
