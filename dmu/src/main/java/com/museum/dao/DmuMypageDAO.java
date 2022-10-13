package com.museum.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.museum.vo.DmuMemberVO;

public class DmuMypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.mypage";
			
	//회원 정보 조회
	public DmuMemberVO memberContent(String mid) {
		return sqlSession.selectOne(namespace + ".member_info", mid);
	}
	
	//회원 탈퇴 신청
	public int memberUnregister(String mid) {
		return sqlSession.update(namespace + ".member_unregister", mid);
	}
}
