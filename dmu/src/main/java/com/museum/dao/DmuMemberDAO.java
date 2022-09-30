package com.museum.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.museum.vo.DmuMemberVO;

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
	public int login(DmuMemberVO vo) {
		return sqlSession.selectOne(namespace + ".login", vo);
	}
	
	//idCheck : 회원 가입 시 중복 아이디 체크
	public int idCheck(String mid) {
		return sqlSession.selectOne(namespace + ".idcheck", mid);
	}
	
	//insert : 회원 가입 성공 시 회원 데이터 저장
	public int insert(DmuMemberVO vo) {
		
		System.out.println(vo.getMid());
		System.out.println(vo.getPass());
		System.out.println(vo.getNationality());
		System.out.println(vo.getMname());
		System.out.println(vo.getGender());
		System.out.println(vo.getEmail());
		System.out.println(vo.getBirth());
		System.out.println(vo.getPnumber());
		System.out.println(vo.getZonecode());
		System.out.println( vo.getAddr1());
		System.out.println(vo.getAddr2());
		System.out.println(vo.getTerms());
		System.out.println(vo.getOlder());
		System.out.println(vo.getConsent());
		return sqlSession.insert(namespace + ".insert", vo);
	}
}
