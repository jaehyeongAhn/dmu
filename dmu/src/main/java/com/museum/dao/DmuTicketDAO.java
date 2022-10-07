package com.museum.dao;

import java.util.ArrayList;



import com.museum.vo.DmuTicketVO;
 

public class DmuTicketDAO extends DBConn {
	/**
	 *  delete : 게시글 삭제
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
	 *  insert : 게시글 추가
	 */
	public int insert(DmuTicketVO vo) {
		int result = 0;
		
		String sql = " insert into dmu_ticket values('d_'||sequ_dmu_ticket.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,? ,?,?)";
		 	
		try {
			getPreparedStatement(sql);
					 
			pstmt.setString(1, vo.getDtitle());
			pstmt.setInt(2, vo.getDprice());
			pstmt.setString(3, vo.getDplace());
			pstmt.setString(4, vo.getDinformation());
			pstmt.setInt(5, vo.getDpersonnel());
			pstmt.setString(6, vo.getDtime());
			pstmt.setString(7, vo.getDtarget());
			pstmt.setString(8, vo.getDnum());
			pstmt.setString(9, vo.getDfile());
			pstmt.setString(10, vo.getDsfile());
			pstmt.setString(11, vo.getDstart());
			pstmt.setString(12, vo.getDend());
			pstmt.setString(13, vo.getDcode());
			pstmt.setString(14, vo.getDtitle2());
			pstmt.setString(15, vo.getDentertime());
			 		
			result = pstmt.executeUpdate();
					
			close();
						
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;		
	}
	/**
	 * select : dcode로 분류해서  공지사항 리스트 출력 
	 */
	public ArrayList<DmuTicketVO> select( int startCount,int endCount , String dcode){
		ArrayList<DmuTicketVO> list = new ArrayList<DmuTicketVO>();
		//sql문 에서 dcode로 분류해서 리스트 출력 리스트를 전체를 뽑아서 jsp에서 분류해 주면 두번 작업을 돌려야해서 시스템적으로  오래걸림!!!!
		String sql = " select rno,did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum,dtitle2,dentertime "
				 	+" from(select rownum rno,did,dplace,dtitle,   dstart ,"
				 	+ "   dend ,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum,dtitle2,dentertime "
					+" from (select did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum ,dtitle2,dentertime from dmu_ticket where dcode = ? )) "
					+" 	where rno between ? and ?";
		try { 
			getPreparedStatement(sql);
			
			pstmt.setString(1, dcode);
			pstmt.setInt(2, startCount);
			pstmt.setInt(3, endCount);
			
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
				vo.setDnum(rs.getString(13));
				vo.setDtitle2(rs.getString(14));
				vo.setDentertime(rs.getString(15));
				
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	/**
	 * select : learn 에서  dtarget으로 분류해서 리스트 출
	 */
	public ArrayList<DmuTicketVO> selects( int startCount,int endCount , String dcode,String dtarget){
		ArrayList<DmuTicketVO> list = new ArrayList<DmuTicketVO>();
		//sql문 에서 dcode로 분류해서 리스트 출력 리스트를 전체를 뽑아서 jsp에서 분류해 주면 두번 작업을 돌려야해서 시스템적으로  오래걸림!!!!
		String sql = " select rno,did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum,dtitle2,dentertime "
				+" from(select rownum rno,did,dplace,dtitle,   dstart ,"
				+ "   dend ,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum,dtitle2,dentertime "
				+" from (select did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum ,dtitle2,dentertimefrom dmu_ticket where dcode = ? and dtarget= ?)) "
				+" 	where rno between ? and ?";
		try { 
			getPreparedStatement(sql);
			
			pstmt.setString(1, dcode);
			pstmt.setString(2, dtarget);
			pstmt.setInt(3, startCount);
			pstmt.setInt(4, endCount);
			
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
				vo.setDnum(rs.getString(13));
				vo.setDtitle2(rs.getString(14));
				vo.setDentertime(rs.getString(15));
				
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	/**
	 *  dcode로 총 갯수 구하기	
	 */
	public int ticketCount(String dcode) {
		int result = 0;
		String sql = "select count(*) from dmu_ticket where dcode= ? ";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, dcode);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			result = rs.getInt(1);
			} 
			
			}catch (Exception e) {
			e.printStackTrace();
			}
			return result;
	}
	/**
	 *  dtarget로 총 갯수 구하기	
	 */
	public int ticketlearnCount(String dtarget) {
		int result = 0;
		String sql = "select count(*) from dmu_ticket where dtarget= ? ";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, dtarget);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			} 
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 02.관람일/인원선택
	 *  select : 게시글 상세보기
	 */
	public DmuTicketVO select(String did) {
		DmuTicketVO vo = new DmuTicketVO();
		

		String sql = " select did, dtitle, dstart, dend, dprice,dplace,dinformation,dtime,dpersonnel,dtarget,dnum,dfile,dsfile, TRUNC(TO_DATE(dend, 'YY-MM-DD') - SYSDATE)+1 ENDDATE ,dtitle2 "
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
				vo.setDnum(rs.getString(11));
				vo.setDfile(rs.getString(12));
				vo.setDsfile(rs.getString(13));
				vo.setEnddate(rs.getString(14));
				vo.setDtitle2(rs.getString(15));

				

			}
			
		//	close(); 조회수 업데이트를 같은 곳에서 하기위해서 주석 처리해야된다
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	// 공지사항 업데이트
	public int update(DmuTicketVO vo) {
		int result = 0;
		String sql = " 	update dmu_ticket set dtitle=?, dstart=?, dend=?, dprice=?, dplace=?, dinformation=?, dtime=?, dpersonnel=?,"
				+ "		dtarget=?, dnum=?, dfile=?, dsfile=?  ,dtitle2=? ,dentertime=?"
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
			pstmt.setString(10, vo.getDnum());
			pstmt.setString(11, vo.getDfile());
			pstmt.setString(12, vo.getDsfile());
			pstmt.setString(13, vo.getDtitle2());
			pstmt.setString(14, vo.getDid());
			pstmt.setString(15, vo.getDentertime());
			 		
			result = pstmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
 