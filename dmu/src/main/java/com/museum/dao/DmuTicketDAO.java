package com.museum.dao;

import java.util.ArrayList;



import com.museum.vo.DmuTicketVO;
 

public class DmuTicketDAO extends DBConn {
	/**
	 *  delete : 寃뚯떆湲� �궘�젣
	 */
	public int delete(String did) {
		int result=0;
		String sql = "delete from dmu_ticket where did=?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, did);
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 *  insert : 寃뚯떆湲� 異붽�
	 */
	public int insert(DmuTicketVO vo) {
		int result = 0;
		
		String sql = " insert into dmu_ticket values('d_'||sequ_dmu_ticket.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,? )";
		 	
		try {
			getPreparedStatement(sql);
					 
			pstmt.setString(1, vo.getDtitle());
			pstmt.setInt(2, vo.getDprice());
			pstmt.setString(3, vo.getDplace());
			pstmt.setString(4, vo.getDinformation());
			pstmt.setInt(5, vo.getDpersonnel());
			pstmt.setString(6, vo.getDtime());
			pstmt.setString(7, vo.getDtarget());
			pstmt.setInt(8, vo.getDnum());
			pstmt.setString(9, vo.getDfile());
			pstmt.setString(10, vo.getDsfile());
			pstmt.setString(11, vo.getDstart());
			pstmt.setString(12, vo.getDend());
			pstmt.setString(13, vo.getDcode());
			 		
			result = pstmt.executeUpdate();
					
			close();
						
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;		
	}
	/**
	 * select : exhibition 怨듭��궗�빆 由ъ뒪�듃
	 */
	public ArrayList<DmuTicketVO> select(int startCount, int endCount){
		ArrayList<DmuTicketVO> list = new ArrayList<DmuTicketVO>();
		String sql = " select rno,did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum "
				 	+" from(select rownum rno,did,dplace,dtitle,   dstart ,"
				 	+ "   dend ,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum "
					+" from (select did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum from dmu_ticket)) "
					+" 	where rno between ? and ?";
		try { 
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DmuTicketVO vo = new DmuTicketVO();
				vo.setRno(rs.getInt(1));
				vo.setDid(rs.getString(2));
				vo.setDplace(rs.getString(3));
				vo.setDtitle(rs.getString(4));
				vo.setDstart(rs.getString(5));
				vo.setDend(rs.getString(6));
				vo.setDfile(rs.getString(7));
				vo.setDsfile(rs.getString(8));
				vo.setDcode(rs.getString(9));
				vo.setDtime(rs.getString(10));
				vo.setDprice(rs.getInt(11));
				vo.setDtarget(rs.getString(12));
				vo.setDnum(rs.getInt(13));
				
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * totalCount : �쟾泥� 濡쒖슦�닔 異쒕젰
	 */
	public int totalCount() {
		int result = 0;
		String sql = "select count(*) from dmu_ticket";
		
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			//close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/* 02.愿��엺�씪/�씤�썝�꽑�깮
	 *  select : 寃뚯떆湲� �긽�꽭蹂닿린
	 */
	public DmuTicketVO select(String did) {
		DmuTicketVO vo = new DmuTicketVO();
		

		String sql = " select did, dtitle, dstart, dend, dprice,dplace,dinformation,dtime,dpersonnel,dtarget,dnum,dfile,dsfile, TRUNC(TO_DATE(dend, 'YY-MM-DD') - SYSDATE)+1 ENDDATE  "
    + " from dmu_ticket where did=?";

		try {
			getPreparedStatement(sql);
			pstmt.setString(1, did);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setDid(rs.getString(1));
				vo.setDtitle(rs.getString(2));				
				vo.setDstart(rs.getString(3));
				vo.setDend(rs.getString(4));
				vo.setDprice(rs.getInt(5));
				vo.setDplace(rs.getString(6));
				vo.setDinformation(rs.getString(7));
				vo.setDtime(rs.getString(8));

				vo.setDpersonnel(rs.getInt(9));
				vo.setDtarget(rs.getString(10));
				vo.setDnum(rs.getInt(11));
				vo.setDfile(rs.getString(12));
				vo.setDsfile(rs.getString(13));
				vo.setEnddate(rs.getString(14));

			}
			
		//	close(); 議고쉶�닔 �뾽�뜲�씠�듃瑜� 媛숈� 怨녹뿉�꽌 �븯湲곗쐞�빐�꽌 二쇱꽍 泥섎━�빐�빞�맂�떎
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	// 怨듭��궗�빆 �뾽�뜲�씠�듃
	public int update(DmuTicketVO vo) {
		int result = 0;
		String sql = " 	update dmu_ticket set dtitle=?, dstart=?, dend=?, dprice=?, dplace=?, dinformation=?, dtime=?, dpersonnel=?,"
				+ "		dtarget=?, dnum=?, dfile=?, dsfile=?  "
				+ "		 where did=?  " ;
		try {
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getDtitle());
			pstmt.setString(2, vo.getDstart());
			pstmt.setString(3, vo.getDend());
			pstmt.setInt(4, vo.getDprice());
			pstmt.setString(5, vo.getDplace());
			pstmt.setString(6, vo.getDinformation());
			pstmt.setString(7, vo.getDtime());
			pstmt.setInt(8, vo.getDpersonnel());
			pstmt.setString(9, vo.getDtarget());
			pstmt.setInt(10, vo.getDnum());
			pstmt.setString(11, vo.getDfile());
			pstmt.setString(12, vo.getDsfile());
			pstmt.setString(13, vo.getDid());
			 		
			result = pstmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
 