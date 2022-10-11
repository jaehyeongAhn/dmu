package com.museum.service;

import java.util.ArrayList;

import com.museum.dao.DmuNoticeDAO;
import com.museum.vo.DmuNoticeVO;

public class NoticeServiceImpl implements NoticeService{

	
	/*
	 * 공지사항 총 로우 수
	 */
	@Override
	public int getTotalCount(){
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int dbCount = dao.totalCount();
		return dbCount;
	}
	
	/*
	 * 공지사항 리스트
	 */
	@Override
	public ArrayList<DmuNoticeVO> getList(int startCount, int endCount){
		DmuNoticeDAO dao = new DmuNoticeDAO();
		ArrayList<DmuNoticeVO> list = dao.select(startCount, endCount);
		return list;
	}
	
	/*
	 * 공지사항 상세보기
	 */
	@Override
	public DmuNoticeVO getContent(String nid) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		DmuNoticeVO vo = dao.select(nid);
		return vo;
	}
	
	/*
	 * 공지사항 글쓰기
	 */
	@Override
	public int getWriteResult(DmuNoticeVO vo) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = dao.insert(vo);
		return result;
	}
	
	/*
	 * 공지사항 수정
	 */
	@Override
	public int getUpdateResult(DmuNoticeVO vo) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = dao.update(vo);
		return result;
	}
	
	/*
	 * 공지사항 삭제 
	 */
	
	@Override
	public int getDeleteResult(String nid) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = dao.delete(nid);
		return result;
	}
	
	
	/*
	 * 카테고리
	 */
	
	public int getTotalCount_category(String ncategory) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = dao.totalCount_category(ncategory);
		return result;
	}
	
	
	public ArrayList<DmuNoticeVO> categoryList(int startCount, int endCount, String ncategory){
		DmuNoticeDAO dao = new DmuNoticeDAO();
		ArrayList<DmuNoticeVO> clist = dao.categoryList(startCount, endCount, ncategory);
		return clist;
	}
	
	
}
