package com.museum.service;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class PageServiceImpl {
	
	@Autowired
	private TicketServiceImpl ticketrService;
	
	/**
	 * 페이징 처리 
	 */
	 public Map<String,Integer> getPageResult(String rpage,String serviceName, Object service) {
		 Map<String,Integer> param =new HashMap<String,Integer>();
		//startCount, endCount
			//페이징 처리 - startCount, endCount 구하기
			int startCount = 0;
			int endCount = 0;
			int pageSize = 5;	//한페이지당 게시물 수
			int reqPage = 1;	//요청페이지	
			int pageCount = 1;	//전체 페이지 수
			int dbCount = 0;	//DB에서 가져온 전체 행수
			
			if(serviceName.equals("ticket")) {
				ticketrService =(TicketServiceImpl)service;
				 dbCount = ticketrService.getTotalCount();
			}
			//총 페이지 수 계산
			if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}
			
			//요청 페이지 계산
			if(rpage != null){
				reqPage = Integer.parseInt(rpage);
				startCount = (reqPage-1) * pageSize+1;
				endCount = reqPage *pageSize;
			}else{
				startCount = 1;
				endCount = pageSize;
			}
			
			//리턴타입인  map 에 데이터 추가
			param.put("startCount", startCount);
			param.put("endCount", endCount);
			param.put("dbCount", dbCount);
			param.put("pageSize", pageSize);
			param.put("PageCount", pageCount);
			param.put("rpage", reqPage);
			
			return param;
			
	 }
}
