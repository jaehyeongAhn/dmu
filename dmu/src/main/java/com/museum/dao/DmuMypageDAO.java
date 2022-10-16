package com.museum.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.museum.vo.DmuInquiryVO;
import com.museum.vo.DmuMemberVO;

public class DmuMypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.mypage";
	
	/************ 나의 문의 **************/
	//문의 사항 등록
	public int inquiryInsert(DmuInquiryVO vo) {
		return sqlSession.insert(namespace + ".inquiry_insert", vo);
	}
	
	//문의 사항 총 갯수
	public int inquiryTotalCount(String mid) {
		return sqlSession.selectOne(namespace + ".inquiry_totalCount", mid);
	}
	
	//문의 사항 리스트
	public List<DmuInquiryVO> inquiryList(int startCount, int endCount, String mid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("mid", mid);
		
		return sqlSession.selectList(namespace + ".inquiry_list", param);
	}
	
	//문의 사항 상세 조회
	public DmuInquiryVO inquiryContent(String iqid) {
		return sqlSession.selectOne(namespace + ".inquiry_content", iqid);
	}
	
	/************ 개인 정보 변경/탈퇴 ****************/
	//회원 정보 조회
	public DmuMemberVO memberContent(String mid) {
		return sqlSession.selectOne(namespace + ".member_info", mid);
	}
	
	//회원 정보 수정
	public int memberUpdate(DmuMemberVO vo, String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("vo", vo);
		param.put("type", type);
		
		return sqlSession.update(namespace + ".member_info_update", param);
	}
	
	//회원 탈퇴 신청
	public int memberUnregister(String mid) {
		return sqlSession.update(namespace + ".member_unregister", mid);
	}
}
