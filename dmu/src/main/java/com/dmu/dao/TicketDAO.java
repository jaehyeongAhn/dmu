package com.dmu.dao;

import com.dmu.vo.ExhibitionVO;

public class TicketDAO extends DBConn {

	public int insert(ExhibitionVO vo) {
		int result = 0;
		
		String sql = "insert into dmu_exhibition values(?,?,?,?,?,?,?)";
			
		try {
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getDexhibtion());
			pstmt.setString(2, vo.getdPlace());
			pstmt.setString(3, vo.getDstart());
			pstmt.setString(4, vo.getDend());
			pstmt.setString(5, vo.getDprice());
			pstmt.setString(6, vo.getDtimed());
			pstmt.setString(7, vo.getDinformation());
			 
			result = pstmt.executeUpdate();
					
			close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;		
	}
}
 