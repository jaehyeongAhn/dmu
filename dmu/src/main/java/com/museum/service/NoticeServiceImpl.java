package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuNoticeDAO;
import com.museum.vo.DmuNoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private DmuNoticeDAO noticeDAO;
	
	/*
	 * 공지사항 총 로우 수
	 */
	@Override
	public int getTotalCount(){
		return noticeDAO.totalCount();
	}
	
	/*
	 * 공지사항 리스트
	 */
	@Override
	public ArrayList<DmuNoticeVO> getList(int startCount, int endCount){
		return noticeDAO.select(startCount, endCount);
	}
	
	/*
	 * 공지사항 상세보기
	 */
	@Override
	public DmuNoticeVO getContent(String nid) {
		return noticeDAO.select(nid);
	}
	
	/*
	 * 공지사항 글쓰기
	 */
	@Override
	public int getWriteResult(DmuNoticeVO vo) {
		return noticeDAO.insert(vo);
	}
	
	/*
	 * 공지사항 수정
	 */
	@Override
	public int getUpdateResult(DmuNoticeVO vo) {
		return noticeDAO.update(vo);
	}
	
	/*
	 * 공지사항 삭제 
	 */
	
	@Override
	public int getDeleteResult(String nid) {
		return noticeDAO.delete(nid);
	}
	
	
	
}
