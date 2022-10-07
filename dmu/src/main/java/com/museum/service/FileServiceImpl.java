package com.museum.service;

import java.io.File;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.museum.vo.DmuTicketVO;

public class FileServiceImpl {
	
	/**
	 * 티켓리스트 : 리스트 삭제 시 파일이 존재하면 삭제하기
	 */
	public void fileDelete(DmuTicketVO vo, HttpServletRequest request) throws Exception {
		if (vo.getDsfile() != null) {
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";

			File old_file = new File(path + vo.getDsfile());
			if (old_file.exists()) {
				old_file.delete();
			}
		}
	}

	/**
	 * 티켓리스트 : 파일이 있는 경우 update시 파일저장
	 */
	public void update_filesave(DmuTicketVO vo, HttpServletRequest request, String old_filename) throws Exception {
		// 새로운 파일을 upload 폴더에 저장
		if (!vo.getFile1().getOriginalFilename().equals("")) { // 새로운 파일선택 O
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			System.out.println(path);

			File file = new File(path + vo.getDsfile());
			vo.getFile1().transferTo(file);

			// 기존파일이 있는 경우에는 파일 삭제
			File ofile = new File(path + old_filename);
			if (ofile.exists()) {
				ofile.delete();
			}
		}
	}



	/**
	 * 티켓리스트 : 파일이 있는 경우 update시 파일체크
	 */
	public DmuTicketVO update_fileCheck(DmuTicketVO vo) {

		if (vo.getFile1() != null) {// 새로운 파일객체가 있는지 여부체크 하는 경우에는 null을 사용

			if (!vo.getFile1().getOriginalFilename().equals("")) { // 새로운 파일선택 O

				UUID uuid = UUID.randomUUID();

				vo.setDfile(vo.getFile1().getOriginalFilename());
				vo.setDsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
			}
		}
		return vo;
	}


	/**
	 * 티켓리스트 : 파일 upload 폴더에 저장
	 */
	public void fileSave(DmuTicketVO vo, HttpServletRequest request) throws Exception {
		// 2. upload 폴더에 nsfile 명으로 실제 파일 업로드 처리
		if (!vo.getFile1().getOriginalFilename().equals("")) {
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";

			File file = new File(path + vo.getDsfile());
			vo.getFile1().transferTo(file);
		}
	}

	 


}
