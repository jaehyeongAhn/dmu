package com.museum.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuReservationVO;
import com.museum.vo.DmuTicketVO;
 
@Repository
public class DmuTicketDAO extends DBConn {
 
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
 
   /**
    *  delete : 
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
    *  insert : 
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
    * select : 
    */
   public ArrayList<DmuTicketVO> select( int startCount,int endCount , String dcode){
      ArrayList<DmuTicketVO> list = new ArrayList<DmuTicketVO>();
      //sql 눧占  占쎈퓠占쎄퐣 dcode嚥∽옙  겫袁⑥첒占쎈퉸占쎄퐣  뵳 딅뮞占쎈뱜  빊 뮆 젾  뵳 딅뮞占쎈뱜 몴占  占쎌읈筌ｋ 占쏙옙 筌믩쵐釉섓옙苑  jsp占쎈퓠占쎄퐣  겫袁⑥첒占쎈퉸 雅뚯눖 늺 占쎈あ甕곤옙 占쎌삂占쎈씜占쎌뱽 占쎈즼占쎌젻占쎈튊占쎈퉸占쎄퐣 占쎈뻻占쎈뮞占쎈 ο옙 읅占쎌몵嚥∽옙  占쎌궎占쎌삋椰꾨챶 뵝!!!!
      String sql = " select rno,did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum,dtitle2,dentertime "
                +" from(select rownum rno,did,dplace,dtitle,   dstart ,"
                + "   dend ,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum,dtitle2,dentertime "
               +" from (select did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum ,dtitle2,dentertime from dmu_ticket where dcode = ? )) "
               +"    where rno between ? and ?";
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
    * totalCount : 
    */
   public ArrayList<DmuTicketVO> selects( int startCount,int endCount , String dcode,String dtarget){
      ArrayList<DmuTicketVO> list = new ArrayList<DmuTicketVO>();
      //sql 눧占  占쎈퓠占쎄퐣 dcode嚥∽옙  겫袁⑥첒占쎈퉸占쎄퐣  뵳 딅뮞占쎈뱜  빊 뮆 젾  뵳 딅뮞占쎈뱜 몴占  占쎌읈筌ｋ 占쏙옙 筌믩쵐釉섓옙苑  jsp占쎈퓠占쎄퐣  겫袁⑥첒占쎈퉸 雅뚯눖 늺 占쎈あ甕곤옙 占쎌삂占쎈씜占쎌뱽 占쎈즼占쎌젻占쎈튊占쎈퉸占쎄퐣 占쎈뻻占쎈뮞占쎈 ο옙 읅占쎌몵嚥∽옙  占쎌궎占쎌삋椰꾨챶 뵝!!!!
      String sql = " select rno,did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum,dtitle2,dentertime "
            +" from(select rownum rno,did,dplace,dtitle,   dstart ,"
            + "   dend ,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum,dtitle2,dentertime "
            +" from (select did,dplace,dtitle,dstart,dend,dfile,dsfile,dcode,dtime,dprice,dtarget,dnum ,dtitle2,dentertimefrom dmu_ticket where dcode = ? and dtarget= ?)) "
            +"    where rno between ? and ?";
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
    *  dcode
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
    *  dtarget
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
   
 
public int update(DmuTicketVO vo) {
   int result = 0;
   String sql = "    update dmu_ticket set dtitle=?, dstart=?, dend=?, dprice=?, dplace=?, dinformation=?, dtime=?, dpersonnel=?,"
         + "      dtarget=?, dnum=?, dfile=?, dsfile=?  ,dtitle2=? ,dentertime=?"
         + "       where did=?  " ;
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
      pstmt.setString(14, vo.getDentertime());
      pstmt.setString(15, vo.getDid());
             
      result = pstmt.executeUpdate();
      close();
   } catch (Exception e) {
      e.printStackTrace();
   }
   return result;
}
   
    
public DmuTicketVO select(String did) {
       
      
 
      return sqlSession.selectOne("mapper.ticket.content", did) ;
 
 
   }
 
   
   /* 02.관람일/인원선택
    *  insert : 관람일/회차/관람인원 데이더 저장
    */
   
   public int insertDate(DmuReJoinVO vo) {
      
      
      
      return sqlSession.insert("mapper.ticket.reservationdate",vo);
   }
   
   /* 02.관람일/인원선택
    *   select : 결제내용 상세보기
    */
   
   public DmuReJoinVO selectReservation(String did) {
      
      
      
      return sqlSession.selectOne("mapper.ticket.reservationContent",did);
   }
   
   
   /* 03.관람일/인원선택
    *   select : 결제하기
    */
   
   public DmuReJoinVO selectCompleteCheck(String did) {
      
      return sqlSession.selectOne("mapper.ticket.CompleteContent",did);
   }
   
    
}
