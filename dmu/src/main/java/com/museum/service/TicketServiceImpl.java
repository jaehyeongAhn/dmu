package com.museum.service;

import java.util.ArrayList;


import com.museum.dao.DmuTicketDAO;
import com.museum.vo.DmuTicketVO;

public class TicketServiceImpl implements TicketService {
	/**
	 *  게시글 쓰기
	 */
	@Override
	public int getWriteResult(DmuTicketVO vo) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.insert(vo);
		
		return result;
	}
	//게시글 겟수
	@Override
	public int getTotalCount() {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.totalCount();
		return result;
	}
	//게시글 전체조회
	@Override
	public ArrayList<DmuTicketVO> getList(int startCount, int endCount) {
		DmuTicketDAO dao = new DmuTicketDAO();
		ArrayList<DmuTicketVO> list = dao.select(startCount, endCount);
		return list;
	}
	//티켓게시글 상세조회
	@Override
	public DmuTicketVO getContent(String did) {
		DmuTicketDAO dao = new DmuTicketDAO();
		DmuTicketVO vo = dao.select(did);
		return vo;
	}
	@Override
	public int getUpdate(DmuTicketVO vo) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.update(vo);
		return result;
	}
	@Override
	public int getDelete(String did) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.delete(did);
		return result;
	}
	
	
}