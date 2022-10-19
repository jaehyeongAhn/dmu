package com.museum.service;

import java.util.List;

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

	/********************* ���� ��� ************************/
	//���� ���� �� ����
	@Override
	public List<DmuPurchaseVO> getPurchaseContent(String rid) {
		return mypageDao.purchaseContent(rid);
	}
	
	//���� ���� ����
	@Override
	public int getReservationExpire(String rid) {
		return mypageDao.reservationExpire(rid);
	}
	
	//���� Ƽ�� ���� ����
	@Override
	public int getTicketExpire(String rid) {
		return mypageDao.ticketExpire(rid);
	}
	
	//���� ��� ��û
	@Override
	public int getPurchaseCancel(List<String> ticketList) {
		return mypageDao.purchaseCancel(ticketList);
	}

	//���� ��� Ƽ�� ī����
	@Override
	public int getPurchaseCancelTotalCount(String rid) {
		return mypageDao.purchaseCancelTotalCount(rid);	
	}
	
	//���� ���� ������Ʈ
	@Override
	public int getReservationCancel(String rid) {
		return mypageDao.reservationCancel(rid);
	}
	
	/********************* ���� ���� ************************/
	//���� ���� ���
	@Override
	public int inquiryInsert(DmuInquiryVO vo) {
		return mypageDao.inquiryInsert(vo);
	}

	//���� ���� �� ����
	public int getInquiryTotalCount(String mid) {
		return mypageDao.inquiryTotalCount(mid);
	}
	
	//���� ���� ����Ʈ
	@Override
	public List<DmuInquiryVO> getInquiryList(int startCount, int endCount, String mid) {
		return mypageDao.inquiryList(startCount, endCount, mid);
	}

	//���� ���� �� ��ȸ
	@Override
	public DmuInquiryVO getInquiryContent(String iqid) {
		return mypageDao.inquiryContent(iqid);
	}
	
	
	/********************* �������� ����/Ż�� ************************/
	//ȸ�� ���� �� ��ȸ
	@Override
	public DmuMemberVO memberContent(String mid) {
		return mypageDao.memberContent(mid);
	}
	
	//ȸ�� ���� ����
	@Override
	public int memberUpdate(DmuMemberVO vo, String type) {
		return mypageDao.memberUpdate(vo, type);
	}
	
	//ȸ�� Ż�� ��û
	@Override
	public int memberUnregister(String mid) {
		return mypageDao.memberUnregister(mid);
	}
}
