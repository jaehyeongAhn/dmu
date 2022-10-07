package com.museum.service;

import java.io.File;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.museum.vo.DmuTicketVO;

public class FileServiceImpl {
	
	/**
	 * Ƽ�ϸ���Ʈ : ����Ʈ ���� �� ������ �����ϸ� �����ϱ�
	 */
	public void fileDelete(DmuTicketVO vo, HttpServletRequest request) throws Exception {
		if (vo.getDsfile() != null) {
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "/resources/upload/";

			File old_file = new File(path + vo.getDsfile());
			if (old_file.exists()) {
				old_file.delete();
			}
		}
	}

	/**
	 * Ƽ�ϸ���Ʈ : ������ �ִ� ��� update�� ��������
	 */
	public void update_filesave(DmuTicketVO vo, HttpServletRequest request, String old_filename) throws Exception {
		// ���ο� ������ upload ������ ����
		if (!vo.getFile1().getOriginalFilename().equals("")) { // ���ο� ���ϼ��� O
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "/resources/upload/";
		

			File file = new File(path + vo.getDsfile());
			vo.getFile1().transferTo(file);

			// ���������� �ִ� ��쿡�� ���� ����
			File ofile = new File(path + old_filename);
			if (ofile.exists()) {
				ofile.delete();
			}
		}
	}



	/**
	 * Ƽ�ϸ���Ʈ : ������ �ִ� ��� update�� ����üũ
	 */
	public DmuTicketVO update_fileCheck(DmuTicketVO vo) {

		if (vo.getFile1() != null) {// ���ο� ���ϰ�ü�� �ִ��� ����üũ �ϴ� ��쿡�� null�� ���

			if (!vo.getFile1().getOriginalFilename().equals("")) { // ���ο� ���ϼ��� O

				UUID uuid = UUID.randomUUID();

				vo.setDfile(vo.getFile1().getOriginalFilename());
				vo.setDsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
			}
		}
		return vo;
	}


	/**
	 * Ƽ�ϸ���Ʈ : ���� upload ������ ����
	 */
	public void fileSave(DmuTicketVO vo, HttpServletRequest request) throws Exception {
		// 2. upload ������ nsfile ������ ���� ���� ���ε� ó��
		if (!vo.getFile1().getOriginalFilename().equals("")) {
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";

			File file = new File(path + vo.getDsfile());
			vo.getFile1().transferTo(file);
		}
	}

	
	/**
	 * Ƽ�ϸ���Ʈ : ���� üũ �� dfile, dsfile ����
	 */
	public DmuTicketVO fileCheck(DmuTicketVO vo) {
		// 1. vo��ü�� ����üũ �� dfile, dsfile�� ����Ǵ� �̸� ����
		if (vo.getFile1().getOriginalFilename().equals("")) {
			vo.setDfile("");
			vo.setDsfile("");
		} else {
			UUID uuid = UUID.randomUUID();
			vo.setDfile(vo.getFile1().getOriginalFilename());
			vo.setDsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
		}

		return vo;
	}// fileCheck

}
