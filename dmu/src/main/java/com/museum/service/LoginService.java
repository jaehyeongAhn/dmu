package com.museum.service;

import com.museum.vo.DmuMemberVO;

public interface LoginService {

	/**
	 * emailCheck(email,name) : �̸� �� �̸��� üũ
	 */
	public int emailCheckId(String email, String name);
	
	//loginUpdate(DmuMemberVO vo) : ��й�ȣ ������Ʈ
	public int loginUpdate(DmuMemberVO vo);
	
	//��й�ȣ ã�� �������� ���� ���� ���� Ȯ��
	public int emailCheckPass(String email, String name, String did);

	//���̵� ��ȯ
	public String findId(DmuMemberVO vo);
	
	//�α��� üũ
	public int login(DmuMemberVO vo);
}
