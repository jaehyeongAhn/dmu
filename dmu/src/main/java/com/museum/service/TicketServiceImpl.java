package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuTicketDAO;
import com.museum.vo.DmuTicketVO;

@Service
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
	
	 
	
}
