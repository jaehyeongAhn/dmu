package com.museum.service;

import com.museum.dao.DmuMemberDAO;
import com.museum.vo.DmuMemberVO;

public class LoginServiceImpl implements LoginService{
	
	@Override
	public int emailCheckId(String email, String name) {
		DmuMemberDAO dao = new DmuMemberDAO();
		
		int result = dao.emailCheckId(email, name);
		
		return result;
	}
	
	//loginUpdate(DmuMemberVO vo) : ��й�ȣ ������Ʈ
	@Override
	public int loginUpdate(DmuMemberVO vo) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.login_update(vo);
		
		return result;
	}
	
	//��й�ȣ ã�� �������� ���� ���� ���� Ȯ��
	@Override
	public int emailCheckPass(String email, String name, String did) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.emailCheckPass(email, name, did);
		
		return result;
	};

	//���̵� ��ȯ
	@Override
	public String findId(DmuMemberVO vo) {
		DmuMemberDAO dao = new DmuMemberDAO();
		String result = dao.selectId(vo);
		
		return result;
	}
	
	//�α��� üũ
	@Override
	public int login(DmuMemberVO vo) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.login(vo);
		
		return result;
	}
}
