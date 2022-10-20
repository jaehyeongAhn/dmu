package com.museum.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuReJoinVO;

@Repository
public class DmuAdminDAO extends DBConn{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/*
	 * adminpage_member_list : 어드민 페이지 회원 리스트 출력 
	 */
	public ArrayList<DmuMemberVO> memberList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<DmuMemberVO> mlist = sqlSession.selectList("mapper.admin.memberList", param);
		
		return (ArrayList<DmuMemberVO>) mlist;
	}
	
	/*
	 * adminpage_member_list_public : 회원 리스트 출력 (회원만)
	 */
	public ArrayList<DmuMemberVO> publicList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<DmuMemberVO> plist = sqlSession.selectList("mapper.admin.memberList_public", param);
		
		return (ArrayList<DmuMemberVO>) plist;
	}
	
	/*
	 * adminpage_member_list_public : 회원 리스트 출력 (관리자만)
	 */
	public ArrayList<DmuMemberVO> adminList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<DmuMemberVO> alist = sqlSession.selectList("mapper.admin.memberList_admin", param);
		
		return (ArrayList<DmuMemberVO>) alist;
	}
	
	
	/*
	 * 관리자 승인 완료 상태값 변경
	 */
	
	public int updateStatus(String mid) {
		return sqlSession.update("mapper.admin.updateStatus", mid);
	}
	
	
	/*
	 * totalCount() : 회원 총 로우수
	 */
	
	public int totalCount() {

		return sqlSession.selectOne("mapper.admin.totalCount");
	}
	
	public int totalCount_public() {

		return sqlSession.selectOne("mapper.admin.totalCount_public");
	}

	public int totalCount_admin() {

		return sqlSession.selectOne("mapper.admin.totalCount_admin");
	}
	
	public int totalCount_reservation() {

		return sqlSession.selectOne("mapper.admin.totalCount_reservation");
	}
	
	/*
	 * adminpage_member_content : 어드민 페이지 회원 상세내용
	 */
	
	public DmuMemberVO memberContent(String mid) {
		return sqlSession.selectOne("mapper.admin.memberContent", mid);
	}
	
	public DmuMemberVO memberContent_admin(String mid) {
		return sqlSession.selectOne("mapper.admin.memberContent_admin", mid);
	}
	
	
	/*
	 * adminpage_reservation_list : 어드민 페이지 예매 관리 리스트 출력 
	 */
	public ArrayList<DmuMemberVO> reservationList(int startCount, int endCount) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<DmuMemberVO> mlist = sqlSession.selectList("mapper.admin.reservationList", param);
		
		return (ArrayList<DmuMemberVO>) mlist;
	}
	
	/*
	 * adminpage_reservation_content : 어드민 페이지 예약 상세내용
	 */
	
	public DmuReJoinVO reservationContent(String mid) {
		return sqlSession.selectOne("mapper.admin.reservationContent", mid);
	}

	
	/*
	 * 검색기능 (member)
	 */
	
	public ArrayList<DmuMemberVO> member_search_public(int startCount, int endCount, String keyword){
		ArrayList<DmuMemberVO> publicSearch = new ArrayList<DmuMemberVO>();
		
		String sql = "select rno, mid, mname, pnumber, email, ddate, unregister "
				+ " from(select rownum rno, mid, mname, pnumber, email, to_char(ddate, 'yy-mm-dd') ddate, unregister "
				+ " from(select mid, mname, pnumber, email, ddate, unregister "
				+ " from(select mid, mname, pnumber, email, ddate, unregister, status from dmu_member "
				+ " where mid like ? or mname like ? or pnumber like ? or email like ? or ddate like ? or unregister like ?) "
				+ " where status = 'public')) "
				+ " where rno between ? and ?";
		
	
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setString(4, "%" + keyword + "%");
			pstmt.setString(5, "%" + keyword + "%");
			pstmt.setString(6, "%" + keyword + "%");
			pstmt.setInt(7, startCount);
			pstmt.setInt(8, endCount);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DmuMemberVO vo = new DmuMemberVO();
				vo.setRno(rs.getInt(1));
				vo.setMid(rs.getString(2));
				vo.setMname(rs.getString(3));
				vo.setPnumber(rs.getString(4));
				vo.setEmail(rs.getString(5));	
				vo.setDdate(rs.getString(6));	
				vo.setUnregister(rs.getString(7));
				
				publicSearch.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return publicSearch;
		
	}
	
	/*
	 * 검색기능 (public 로우 수 출력)
	 */
	
	public int totalCount_publicSearch(String keyword) {
		int result = 0;
		String sql = "select count(*) "
				+ " from (select mid, mname, pnumber, email, ddate, unregister, status from dmu_member "
				+ " where mid like ? or mname like ? or pnumber like ? or email like ? or ddate like ? or unregister like ?) "
				+ " where status ='public' ";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setString(4, "%" + keyword + "%");
			pstmt.setString(5, "%" + keyword + "%");
			pstmt.setString(6, "%" + keyword + "%");
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
	 * 검색기능 (admin)
	 */
	
	public ArrayList<DmuMemberVO> member_search_admin(int startCount, int endCount, String keyword){
		ArrayList<DmuMemberVO> adminSearch = new ArrayList<DmuMemberVO>();
		
		String sql = "select rno, mid, mname, pnumber, email, ddate, unregister, status "
				+ " from(select rownum rno, mid, mname, pnumber, email, to_char(ddate, 'yy-mm-dd') ddate, unregister, status "
				+ " from(select mid, mname, pnumber, email, ddate, unregister, status "
				+ " from(select mid, mname, pnumber, email, ddate, unregister, status from dmu_member "
				+ " where mid like ? or mname like ? or pnumber like ? or email like ? or ddate like ? or unregister like ? or status like ?) "
				+ " where status not in('public'))) "
				+ " where rno between ? and ?";
		
	
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setString(4, "%" + keyword + "%");
			pstmt.setString(5, "%" + keyword + "%");
			pstmt.setString(6, "%" + keyword + "%");
			pstmt.setString(7, "%" + keyword + "%");
			pstmt.setInt(8, startCount);
			pstmt.setInt(9, endCount);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DmuMemberVO vo = new DmuMemberVO();
				vo.setRno(rs.getInt(1));
				vo.setMid(rs.getString(2));
				vo.setMname(rs.getString(3));
				vo.setPnumber(rs.getString(4));
				vo.setEmail(rs.getString(5));	
				vo.setDdate(rs.getString(6));	
				vo.setUnregister(rs.getString(7));
				vo.setStatus(rs.getString(8));
				
				adminSearch.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return adminSearch;
		
	}
	
	
	/*
	 * 검색기능 (admin 로우 수 출력)
	 */
	
	public int totalCount_adminSearch(String keyword) {
		int result = 0;
		String sql = "select count(*) "
				+ " from (select mid, mname, pnumber, email, ddate, unregister, status from dmu_member "
				+ " where mid like ? or mname like ? or pnumber like ? or email like ? or ddate like ? or unregister like ? or status like ?) "
				+ " where status not in('public') ";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setString(4, "%" + keyword + "%");
			pstmt.setString(5, "%" + keyword + "%");
			pstmt.setString(6, "%" + keyword + "%");
			pstmt.setString(7, "%" + keyword + "%");
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
	 * 검색기능 (reservation)
	 */
	
	
	public ArrayList<DmuReJoinVO> member_search_reserve(int startCount, int endCount, String keyword){
		ArrayList<DmuReJoinVO> reserveSearch = new ArrayList<DmuReJoinVO>();
		
		String sql = "select  dt.dcode, dr.rid, dt.dtitle, dm.mname, to_char(dt.dprice,'999,999') dpricech, dr.rtotal, "
				+ " to_char(dr.rallprice,'999,999') rallpricech, to_char(dr.rdate, 'YYYY-MM-DD') rdateda, to_char(dr.rokdate,'YYYY-MM-DD') rokdatech "
				+ " from dmu_ticket DT, dmu_reservation DR, dmu_member DM "
				+ " where  dm.mid = dr.mid and dt.did = dr.did and dr.rid in "
				+ " (select rid from (select rownum rno, rid, rokdate from (select rid, rokdate from dmu_reservation order by rokdate desc)) "
				+ " where rno between ? and ?) "
				+ " and (dt.dcode like ? or dr.rid like ? or dt.dtitle like ? or dm.mname like ? or dt.dprice like ? or dr.rtotal like ? or dr.rallprice like ? or dr.rdate like ? or dr.rokdate like ?) "
				+ " order by rokdate desc";
		
	
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setString(4, "%" + keyword + "%");
			pstmt.setString(5, "%" + keyword + "%");
			pstmt.setString(6, "%" + keyword + "%");
			pstmt.setString(7, "%" + keyword + "%");
			pstmt.setString(8, "%" + keyword + "%");
			pstmt.setString(9, "%" + keyword + "%");
			pstmt.setString(10, "%" + keyword + "%");
			pstmt.setString(11, "%" + keyword + "%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DmuReJoinVO vo = new DmuReJoinVO();
				vo.setDcode(rs.getString(1));
				vo.setRid(rs.getString(2));
				vo.setDtitle(rs.getString(3));
				vo.setMname(rs.getString(4));	
				vo.setDpricech(rs.getString(5));	
				vo.setRtotal(rs.getInt(6));
				vo.setRallpricech(rs.getString(7));
				vo.setRdateda(rs.getString(7));
				vo.setRokdatech(rs.getString(7));
				
				reserveSearch.add(vo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return reserveSearch;
		
	}

	public int totalCount_reserve(String keyword) {
		int result = 0;
		
		String sql = "select count(*) from "
				+ " (select  dt.dcode, dr.rid, dt.dtitle, dm.mname, to_char(dt.dprice,'999,999') dpricech, dr.rtotal, "
				+ " to_char(dr.rallprice,'999,999') rallpricech, to_char(dr.rdate, 'YYYY-MM-DD') rdateda,  to_char(dr.rokdate,'YYYY-MM-DD') rokdatech "
				+ " from dmu_ticket DT, dmu_reservation DR, dmu_member DM "
				+ " where  dm.mid = dr.mid and dt.did = dr.did and dr.rid in "
				+ " (select rid from (select rownum rno, rid, rokdate from (select rid, rokdate from dmu_reservation order by rokdate desc))) "
				+ " and (dt.dcode like ? or dr.rid like ? or dt.dtitle like ? or dm.mname like ? or dt.dprice like ? or dr.rtotal like ? or dr.rallprice like ? or dr.rdate like ? or dr.rokdate like ?) "
				+ " order by rokdate desc) ";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setString(3, "%" + keyword + "%");
			pstmt.setString(4, "%" + keyword + "%");
			pstmt.setString(5, "%" + keyword + "%");
			pstmt.setString(6, "%" + keyword + "%");
			pstmt.setString(7, "%" + keyword + "%");
			pstmt.setString(8, "%" + keyword + "%");
			pstmt.setString(9, "%" + keyword + "%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
		
		
	}
	
	
}
