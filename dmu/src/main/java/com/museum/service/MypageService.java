package com.museum.service;

import java.util.List;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuPurchaseVO;

public interface MypageService {
	
	/*************** ���� ��� ***************/
	//���� ����Ʈ
	
	//���� ���� �� ����
	public List<DmuPurchaseVO> getPurchaseContent(String rid);
	
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
}
