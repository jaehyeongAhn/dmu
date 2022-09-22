package com.museum.dao;

import com.museum.vo.DmuMemberVO;

public class DmuMemberDAO extends DBConn{
	//login_update : 비밀번호 재변경
	public int login_update(DmuMemberVO vo) {
		int result = 0;
		String sql = "UPDATE DMU_MEMBER SET PASS = ? WHERE MID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getPass());
			pstmt.setString(2, vo.getMid());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//emailCheckPass : 비밀번호 찾기 email 일치 확인
	public int emailCheckPass(String email, String name, String mid) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM DMU_MEMBER WHERE EMAIL = ? AND DNAME = ? AND MID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, mid);
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
	
	//selectId : id 찾기
	public String selectId(DmuMemberVO vo) {
		String result = "";
		//String sql = "SELECT RPAD(SUBSTR(DID, 1, 4), 10, '*') DID FROM DMU_MEMBER WHERE EMAIL = ? AND DNAME = ?";
		String sql = "SELECT MID FROM DMU_MEMBER WHERE EMAIL = ? AND MNAME = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getMname());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getString(1);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//emailCheckId : 아이디 찾기 email 일치 확인
	public int emailCheckId(String email, String name) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM DMU_MEMBER WHERE EMAIL = ? AND DNAME = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
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
	
	//login : 로그인
	public int login(DmuMemberVO vo) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM DMU_MEMBER WHERE MID = ? AND PASS = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getMid());
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
	public int idCheck(String mid) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM DMU_MEMBER WHERE MID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, mid);
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
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getNationality());
			pstmt.setString(4, vo.getMname());
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
