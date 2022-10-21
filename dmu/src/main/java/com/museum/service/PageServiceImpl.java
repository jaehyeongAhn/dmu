package com.museum.service;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class PageServiceImpl {
   
   @Autowired
   private TicketServiceImpl ticketService;
   
   /**
    * 
    */
    public Map<String,Integer> getPageResult(String rpage,String serviceName, Object service) {
       Map<String,Integer> param =new HashMap<String,Integer>();
      //startCount, endCount
         int startCount = 0;
         int endCount = 0;
         int pageSize = 3;    
         int reqPage = 1;   
         int pageCount = 1;   
         int dbCount = 0;   
         
        
         if(dbCount % pageSize == 0){
            pageCount = dbCount/pageSize;
         }else{
            pageCount = dbCount/pageSize+1;
         }
         
         if(rpage != null){
            reqPage = Integer.parseInt(rpage);
            startCount = 1;
            endCount = reqPage *pageSize;
         }else{
            startCount = 1;
            endCount = pageSize;
         }
         
         param.put("startCount", startCount);
         param.put("endCount", endCount);
         param.put("dbCount", dbCount);
         param.put("pageSize", pageSize);
         param.put("pageCount", pageCount);
         param.put("rpage", reqPage);
         
         return param;
         
    }
} 