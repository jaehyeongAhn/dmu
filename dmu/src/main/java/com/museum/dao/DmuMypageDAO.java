package com.museum.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuPurchaseTicketVO;
import com.museum.vo.DmuPurchaseVO;

@Repository
public class DmuMypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.mypage";
	
	
	/************ ���� ��� **************/
	//���� ��� ���
	/*public List<DmuPurchaseVO> purchaseList(){
		
	}*/
	
	//���� ���� �� ����
	public List<DmuPurchaseVO> purchaseContent(String rid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("rid", rid);
		
		return sqlSession.selectList(namespace + ".purchaseList", rid);
	}
	
	//���� ���� ����
	public int reservationExpire(String rid) {
		return sqlSession.update(namespace + ".reservation_expire", rid);
	}
	
	//���� Ƽ�� ���� ����
	public int ticketExpire(String rid) {
		return sqlSession.update(namespace + ".reservation_ticket_expire", rid);
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
