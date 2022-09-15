package com.museum.service;

import java.util.ArrayList;

import com.museum.vo.DmuNoticeVO;

public interface NoticeService {
	
	int getTotalCount();
	ArrayList<DmuNoticeVO> getList(int startCount, int endCount);
	DmuNoticeVO getContent(String nid);
	int getWriteResult(DmuNoticeVO vo);
	int getUpdateResult(DmuNoticeVO vo);
	int getDeleteResult(String nid);
	
	
	
}
