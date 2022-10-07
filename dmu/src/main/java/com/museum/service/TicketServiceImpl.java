package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuTicketDAO;
import com.museum.vo.DmuReJoinVO;
import com.museum.vo.DmuTicketVO;

@Service
public class TicketServiceImpl implements TicketService {
	
	@Autowired
	private DmuTicketDAO ticketDAO;
	 
	
	/**
	 */
	@Override
	public int getWriteResult(DmuTicketVO vo) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.insert(vo);
		
		return result;
	}
	@Override
	public int getTicketLearnCount(String dtarget) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.ticketlearnCount(dtarget);
		return result;
	}
	@Override
	public ArrayList<DmuTicketVO> getLists( int startCount,int endCount ,String dcode,String dtarget) {
		DmuTicketDAO dao = new DmuTicketDAO();
		ArrayList<DmuTicketVO> list = dao.selects( startCount,endCount,dcode,dtarget);
		return list;
	}
	@Override
	public ArrayList<DmuTicketVO> getList( int startCount,int endCount ,String dcode) {
		DmuTicketDAO dao = new DmuTicketDAO();
		ArrayList<DmuTicketVO> list = dao.select( startCount,endCount,dcode);
		return list;
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
	@Override
	public int getTicketCount(String dcode) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result =dao.ticketCount(dcode);
		
		return result;
	}
	
	 
		
	
	//exhibtion.do 상세보기
	@Override
	public DmuTicketVO getContent(String did) {
		 
		return ticketDAO.select(did);
	}

	 
	@Override
	public int getInsertDate(DmuReJoinVO vo) {
		 
		return ticketDAO.insertDate(vo);
	}
	
	@Override
	public DmuReJoinVO getReservationcontent(String did) {
		 
		return ticketDAO.selectReservation(did);
	}
	@Override
	public DmuReJoinVO getcompletecontent(String did) {
		
		return ticketDAO.selectCompleteCheck(did);
	}
	 
	
	 
	
}
 
	
 
