package com.museum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuSearchVO;
import com.museum.vo.DmuTicketVO;

@Repository
public class DmuSearchDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//검색 결과
	public ArrayList<DmuTicketVO> search(String keyword, String dpage){
		Map<String, String> param = new HashMap<String, String>();
		param.put("keyword", keyword);
		param.put("dpage", dpage);
		
		List<DmuTicketVO> list = sqlSession.selectList("mapper.search.search", param);
		return (ArrayList<DmuTicketVO>)list; 
	}
	
	
	//전체 수
	public DmuSearchVO totalCount(String keyword) {
		return sqlSession.selectOne("mapper.search.totalcount", keyword);
	}
}
