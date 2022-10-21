package com.museum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuMemberVO;
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

	public DmuReJoinVO reservationContent(String mid) {
		return sqlSession.selectOne("mapper.admin.reservationContent", mid);
	}

	
	 // adminpage_reservation_det : 어드민 페이지 예약취소 진행
	  
	  
	  public ArrayList<DmuReJoinVO> reservationDet(String rid) {
		  List<DmuReJoinVO> list = sqlSession.selectList("mapper.admin.reservationContent", rid);
		  return (ArrayList<DmuReJoinVO>)list;
		  
	  }
	 

	/*
	 * adminpage_reservation_det : 어드민 페이지 예약취소 진행
	 */

	public DmuReJoinVO  reservationDet1(String rid) {
		return sqlSession.selectOne("mapper.admin.reservationContent1", rid);
	}

}
