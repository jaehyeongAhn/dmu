package com.museum.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.museum.vo.DmuMemberVO;

public class DmuMypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.mypage";
			
	//ȸ�� ���� ��ȸ
	public DmuMemberVO memberContent(String mid) {
		return sqlSession.selectOne(namespace + ".member_info", mid);
	}
	
	//ȸ�� Ż�� ��û
	public int memberUnregister(String mid) {
		return sqlSession.update(namespace + ".member_unregister", mid);
	}
}
