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
import com.museum.vo.DmuReJoinVO;

@Repository
public class DmuAdminDAO extends DBConn{

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
	
	public DmuReJoinVO reservationContent(String mid) {
		return sqlSession.selectOne("mapper.admin.reservationContent", mid);
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
