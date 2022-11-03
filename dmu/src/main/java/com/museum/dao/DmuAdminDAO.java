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

	public DmuReJoinVO reservationContent(String rid) {
		return sqlSession.selectOne("mapper.admin.reservationContent", rid);
	}

 
	
	 // adminpage_reservation_det : ���� ������ ������� ����
	  
	  
	  public ArrayList<DmuReJoinVO> reservationDet(String rid) {
		  List<DmuReJoinVO> list = sqlSession.selectList("mapper.admin.reservationDet", rid);
		  return (ArrayList<DmuReJoinVO>)list;
		  
	  }

	/*
	 * adminpage_reservation_det : ���� ������ ������� ����_����Ʈ
	 */

	public DmuReJoinVO  reservationDet1(String rid) {
		return sqlSession.selectOne("mapper.admin.reservationDet1", rid);
	}
	
	//���� ���� �� ����
	public List<DmuPurchaseVO> purchaseContent(String rid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("rid", rid);
		
		return sqlSession.selectList("mapper.admin.purchaseList", rid);
	}
	
	//���� ��� ��û
	public int purchaseCancel(List<String> ticketList) {
		int result = 0;
		for(String tid : ticketList) {
			result += sqlSession.update("mapper.admin.ticket_update", tid);
		}
		return result;
	}
	
	//���� ��� Ƽ�� ī����
	public int purchaseCancelTotalCount(String rid) {
		return sqlSession.selectOne("mapper.admin.ticket_cancle_totalCount", rid);
	}
	
	//���� ���� ������Ʈ
	public int reservationCancel(String rid) {
		return sqlSession.update("mapper.admin.ticket_reservation_update", rid);
	}

 
	
	/************************  �˻����  ***********************/
	
	
	/*
	 * �˻���� (member)
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
	 * �˻���� (public �ο� �� ���)
	 */
	
	public int totalCount_publicSearch(String keyword) {

		return sqlSession.selectOne("mapper.admin.totalCount_publicSearch", keyword);
	}
	
	
	/*
	 * �˻���� (admin)
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
	 * �˻���� (admin �ο� �� ���)
	 */
	
	public int totalCount_adminSearch(String keyword) {
		
		return sqlSession.selectOne("mapper.admin.totalCount_adminSearch", keyword);
	}
	
	
	/*
	 * �˻���� (reservation)
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
	
	
	
	/******************************* 1��1 ���� ************************************/
	//���� ���� ��ü ����Ʈ
	public List<DmuInquiryVO> inquiryList(String answerType, int startCount, int endCount) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("answerType", answerType);
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		return sqlSession.selectList("mapper.admin.inquiryList", param);
	}
	
	//���� ���� �� ����
	public int inquiryTotalCount(String answerType) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("answerType", answerType);
		return sqlSession.selectOne("mapper.admin.inquiryTotalCount", param);
	}
	
	//���� ���� �� ����
	public DmuInquiryVO inquiryContent(String iqid) {
		return sqlSession.selectOne("mapper.admin.inquiryContent", iqid);
	}
	
	//���� ���� �̸��� ��ȯ
	public String inquiryEmail(String mid) {
		return sqlSession.selectOne("mapper.admin.inquiryResponse", mid);
	}
	
	//���� ���� ���� ������Ʈ
	public int inquiryUpdate(String iqid) {
		return sqlSession.update("mapper.admin.inquiryUpdate", iqid);
	}

	
	
}
