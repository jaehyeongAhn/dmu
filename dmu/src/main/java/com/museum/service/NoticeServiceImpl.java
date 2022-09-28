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
	 * �������� �� �ο� ��
	 */
	@Override
	public int getTotalCount(){
		return noticeDAO.totalCount();
	}
	
	/*
	 * �������� ����Ʈ
	 */
	@Override
	public ArrayList<DmuNoticeVO> getList(int startCount, int endCount){
		return noticeDAO.select(startCount, endCount);
	}
	
	/*
	 * �������� �󼼺���
	 */
	@Override
	public DmuNoticeVO getContent(String nid) {
		return noticeDAO.select(nid);
	}
	
	/*
	 * �������� �۾���
	 */
	@Override
	public int getWriteResult(DmuNoticeVO vo) {
		return noticeDAO.insert(vo);
	}
	
	/*
	 * �������� ����
	 */
	@Override
	public int getUpdateResult(DmuNoticeVO vo) {
		return noticeDAO.update(vo);
	}
	
	/*
	 * �������� ���� 
	 */
	
	@Override
	public int getDeleteResult(String nid) {
		return noticeDAO.delete(nid);
	}
	
	
	
}
