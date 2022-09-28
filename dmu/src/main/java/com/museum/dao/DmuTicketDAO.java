package com.museum.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuReservationVO;
import com.museum.vo.DmuTicketVO;
 
@Repository
public class DmuTicketDAO extends DBConn {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/**
	 *  insert : 게시글 추가
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
	 * select : exhibition 공지사항 리스트
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
	 * totalCount : 전체 로우수 출력
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
	
	
	/* 02.관람일/인원선택
	 *  select : 게시글 상세보기
	 */
	public DmuTicketVO select(String did) {
		 
		
		return sqlSession.selectOne("mapper.ticket.content", did) ;
	}
	
	/* 02.관람일/인원선택
	 *  insert : 관람일/회차/관람인원 데이더 저장
	 */
	
	public int insertDate(DmuReservationVO vo) {
		
		
		
		return sqlSession.insert("mapper.ticket.date",vo);
	}
	
	/* 02.관람일/인원선택
	 *   select : 결제내용 상세보기
	 */
	
	public DmuReservationVO selectReservation(String did) {
		
		
		
		return sqlSession.selectOne("mapper.ticket.reservationContent",did);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
 