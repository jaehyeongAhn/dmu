package com.museum.service;

import com.museum.dao.DmuMemberDAO;
import com.museum.vo.DmuMemberVO;

public class JoinServiceImpl {
	//ȸ�� ����
	public int join(DmuMemberVO vo) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.insert(vo);
		
		return result;
	}
	
	//���̵� �ߺ�Ȯ��
	public int idCheck(String did) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.idCheck(did);
		
		return result;
	}

}
