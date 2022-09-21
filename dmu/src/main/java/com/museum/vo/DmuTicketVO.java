package com.museum.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class DmuTicketVO {
	
	int rno,dpersonnel,dnum, dprice;
	String did, dtitle, dstart, dend ,dplace, dinformation,dtime,dfile,dsfile,dcode,dtarget;
	
	CommonsMultipartFile file1;
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}
	public String getDcode() {
		return dcode;
	}
	public String getDtarget() {
		return dtarget;
	}
	public void setDtarget(String dtarget) {
		this.dtarget = dtarget;
	}
	public void setDcode(String dcode) {
		this.dcode = dcode;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getDpersonnel() {
		return dpersonnel;
	}
	public void setDpersonnel(int dpersonnel) {
		this.dpersonnel = dpersonnel;
	}

	
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}

	public String getDtitle() {
		return dtitle;
	}
	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}
	public String getDstart() {
		return dstart;
	}
	public void setDstart(String dstart) {
		this.dstart = dstart;
	}
	public String getDend() {
		return dend;
	}
	public void setDend(String dend) {
		this.dend = dend;
	}
	
	public int getDprice() {
		return dprice;
	}
	public void setDprice(int dprice) {
		this.dprice = dprice;
	}
	public String getDplace() {
		return dplace;
	}
	public void setDplace(String dplace) {
		this.dplace = dplace;
	}
	public String getDinformation() {
		return dinformation;
	}
	public void setDinformation(String dinformation) {
		this.dinformation = dinformation;
	}
	
	public String getDtime() {
		return dtime;
	}
	public void setDtime(String dtime) {
		this.dtime = dtime;
	}
	public String getDfile() {
		return dfile;
	}
	public void setDfile(String dfile) {
		this.dfile = dfile;
	}
	public String getDsfile() {
		return dsfile;
	}
	public void setDsfile(String dsfile) {
		this.dsfile = dsfile;
	}
	
	
 
}



