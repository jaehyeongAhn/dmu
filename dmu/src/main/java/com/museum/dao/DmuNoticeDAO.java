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
	 * �������� �Խñ� �Է�
	 */
	public int insert(DmuNoticeVO vo) {		
		return sqlSession.insert("mapper.notice.write", vo);
	}
	
	/*
	 * �������� ����Ʈ ���
	 */
	
	public ArrayList<DmuNoticeVO> select(int startCount, int endCount){
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<DmuNoticeVO> list = sqlSession.selectList("mapper.notice.listAll", param);
		
		return (ArrayList<DmuNoticeVO>)list;
		
	}
	
	/*
	 * �������� �󼼺��� ���
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
	 * �������� ����
	 */
	
	public int update(DmuNoticeVO vo) {
		return sqlSession.update("mapper.notice.update", vo);
		
	}
	
	/*
	 * �������� ����
	 */
	
	public int delete(String nid) {		
		return sqlSession.delete("mapper.notice.delete", nid);
	}
}
