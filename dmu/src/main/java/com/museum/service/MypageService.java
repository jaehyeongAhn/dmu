package com.museum.service;

import java.util.List;
import java.util.Map;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuPurchaseTicketVO;
import com.museum.vo.DmuPurchaseVO;

public interface MypageService {
	
	/*************** ���� ��� ***************/
	//���� ���� ���� Ƽ�� ��ȸ
	public List<String> getPurchaseExpire();

	//���� ���� ����
	public int getReservationExpire(List<String> expireList);
	
	//���� Ƽ�� ���� ����
	public int getTicketExpire(List<String> expireList);
	
	//���� ����Ʈ
	public List<DmuPurchaseVO> getPurchaseList(Map<String, Object> list_param);

	//���� ��� �� ����
	public int getPurchaseListTotalCount(Map<String, Object> list_param);
	
	//���� ���� �� ����
	public List<DmuPurchaseVO> getPurchaseContent(String rid);

	//���� ��� ��û
	public int getPurchaseCancel(List<String> ticketList);
	
	//���� ��� Ƽ�� ī����
	public int getPurchaseCancelTotalCount(String rid);
	
	//���� ���� ������Ʈ
	public int getReservationCancel(String rid);
	
	/*************** ���� ���� ***************/
	//���� ���� ���
	public int inquiryInsert(DmuInquiryVO vo);

	//���� ���� �� ����
	public int getInquiryTotalCount(String mid);
	
	//���� ���� ����Ʈ
	public List<DmuInquiryVO> getInquiryList(int startCount, int endCount, String mid);

	//���� ���� �� ��ȸ
	public DmuInquiryVO getInquiryContent(String iqid);
	
	
	/************** �������� ����/Ż�� ***************/
	//ȸ�� ���� ��ȸ
	public DmuMemberVO memberContent(String mid);

	//ȸ�� ���� ����
	public int memberUpdate(DmuMemberVO vo, String type);
	
	//ȸ�� Ż�� ��û
	public int memberUnregister(String mid);
	
	//ȸ�� Ż�� ��û - ������ �̻� ��� ȸ��
	public int memberWithdraw();
}
