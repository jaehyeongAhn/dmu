package com.museum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.museum.dao.DmuTagPageDAO;
import com.museum.vo.DmuTicketVO;

public class TagPageServiceImpl implements TagPageService {

	@Autowired
	private DmuTagPageDAO tagpageDao;
	
	
	@Override
	public ArrayList<DmuTicketVO> getLists2(String dcode, String dtarget) {
		ArrayList<DmuTicketVO> list = tagpageDao.selects2( dcode,dtarget);
		return list;
	}
	
	@Override
	public ArrayList<DmuTicketVO> learndayAll(String dcode, String dtarget) {
		ArrayList<DmuTicketVO> list = tagpageDao.learndayAll( dcode,dtarget);
		return list;
	}
	@Override
	public ArrayList<DmuTicketVO> learnday(String dcode, String day, String dtarget) {
		ArrayList<DmuTicketVO> list = tagpageDao.learnday( dcode,day,dtarget);
		return list;
	}

	@Override
	public ArrayList<DmuTicketVO> getLists( String dcode, String dtarget) {
		ArrayList<DmuTicketVO> list = tagpageDao.selects( dcode,dtarget);
		return list;
	}

	@Override
	public int getLearnCount(String dtarget) {
		return tagpageDao.learnCount(dtarget);
	}

	@Override
	public ArrayList<DmuTicketVO> getDayList1(String dcode, String day) {
		ArrayList<DmuTicketVO> list = tagpageDao.selectday1(dcode,day);
		return list;
	}
	@Override
	public ArrayList<DmuTicketVO> getDayList2(String dcode, String day) {
		ArrayList<DmuTicketVO> list = tagpageDao.selectday2(dcode,day);
		return list;
	}
	@Override
	public ArrayList<DmuTicketVO> getExhibitionList(String dcode) {
			ArrayList<DmuTicketVO> list =	tagpageDao.getExhibitionList(dcode);
			return list;
	}
	@Override
	public ArrayList<DmuTicketVO> getExhibitionList1(String dcode) {
			ArrayList<DmuTicketVO> list =	tagpageDao.getExhibitionList1(dcode);
			return list;
	}
	@Override
	public DmuTicketVO getExhibition() {
		return tagpageDao.exhibitionSelect();
	}
	/*
	 * tag_page
	 */
	@Override
	public ArrayList<DmuTicketVO> getEventContent(String dcode ) {
		 
		return tagpageDao.getEventContent(dcode);
	}
	@Override
	public ArrayList<DmuTicketVO> getDayList(String dcode, String day) {
		ArrayList<DmuTicketVO> list = tagpageDao.selectday(dcode,day);
		return list;
	}
	 
}