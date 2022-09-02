package com.museum.dao;

import com.museum.vo.DmuMemberVO;

public class DmuMemberDAO extends DBConn{
	//login : 로그인
	public int login(DmuMemberVO vo) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM DMU_MEMBER WHERE DID = ? AND PASS = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getDid());
			pstmt.setString(2, vo.getPass());
			rs = pstmt.executeQuery();
			while(rs.next()){
				result = rs.getInt(1);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//idCheck : 회원 가입 시 중복 아이디 체크
	public int idCheck(String did) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM DMU_MEMBER WHERE DID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, did);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//insert : 회원 가입 성공 시 회원 데이터 저장
	public int insert(DmuMemberVO vo) {
		int result = 0;
		//계정 상태는 가입 시 기본으로 'y'로 만듦
		String sql = "INSERT INTO DMU_MEMBER VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'y', 'public', SYSDATE)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getDid());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getNationality());
			pstmt.setString(4, vo.getDname());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getBirth());
			pstmt.setString(8, vo.getPnumber());
			pstmt.setString(9, vo.getZonecode());
			pstmt.setString(10, vo.getAddr1());
			pstmt.setString(11, vo.getAddr2());
			pstmt.setString(12, vo.getTerms());
			pstmt.setString(13, vo.getOlder());
			pstmt.setString(14, vo.getConsent());
			
			//일반 or 운영자 는 기본으로 일반을 선택하도록 함
			//pstmt.setString(15, vo.getStatus());
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
