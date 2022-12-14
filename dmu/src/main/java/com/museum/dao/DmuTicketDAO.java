package com.museum.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuTicketVO;
 
@Repository
public class DmuTicketDAO  {
 
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
 
   /**
    *  delete : 티켓 리스트 삭제 
    */
   public int delete(String did) {
     
      return sqlSession.delete("mapper.ticket.delete", did);
   }
 

   /**
    *  insert :  티켓 리스트 추가 
    */
   public int insert(DmuTicketVO vo) {
      return sqlSession.insert("mapper.ticket.insert", vo);      
   }
   /**
    * select : dcode로 티켓 리스트 출력 
    */
   public ArrayList<DmuTicketVO> listdcode( int startCount,int endCount ,String dcode,String day){
	   Map<String,String> param = new HashMap<String,String>();
	   	param.put("dcode",dcode);
		param.put("start",Integer.toString(startCount));
		param.put("end",Integer.toString(endCount));
		param.put("day",day);
		List<DmuTicketVO> list = sqlSession.selectList("mapper.ticket.listdcode",param);
		return (ArrayList<DmuTicketVO>)list;
  }
   
   /**
    * select : dtarget으로 티켓 리스트 출력 
    */
   public ArrayList<DmuTicketVO> listdtarget(int startCount,int endCount, String dcode,String dtarget,String day){
	   Map<String,String> param = new HashMap<String,String>();
	   param.put("dcode",dcode);
	   param.put("dtarget",dtarget);
	param.put("start",Integer.toString(startCount));
	param.put("end",Integer.toString(endCount));
	param.put("day",day);

		List<DmuTicketVO> list = sqlSession.selectList("mapper.ticket.listdtarget",param);
		return (ArrayList<DmuTicketVO>)list;
   }
   
   /**
    *  dcode totalcount
    */
   public int ticketCount(String dcode) {
         return sqlSession.selectOne("mapper.ticket.dcodeCount", dcode);
   }
   /**
    *  dtarget totalcount
    */
   public int ticketlearnCount(String dtarget) {
      return sqlSession.selectOne("mapper.ticket.dtargetCount", dtarget);
   }
   /**
    *  update ticket 
    */
   public int update(DmuTicketVO vo) {
   return sqlSession.update("mapper.ticket.update", vo);
   }
   /**
    *  select id ticket 
    */
   public DmuTicketVO select(String did) {
      return sqlSession.selectOne("mapper.ticket.content", did) ;
   }
   /** 02.관람일/인원선택
    *  insert : 관람일/회차/관람인원 데이더 저장
    */
   public int insertDate(DmuReJoinVO vo) {
      return sqlSession.insert("mapper.ticket.reservationdate",vo);
   }
   public String ridNew() {
	   return sqlSession.selectOne("mapper.ticket.ridnew");
   }
   public int getreservationdatePay(DmuReJoinVO vo) {
	   return sqlSession.insert("mapper.ticket.reservationdatePay",vo);
   }
   public String pidNew() {
	   return sqlSession.selectOne("mapper.ticket.pidnew");
   }
   public int getTicketinfo(DmuReJoinVO vo) {
	   return sqlSession.insert("mapper.ticket.insert_ticket", vo);
   }
   
   /** 03.관람일/인원선택
    *   select : 결제하기
    */
   public DmuReJoinVO selectCompleteCheck(String mid) {
      return sqlSession.selectOne("mapper.ticket.CompleteContent",mid);
   }
  
 
   
  
   //티켓 매진
   public String ticketSellout(String did, String rdate) {
	   Map<String, String> param = new HashMap<String, String>();
	   param.put("did", did);
	   param.put("rdate", rdate);
	   System.out.println(did);
	   System.out.println(rdate);
	   return sqlSession.selectOne("mapper.ticket.ticketSellout", param);
   }
  
}
