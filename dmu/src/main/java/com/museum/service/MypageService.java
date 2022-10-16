package com.museum.service;

import java.util.List;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;

public interface MypageService {
	
	//���� ���� ���
	public int inquiryInsert(DmuInquiryVO vo);

	//���� ���� �� ����
	public int getInquiryTotalCount(String mid);
	
	//���� ���� ����Ʈ
	public List<DmuInquiryVO> getInquiryList(int startCount, int endCount, String mid);

	//���� ���� �� ��ȸ
	public DmuInquiryVO getInquiryContent(String iqid);
	
	//ȸ�� ���� ��ȸ
	public DmuMemberVO memberContent(String mid);

	//ȸ�� ���� ����
	public int memberUpdate(DmuMemberVO vo, String type);
	
	//ȸ�� Ż�� ��û
	public int memberUnregister(String mid);
}
