package com.museum.service;

import java.util.ArrayList;


import com.museum.dao.DmuTicketDAO;
import com.museum.vo.DmuTicketVO;

public class TicketServiceImpl implements TicketService {
	/**
	 *  �Խñ� ����
	 */
	@Override
	public int getWriteResult(DmuTicketVO vo) {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.insert(vo);
		return result;
	}
	//�Խñ� �ټ�
	@Override
	public int getTotalCount() {
		DmuTicketDAO dao = new DmuTicketDAO();
		int result = dao.totalCount();
		return result;
	}
	//�Խñ� ��ü��ȸ
	@Override
	public ArrayList<DmuTicketVO> getList(int startCount, int endCount) {
		DmuTicketDAO dao = new DmuTicketDAO();
		ArrayList<DmuTicketVO> list = dao.select(startCount, endCount);
		return list;
	}
	
}
