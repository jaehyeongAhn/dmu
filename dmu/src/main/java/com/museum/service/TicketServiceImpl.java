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
	@Override
	public int getWriteResult(DmuTicketVO vo) {
		return ticketDAO.insert(vo);
	}
	@Override
	public int getTicketLearnCount(String dtarget) {
		return ticketDAO.ticketlearnCount(dtarget);
	}
	@Override
	public ArrayList<DmuTicketVO> getLists( int startCount,int endCount ,String dcode,String dtarget) {
		ArrayList<DmuTicketVO> list = ticketDAO.selects( startCount,endCount,dcode,dtarget);
		return list;
	}
	@Override
	public ArrayList<DmuTicketVO> getList( int startCount,int endCount ,String dcode) {
		ArrayList<DmuTicketVO> list = ticketDAO.select( startCount,endCount,dcode);
		return list;
	}
	@Override
	public int getUpdate(DmuTicketVO vo) {
		return ticketDAO.update(vo);
	}
	@Override
	public int getDelete(String did) {
		return ticketDAO.delete(did);
	}
	@Override
	public int getTicketCount(String dcode) {
		return ticketDAO.ticketCount(dcode);
	}
	@Override
	public DmuTicketVO getContent(String did) {
		return ticketDAO.select(did);
	}

	/**
	 * calinder 달력 
	 */
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
	
	/*
	 * tag_page
	 */
	@Override
	public ArrayList<DmuTicketVO> getEventContent(String dcode ) {
		 
		return ticketDAO.getEventContent(dcode);
	}
	
	 
}
 
	
 
