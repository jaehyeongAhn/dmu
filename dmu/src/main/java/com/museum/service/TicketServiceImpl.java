package com.museum.service;

import java.util.ArrayList;


import com.museum.dao.DmuTicketDAO;
import com.museum.vo.DmuTicketVO;

public class TicketServiceImpl implements TicketService {
	/**
	 *  계시판 작성 
	 */
	@Override
	public int getWriteResult(DmuTicketVO vo) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.insert(vo);
		
		return result;
	}
	// 로우 길이 구하기 
	@Override
	public int getTicketLearnCount(String dtarget) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.ticketlearnCount(dtarget);
		return result;
	}
	// 계시판 learn리스트 출력 
	@Override
	public ArrayList<DmuTicketVO> getLists( int startCount,int endCount ,String dcode,String dtarget) {
		DmuTicketDAO dao = new DmuTicketDAO();
		ArrayList<DmuTicketVO> list = dao.selects( startCount,endCount,dcode,dtarget);
		return list;
	}
	// 계시판 리스트 출력 
	@Override
	public ArrayList<DmuTicketVO> getList( int startCount,int endCount ,String dcode) {
		DmuTicketDAO dao = new DmuTicketDAO();
		ArrayList<DmuTicketVO> list = dao.select( startCount,endCount,dcode);
		return list;
	}
	// 계시판 상세보기 
	@Override
	public DmuTicketVO getContent(String did) {
		DmuTicketDAO dao = new DmuTicketDAO();
		DmuTicketVO vo = dao.select(did);
		return vo;
	}
	//  계시판 업데이트 
	@Override
	public int getUpdate(DmuTicketVO vo) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.update(vo);
		return result;
	}
	// 계시판 삭제하기 
	@Override
	public int getDelete(String did) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.delete(did);
		return result;
	}
	//계시판 '총' 갯수 구하기 
	@Override
	public int getTicketCount(String dcode) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result =dao.ticketCount(dcode);
		
		return result;
	}
	
	
}
