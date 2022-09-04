package com.dmu.dao;

import java.util.ArrayList;

public class TestDAO extends DBConn{
	public int insertCalendar(String date) {
		int result = 0;
		String sql = "INSERT INTO CALENDAR VALUES(?)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, date);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String selectCalendar(String date) {
		String list = null;
		String sql = "SELECT TO_CHAR(CDATE, 'YYYY-MM-DD') CDATE FROM CALENDAR WHERE CDATE = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list = rs.getString(1);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int initCalendar() {
		int result = 0;
		String sql = "SELECT TRUNC(ENDDATE - SYSDATE)+1 FROM DATE_CALENDAR WHERE PRODUCT = 'test'";
		try {
			getPreparedStatement(sql);
			//pstmt.setString(1, "test");
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
}
