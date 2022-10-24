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
	public ArrayList<DmuTicketVO> getLists( String dcode,String dtarget) {
		ArrayList<DmuTicketVO> list = ticketDAO.listdtarget(dcode,dtarget);
		return list;
	}
	@Override
	public ArrayList<DmuTicketVO> getList( String dcode) {
		ArrayList<DmuTicketVO> list = ticketDAO.listdcode( dcode);
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
	 * calendar 달력 
	 */
	@Override
	public int getInsertDate(DmuReJoinVO vo) {
		return ticketDAO.insertDate(vo);
	}
	@Override
	public String ridNew() {
		return ticketDAO.ridNew();
	}
	@Override
	public int getreservationdatePay(DmuReJoinVO vo) {
		return ticketDAO.getreservationdatePay(vo);
	}
	@Override
	public String pidNew() {
		return ticketDAO.pidNew();
	}
	@Override
	public int getTicketinfo(DmuReJoinVO vo) {
		return ticketDAO.getTicketinfo(vo);
	}

	 
	@Override
	public DmuReJoinVO getcompletecontent(String mid) {
		return ticketDAO.selectCompleteCheck(mid);
	}
	
 
 
}
 
	
 
