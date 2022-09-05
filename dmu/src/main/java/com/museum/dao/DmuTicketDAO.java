package com.museum.dao;

import java.util.ArrayList;

import com.museum.vo.DmuTicketVO;
 

public class DmuTicketDAO extends DBConn {

	public int insert(DmuTicketVO vo) {
		int result = 0;
		
		String sql = " insert into dmu_ticket_list values('b_'||sequ_dmu_ticket_list.nextval,?, ?, ?, ?, ?, ?, ?) ";
		 	
		try {
			getPreparedStatement(sql);
					 
			pstmt.setString(1, vo.getDexhibtion());
			pstmt.setString(2, vo.getDstart());
			pstmt.setString(3, vo.getDend());
			pstmt.setString(4, vo.getDprice());
			pstmt.setString(5, vo.getDplace());
			pstmt.setString(6, vo.getDinformation());
			pstmt.setString(7, vo.getDtimed());
			 		
			result = pstmt.executeUpdate();
					
			close();
						
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;		
	}
	
	/*
	 *  insert : �Խñ� ��ü ����Ʈ ( �߰� - ����¡ ó��)
	 */
	public ArrayList<DmuTicketVO> select(int startCount, int endCount){
		ArrayList<DmuTicketVO> list = new ArrayList<DmuTicketVO>();
		
		String sql = "SELECT ROWNUM RNO, DID, dexhibtion,  dstart,dend, dprice, dPlace, dinformation,  dtime "
				+ " FROM(SELECT DID, dexhibtion,  dstart, dend, dprice, dPlace, dinformation,  dtime  FROM dmu_ticket_list) ";
				 
		try {
			getPreparedStatement(sql);
			//����¡ó�� ����
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
		
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DmuTicketVO vo = new DmuTicketVO();
				
				vo.setRno(rs.getInt(1));
				vo.setDid(rs.getString(2));
				vo.setDexhibtion(rs.getString(3));
				vo.setDstart(rs.getString(4));
				vo.setDend(rs.getString(4));
				
				list.add(vo);
				
			}
			
			close();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/*
	 *  select : �Խñ� �󼼺���
	 */
	public DmuTicketVO select(String bid) {
		DmuTicketVO vo = new DmuTicketVO();
		
		String sql = "select did, dexhibtion, dstart, dend, dprice,dplace,dinformation,dtime "
				+ " from dmu_ticket_list where did=?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pstmt.setString(1, vo.getDexhibtion());
				pstmt.setString(2, vo.getDstart());
				pstmt.setString(3, vo.getDend());
				pstmt.setString(4, vo.getDprice());
				pstmt.setString(5, vo.getDplace());
				pstmt.setString(6, vo.getDinformation());
				pstmt.setString(7, vo.getDtimed());
			}
			
		//	close(); ��ȸ�� ������Ʈ�� ���� ������ �ϱ����ؼ� �ּ� ó���ؾߵȴ�
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
		
	}
	
	
	
	
	
	
	
	
}
 