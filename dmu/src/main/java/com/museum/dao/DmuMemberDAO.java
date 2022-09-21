package com.museum.dao;

import com.museum.vo.DmuMemberVO;

public class DmuMemberDAO extends DBConn{
	//login_update : ��й�ȣ �纯��
	public int login_update(DmuMemberVO vo) {
		int result = 0;
		String sql = "UPDATE DMU_MEMBER SET PASS = ? WHERE DID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getPass());
			pstmt.setString(2, vo.getDid());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//emailCheckPass : ��й�ȣ ã�� email ��ġ Ȯ��
	public int emailCheckPass(String email, String name, String did) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM DMU_MEMBER WHERE EMAIL = ? AND DNAME = ? AND DID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, did);
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
	
	//selectId : id ã��
	public String selectId(DmuMemberVO vo) {
		String result = "";
		//String sql = "SELECT RPAD(SUBSTR(DID, 1, 4), 10, '*') DID FROM DMU_MEMBER WHERE EMAIL = ? AND DNAME = ?";
		String sql = "SELECT DID FROM DMU_MEMBER WHERE EMAIL = ? AND DNAME = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getDname());
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
	
	//emailCheckId : ���̵� ã�� email ��ġ Ȯ��
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
	
	//login : �α���
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
	
	//idCheck : ȸ�� ���� �� �ߺ� ���̵� üũ
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
	//insert : ȸ�� ���� ���� �� ȸ�� ������ ����
	public int insert(DmuMemberVO vo) {
		int result = 0;
		//���� ���´� ���� �� �⺻���� 'y'�� ����
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
			
			//�Ϲ� or ��� �� �⺻���� �Ϲ��� �����ϵ��� ��
			//pstmt.setString(15, vo.getStatus());
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
