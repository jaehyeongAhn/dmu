package com.museum.dao;

import java.util.ArrayList;

import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuNoticeVO;

public class DmuAdminDAO extends DBConn{
	
	/*
	 * adminpage_member_list : 어드민 페이지 회원 리스트 출력 
	 */
	public ArrayList<DmuMemberVO> memberList(int startCount, int endCount) {
		ArrayList<DmuMemberVO> mlist = new ArrayList<DmuMemberVO>();
		
		String sql = "select rno, mid, nationality, mname, gender, email, birth, pnumber, addr1, addr2, unregister, ddate, addr1||' '||addr2 address"
				+ " from(select rownum rno, mid, nationality, mname, gender, email, to_char(birth, 'yyyy-mm-dd') birth, pnumber, addr1, addr2, unregister, to_char(ddate, 'yyyy-mm-dd') ddate "
				+ " from(select mid, nationality, mname, gender, email, birth, pnumber, addr1, addr2, unregister, ddate from dmu_member "
				+ " order by ddate))"
				+ " where rno between ? and ?";
		
		try {
			getPreparedStatement(sql);
			
			 pstmt.setInt(1, startCount); 
			 pstmt.setInt(2, endCount);
			 
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DmuMemberVO vo = new DmuMemberVO();
				
				vo.setRno(rs.getInt(1));
				vo.setMid(rs.getString(2));
				vo.setNationality(rs.getString(3));
				vo.setMname(rs.getString(4));
				vo.setGender(rs.getString(5));
				vo.setEmail(rs.getString(6));
				vo.setBirth(rs.getString(7));
				vo.setPnumber(rs.getString(8));
				vo.setAddr1(rs.getString(9));
				vo.setAddr2(rs.getString(10));
				vo.setUnregister(rs.getString(11));
				vo.setDdate(rs.getString(12));
				vo.setAddress(rs.getString(13));
				
				mlist.add(vo);
				
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mlist;
	}
	
	
	/*
	 * memberContent : 어드민 회원 리스트 상세내용 출력
	 */
	
	
	
	/*
	 * totalCount() : 회원 총 로우수
	 */
	
	public int totalCount() {
		int result = 0;
		
		String sql = "select count(*) from dmu_member";
		
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


}
