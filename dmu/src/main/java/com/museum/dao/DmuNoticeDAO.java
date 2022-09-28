package com.museum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuNoticeVO;

@Repository
public class DmuNoticeDAO extends DBConn{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/*
	 * 공지사항 게시글 입력
	 */
	public int insert(DmuNoticeVO vo) {		
		return sqlSession.insert("mapper.notice.write", vo);
	}
	
	/*
	 * 공지사항 리스트 출력
	 */
	
	public ArrayList<DmuNoticeVO> select(int startCount, int endCount){
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<DmuNoticeVO> list = sqlSession.selectList("mapper.notice.listAll", param);
		
		return (ArrayList<DmuNoticeVO>)list;
		
	}
	
	/*
	 * 공지사항 상세보기 출력
	 */
	
	public DmuNoticeVO select(String nid) {		
		return sqlSession.selectOne("mapper.notice.content", nid);
	}
	
	
	
	/**
	 * totalCount
	 */
	
	public int totalCount() {		
		return sqlSession.selectOne("mapper.notice.totalCount");
	}
	
	/*
	 * 공지사항 수정
	 */
	
	public int update(DmuNoticeVO vo) {
		return sqlSession.update("mapper.notice.update", vo);
		
	}
	
	/*
	 * 공지사항 삭제
	 */
	
	public int delete(String nid) {		
		return sqlSession.delete("mapper.notice.delete", nid);
	}
}
