package com.museum.service;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class PageServiceImpl {
	
	@Autowired
	private TicketServiceImpl ticketrService;
	
	/**
	 * 
	 */
	 public Map<String,Integer> getPageResult(String rpage,String serviceName, Object service) {
		 Map<String,Integer> param =new HashMap<String,Integer>();
		//startCount, endCount
			//�럹�씠吏� 泥섎━ - startCount, endCount 援ы븯湲� 
			int startCount = 0;
			int endCount = 0;
			int pageSize = 3;	//�븳�럹�씠吏��떦 寃뚯떆臾� �닔 
			int reqPage = 1;	//�슂泥� �럹�씠吏� 
			int pageCount = 1;	//�쟾泥� �럹�씠吏� �닔 
			int dbCount = 0;	//DB�뿉�꽌 媛��졇�삩 �쟾泥� �뻾 �닔 
			
			//dcode媛� learn �씪�븣 dbcount 媛믪씠 �젙�빐吏꾨떎. 
			if(serviceName.equals("learn")) {
				ticketrService =(TicketServiceImpl)service;
				 dbCount = ticketrService.getTicketCount(serviceName);
				 
			}
			//dcode媛� event �씪�븣 dbcount 媛믪씠 �젙�빐吏꾨떎. 
			if(serviceName.equals("event")) {
				ticketrService =(TicketServiceImpl)service;
				dbCount = ticketrService.getTicketCount(serviceName);
				
			}
			//dcode媛� exhibition �씪�븣 dbcount 媛믪씠 �젙�빐吏꾨떎. 
			if(serviceName.equals("exhibition")) {
				ticketrService =(TicketServiceImpl)service;
				dbCount = ticketrService.getTicketCount(serviceName);
				
			}
			//dbcount 媛믪씠 �엳�쑝硫� ticketcount �뿉�꽌 洹멸컪�쑝濡쒖갼
//			if(serviceName != null) {
//				ticketrService =(TicketServiceImpl)service;
//				dbCount = ticketrService.getTicketCount(serviceName);
//			}
			// 珥앺럹�씠吏� �닔 怨꾩궛 
			if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}
			
			//�슂泥� �럹�씠吏� 怨꾩궛 
			if(rpage != null){
				reqPage = Integer.parseInt(rpage);
				startCount = 1;
						//(reqPage-1) * pageSize+1;
				endCount = reqPage *pageSize;
			}else{
				startCount = 1;
				endCount = pageSize;
			}
			
			//由ы꽩���엯�씤 map �뿉 �뜲�씠�꽣 異붽� 
			param.put("startCount", startCount);
			param.put("endCount", endCount);
			param.put("dbCount", dbCount);
			param.put("pageSize", pageSize);
			param.put("pageCount", pageCount);
			param.put("rpage", reqPage);
			
			return param;
			
	 }
} 
