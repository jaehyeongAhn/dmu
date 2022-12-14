package com.museum.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuSessionVO;

@Repository
public class DmuMemberDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.member";
	
	//login_update : 비밀번호 재변경
	public int login_update(DmuMemberVO vo) {
		return sqlSession.update(namespace + ".login_update", vo);
	}
	
	//emailCheckPass : 비밀번호 찾기 email 일치 확인
	public int emailCheckPass(String email, String name, String mid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("email", email);
		param.put("name", name);
		param.put("mid", mid);
		
		return sqlSession.selectOne(namespace + ".email_check_pass", param);
	}
	
	//selectId : id 찾기
	public String selectId(DmuMemberVO vo) {
		return sqlSession.selectOne(namespace + ".idfind", vo);
	}
	
	//emailCheckId : 아이디 찾기 email 일치 확인
	public int emailCheckId(String email, String name) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("email", email);
		param.put("name", name);
		
		return sqlSession.selectOne(namespace + ".id_find_email", param);
	}
	
	//login : 로그인
	public DmuSessionVO login(DmuMemberVO vo) {
		return sqlSession.selectOne(namespace + ".login", vo);
	}
	
	//idCheck : 회원 가입 시 중복 아이디 체크
	public int idCheck(String mid) {
		return sqlSession.selectOne(namespace + ".idcheck", mid);
	}
	
	//insert : 회원 가입 성공 시 회원 데이터 저장
	public int insert(DmuMemberVO vo) {
		return sqlSession.insert(namespace + ".insert", vo);
	}
}
