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
	
	
	/************ ���� ��� **************/
	//���� ���� ���� Ƽ�� ��ȸ
	public List<String> purchaseExpire(){
		return sqlSession.selectList(namespace + ".reservation_expire_check");
	}
	
	//���� ���� ����
	public int reservationExpire(List<String> expireList) {
		int result = 0;
		for(String rid : expireList) {
			result += sqlSession.update(namespace + ".reservation_expire", rid);
		}
		return result;
	}
	
	//���� Ƽ�� ���� ����
	public int ticketExpire(List<String> expireList) {
		int result = 0;
		for(String rid : expireList) {
			result += sqlSession.update(namespace + ".reservation_ticket_expire", rid);
		}
		return result;
	}
	
	//���� ��� ���
	public List<DmuPurchaseVO> purchaseList(Map<String, Object> list_param){
		return sqlSession.selectList(namespace + ".reservationList", list_param);
	}
	
	//���� ��� �� ����
	public int purchaseListTotalCount(Map<String, Object> list_param) {
		return sqlSession.selectOne(namespace + ".reservationTotalCount", list_param);
	}
	
	//���� ���� �� ����
	public List<DmuPurchaseVO> purchaseContent(String rid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("rid", rid);
		
		return sqlSession.selectList(namespace + ".purchaseList", rid);
	}
	
	//���� ��� ��û
	public int purchaseCancel(List<String> ticketList) {
		int result = 0;
		for(String tid : ticketList) {
			result += sqlSession.update(namespace + ".ticket_update", tid);
		}
		return result;
	}
	
	//���� ��� Ƽ�� ī����
	public int purchaseCancelTotalCount(String rid) {
		return sqlSession.selectOne(namespace + ".ticket_cancle_totalCount", rid);
	}
	
	//���� ���� ������Ʈ
	public int reservationCancel(String rid) {
		return sqlSession.update(namespace + ".ticket_reservation_update", rid);
	}
	
	/************ ���� ���� **************/
	//���� ���� ���
	public int inquiryInsert(DmuInquiryVO vo) {
		return sqlSession.insert(namespace + ".inquiry_insert", vo);
	}
	
	//���� ���� �� ����
	public int inquiryTotalCount(String mid) {
		return sqlSession.selectOne(namespace + ".inquiry_totalCount", mid);
	}
	
	//���� ���� ����Ʈ
	public List<DmuInquiryVO> inquiryList(int startCount, int endCount, String mid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("mid", mid);
		
		return sqlSession.selectList(namespace + ".inquiry_list", param);
	}
	
	//���� ���� �� ��ȸ
	public DmuInquiryVO inquiryContent(String iqid) {
		return sqlSession.selectOne(namespace + ".inquiry_content", iqid);
	}
	
	/************ ���� ���� ����/Ż�� ****************/
	//ȸ�� ���� ��ȸ
	public DmuMemberVO memberContent(String mid) {
		return sqlSession.selectOne(namespace + ".member_info", mid);
	}
	
	//ȸ�� ���� ����
	public int memberUpdate(DmuMemberVO vo, String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("vo", vo);
		param.put("type", type);
		
		return sqlSession.update(namespace + ".member_info_update", param);
	}
	
	//ȸ�� Ż�� ��û
	public int memberUnregister(String mid) {
		return sqlSession.update(namespace + ".member_unregister", mid);
	}
}
