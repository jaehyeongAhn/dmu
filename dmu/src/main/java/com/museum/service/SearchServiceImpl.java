package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuSearchDAO;
import com.museum.vo.DmuSearchVO;
import com.museum.vo.DmuTicketVO;

@Service
public class SearchServiceImpl {
	
	@Autowired
	private DmuSearchDAO searchDao;
	
	//검색 결과 반환
	public ArrayList<DmuTicketVO> getSearchList(String keyword, String dpage){
		return searchDao.search(keyword, dpage);
	}
	
	//로우 수 반환
	public DmuSearchVO getTotalCount(String keyword) {
		return searchDao.totalCount(keyword);
	}
}
