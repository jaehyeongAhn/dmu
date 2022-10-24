package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.museum.dao.DmuNoticeDAO;
import com.museum.vo.DmuNoticeVO;

public class NoticeServiceImpl implements NoticeService{

	
	
	@Autowired
	private DmuNoticeDAO noticeDAO;
	
	/*
	 * �������� �� �ο� ��
	 */
	@Override
	public int getTotalCount(){
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int dbCount = noticeDAO.totalCount();
		return dbCount;
	}
	
	/*
	 * �������� ����Ʈ
	 */
	@Override
	public ArrayList<DmuNoticeVO> getList(int startCount, int endCount){
		DmuNoticeDAO dao = new DmuNoticeDAO();
		ArrayList<DmuNoticeVO> list = noticeDAO.select(startCount, endCount);
		return list;
	}
	
	/*
	 * �������� �󼼺���
	 */
	@Override
	public DmuNoticeVO getContent(String nid) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		DmuNoticeVO vo = noticeDAO.select(nid);
		return vo;
	}
	
	/*
	 * �������� �۾���
	 */
	@Override
	public int getWriteResult(DmuNoticeVO vo) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = noticeDAO.insert(vo);
		return result;
	}
	
	/*
	 * �������� ����
	 */
	@Override
	public int getUpdateResult(DmuNoticeVO vo) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = noticeDAO.update(vo);
		return result;
	}
	
	/*
	 * �������� ���� 
	 */
	
	@Override
	public int getDeleteResult(String nid) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = noticeDAO.delete(nid);
		return result;
	}
	
	
	/*
	 * ī�װ�
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
	
	
	
	/*
	 * �˻����
	 */
	public ArrayList<DmuNoticeVO> noticeSearch(int startCount, int endCount, String keyword, String searchList){
		DmuNoticeDAO dao = new DmuNoticeDAO();
		ArrayList<DmuNoticeVO> slist = noticeDAO.noticeSearch(startCount, endCount, keyword, searchList);
		return slist;
	}
	
	public int getTotalCount_search(String keyword, String searchList) {
		DmuNoticeDAO dao = new DmuNoticeDAO();
		int result = noticeDAO.totalCount_search(keyword, searchList);
		return result;
	}
	
}
