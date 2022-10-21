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
	 * adminpage_member_list : ���� ������ ȸ�� ����Ʈ ���
	 */
	public ArrayList<DmuMemberVO> memberList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<DmuMemberVO> mlist = sqlSession.selectList("mapper.admin.memberList", param);

		return (ArrayList<DmuMemberVO>) mlist;
	}

	/*
	 * adminpage_member_list_public : ȸ�� ����Ʈ ��� (ȸ����)
	 */
	public ArrayList<DmuMemberVO> publicList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<DmuMemberVO> plist = sqlSession.selectList("mapper.admin.memberList_public", param);

		return (ArrayList<DmuMemberVO>) plist;
	}

	/*
	 * adminpage_member_list_public : ȸ�� ����Ʈ ��� (�����ڸ�)
	 */
	public ArrayList<DmuMemberVO> adminList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<DmuMemberVO> alist = sqlSession.selectList("mapper.admin.memberList_admin", param);

		return (ArrayList<DmuMemberVO>) alist;
	}

	/*
	 * ������ ���� �Ϸ� ���°� ����
	 */

	public int updateStatus(String mid) {
		return sqlSession.update("mapper.admin.updateStatus", mid);
	}

	/*
	 * totalCount() : ȸ�� �� �ο��
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
	 * adminpage_member_content : ���� ������ ȸ�� �󼼳���
	 */

	public DmuMemberVO memberContent(String mid) {
		return sqlSession.selectOne("mapper.admin.memberContent", mid);
	}

	public DmuMemberVO memberContent_admin(String mid) {
		return sqlSession.selectOne("mapper.admin.memberContent_admin", mid);
	}

	/*
	 * adminpage_reservation_list : ���� ������ ���� ���� ����Ʈ ���
	 */
	public ArrayList<DmuMemberVO> reservationList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);

		List<DmuMemberVO> mlist = sqlSession.selectList("mapper.admin.reservationList", param);

		return (ArrayList<DmuMemberVO>) mlist;
	}

	/*
	 * adminpage_reservation_content : ���� ������ ���� �󼼳���
	 */

	public DmuReJoinVO reservationContent(String mid) {
		return sqlSession.selectOne("mapper.admin.reservationContent", mid);
	}

	
	 // adminpage_reservation_det : ���� ������ ������� ����
	  
	  
	  public ArrayList<DmuReJoinVO> reservationDet(String rid) {
		  List<DmuReJoinVO> list = sqlSession.selectList("mapper.admin.reservationContent", rid);
		  return (ArrayList<DmuReJoinVO>)list;
		  
	  }
	 

	/*
	 * adminpage_reservation_det : ���� ������ ������� ����
	 */

	public DmuReJoinVO  reservationDet1(String rid) {
		return sqlSession.selectOne("mapper.admin.reservationContent1", rid);
	}

}
