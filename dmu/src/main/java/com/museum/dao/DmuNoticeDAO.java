package com.museum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.museum.vo.DmuNoticeVO;

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
		
		List<DmuNoticeVO> nlist = sqlSession.selectList("mapper.notice.listAll", param);
		
		
		return (ArrayList<DmuNoticeVO>)nlist;
		
	}
	
	/*
	 * 공지사항 상세보기 출력
	 */
	
	public DmuNoticeVO select(String nid) {
		
		return sqlSession.selectOne("mapper.notice.content",nid);
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
	
	
	
	/*
	 * 카테고리
	 * totalCount_category
	 */
	
	public int totalCount_category(String ncategory) {
		int result = 0;
		String category ="";
		if(ncategory.equals("all")) {
			category="";
		}else {
			category = "where ncategory='" + ncategory + "'";
		}
		String sql = "select count(*) from dmu_notice " + category;
		
		try {
			getPreparedStatement(sql);
			//pstmt.setString(1, ncategory);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
				
	}
	
	
	
	public ArrayList<DmuNoticeVO> categoryList(int startCount, int endCount, String ncategory) {
		ArrayList<DmuNoticeVO> clist = new ArrayList<DmuNoticeVO>();
		
		String sql = "select rno, nid, ncategory, ntitle, ndate "
				+ " from(select rownum rno, nid, ncategory, ntitle, to_char(ndate, 'yyyy-mm-dd') ndate "
				+ " from(select nid, ncategory, ntitle, ndate from dmu_notice where ncategory=? "
				+ " order by ndate desc)) "
				+ " where rno between ? and ? ";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, ncategory);
			pstmt.setInt(2, startCount);
			pstmt.setInt(3, endCount);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DmuNoticeVO vo = new DmuNoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNcategory(rs.getString(3));
				vo.setNtitle(rs.getString(4));
				vo.setNdate(rs.getString(5));
				
				clist.add(vo);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return clist;
	}
	
	
	/*
	 * 검색기능 (로우 수 출력)
	 */
	
	
	public int totalCount_search(String keyword, String searchList) {
		Map<String, String> param = new HashMap<String, String>();
	    param.put("keyword", keyword);
	    param.put("searchList", searchList);
	    
		
		return sqlSession.selectOne("mapper.notice.totalCount_search", param);
	}
	
	
	/*
	 * 검색기능
	 */
	
	public ArrayList<DmuNoticeVO> noticeSearch(int startCount, int endCount, String keyword, String searchList){
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(startCount));
		param.put("start", String.valueOf(endCount));
		param.put("keyword",  keyword );
		param.put("searchList", searchList);
	
		List<DmuNoticeVO> searchListresult = sqlSession.selectList("mapper.notice.searchList", param);
		return (ArrayList<DmuNoticeVO>)searchListresult;
		
	}
	
	
	
	
	
}
