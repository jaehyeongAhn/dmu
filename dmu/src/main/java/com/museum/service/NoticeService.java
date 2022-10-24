package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuNoticeVO;

public interface NoticeService {
	
	int getTotalCount();
	int getTotalCount_category(String ncategory);
	int getTotalCount_search(String keyword, String searchList);
	ArrayList<DmuNoticeVO> getList(int startCount, int endCount);
	ArrayList<DmuNoticeVO> categoryList(int startCount, int endCount, String ncategory);
	ArrayList<DmuNoticeVO> noticeSearch(int startCount, int endCount, String keyword, String searchList);
	DmuNoticeVO getContent(String nid);
	int getWriteResult(DmuNoticeVO vo);
	int getUpdateResult(DmuNoticeVO vo);
	int getDeleteResult(String nid);
	
	
	
}
