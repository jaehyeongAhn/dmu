package com.museum.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.museum.vo.DmuNoticeVO;
import com.museum.vo.DmuTicketVO;

@Repository
public class DmuTagPageDAO {
	
	@Autowired
	   private SqlSessionTemplate sqlSession;
	 
	   /*
	    * tag_page all
	    */
	   public ArrayList<DmuTicketVO> getEventContent(String dcode) {
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.EventContent",dcode);
			return (ArrayList<DmuTicketVO>)list;
		     
		   }
	   
	   /**
	    * tag_page list
	    */
	   public ArrayList<DmuTicketVO> eventlist(String dplace ){
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.EventContentList",dplace);
		   return (ArrayList<DmuTicketVO>)list;
	   }
	
	   
	   
	   /*
	    * tag_page exhibition past
	    */
	   public ArrayList<DmuTicketVO> getExhibitionList(String dcode) {
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.exhibitionPast",dcode);
			return (ArrayList<DmuTicketVO>)list;
		     
		   }
	   /*
	    * tag_page exhibition past1
	    */
	   public ArrayList<DmuTicketVO> getExhibitionList1(String dcode) {
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.exhibitionPast1",dcode);
			return (ArrayList<DmuTicketVO>)list;
		     
		   }   
	   /*
	    * tag_page exhibition select
	    */
	   public DmuTicketVO exhibitionSelect() {
		   
			return sqlSession.selectOne("mapper.tagpage.exhibitionselect");
		     
		   }
	   
	   /**
	    * select : exhibition_past_page year
	    */
	   public ArrayList<DmuTicketVO> selectday(String dcode,String day){
		   
		   Map<String,String> param = new HashMap<String,String>();
		   param.put("dcode",dcode);
		   param.put("day",day);
			
			List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.dayContent",param);
			return (ArrayList<DmuTicketVO>)list;
	   }
	   /**
	    * select : exhibition_past_page1 year
	    */
	   public ArrayList<DmuTicketVO> selectday1(String dcode,String day){
		   Map<String,String> param = new HashMap<String,String>();
		   param.put("dcode",dcode);
		   param.put("day",day);
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.exhibitionPastYear",param);
		   return (ArrayList<DmuTicketVO>)list;
	   }
	   /**
	    * select : exhibition_past_page2 year
	    */
	   public ArrayList<DmuTicketVO> selectday2(String dcode,String day){
		   Map<String,String> param = new HashMap<String,String>();
		   param.put("dcode",dcode);
		   param.put("day",day);
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.exhibitionPast1Year",param);
		   return (ArrayList<DmuTicketVO>)list;
	   }
	   /**
	    * select : learnPastYear year
	    */
	   public ArrayList<DmuTicketVO> learnday(String dcode,String day,String dtarget){
		   Map<String,String> param = new HashMap<String,String>();
		   param.put("dcode",dcode);
		   param.put("day",day);
		   param.put("dtarget",dtarget);
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.learnPastYear",param);
		   return (ArrayList<DmuTicketVO>)list;
	   }
	   /**
	    * select : learnPastYearAll year
	    */
	   public ArrayList<DmuTicketVO> learndayAll(String dcode,String dtarget){
		   Map<String,String> param = new HashMap<String,String>();
		   param.put("dcode",dcode);
		   param.put("dtarget",dtarget);
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.learnPastAll",param);
		   return (ArrayList<DmuTicketVO>)list;
	   }
	   /**
	    * select : dtarget 
	    */
	   public ArrayList<DmuTicketVO> selects( String dcode,String dtarget){
		   Map<String,String> param = new HashMap<String,String>();
		   param.put("dcode",dcode);
		   param.put("dtarget",dtarget);
			
			List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.listdtarget",param);
			return (ArrayList<DmuTicketVO>)list;
	   }
	   public ArrayList<DmuTicketVO> selects2( String dcode,String dtarget){
		   Map<String,String> param = new HashMap<String,String>();
		   param.put("dcode",dcode);
		   param.put("dtarget",dtarget);
		   
		   List<DmuTicketVO> list = sqlSession.selectList("mapper.tagpage.listdtarget2",param);
		   return (ArrayList<DmuTicketVO>)list;
	   }
	   /**
	    *  dtarget totalcount
	    */
	   public int learnCount(String dtarget) {
	      return sqlSession.selectOne("mapper.tagpage.dtargetCount", dtarget);
	   }
	   
}
