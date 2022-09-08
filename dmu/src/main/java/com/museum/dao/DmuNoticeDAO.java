package com.museum.dao;

import java.util.ArrayList;

import com.museum.vo.DmuNoticeVO;

public class DmuNoticeDAO extends DBConn{

	
	/*
	 * 공지사항 게시글 입력
	 */
	public int insert(DmuNoticeVO vo) {
		int result = 0;
		
		String sql ="insert into dmu_notice values('n_'||sequ_dmu_notice.nextval,?,?,?,sysdate)";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNcategory());
			pstmt.setString(2, vo.getNtitle());
			pstmt.setString(3, vo.getNcontent());
			
			result = pstmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/*
	 * 공지사항 리스트 출력
	 */
	
	public ArrayList<DmuNoticeVO> select(int startCount, int endCount){
		ArrayList<DmuNoticeVO> list = new ArrayList<DmuNoticeVO>();
		
		String sql = "select rno, nid, ncategory, ntitle, ndate "
				+ " from(select rownum rno, nid, ncategory, ntitle, to_char(ndate, 'yyyy-mm-dd') ndate "
				+ " from(select nid, ncategory, ntitle, ndate from dmu_notice "
				+ " order by ndate desc))"
				+ " where rno between ? and ?";
		
		try {
			getPreparedStatement(sql);
			
			 pstmt.setInt(1, startCount); 
			 pstmt.setInt(2, endCount);
			 
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DmuNoticeVO vo = new DmuNoticeVO();
				
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNcategory(rs.getString(3));
				vo.setNtitle(rs.getString(4));
				vo.setNdate(rs.getString(5));
				
				list.add(vo);
				
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	/*
	 * 공지사항 상세보기 출력
	 */
	
	public DmuNoticeVO select(String nid) {
		DmuNoticeVO vo = new DmuNoticeVO();
		
		String sql = "select nid, ncategory, ntitle, ncontent, ndate " + 
					"from dmu_notice where nid = ?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo.setNid(rs.getString(1));
				vo.setNcategory(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNcontent(rs.getString(4));
				vo.setNdate(rs.getString(5));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	
	/**
	 * totalCount
	 */
	
	public int totalCount() {
		int result = 0;
		
		String sql = "select count(*) from dmu_notice";
		
		try {
			getPreparedStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/*
	 * 공지사항 수정
	 */
	
	public int update(DmuNoticeVO vo) {
		int result = 0;
		
		String sql = "update dmu_notice set ncategory=?, ntitle=?, ncontent=? where nid=?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNcategory());
			pstmt.setString(2, vo.getNtitle());
			pstmt.setString(3, vo.getNcontent());
			pstmt.setString(4, vo.getNid());
			
			result = pstmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	/*
	 * 공지사항 삭제
	 */
	
	public int delete(String nid) {
		int result = 0;
		
		String sql = "delete from dmu_notice where nid=?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
