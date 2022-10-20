package com.museum.vo;

import java.util.List;

public class DmuPurchaseVO {
	
	int rno, rtotal;
	
	//RESERVATION
	String rid, did, rdate, rcheck, mid;
	String rokdate, rfaildate;
	int rprice, rallprice;
	
	//PAYINFO
	String pid, pcoin, pdate;
	int pallprice;
	
	//TICKET VO
	DmuTicketVO ticketVo;
	
	//Reservation TABLE
	List<DmuPurchaseTicketVO> ticketList;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getRtotal() {
		return rtotal;
	}

	public void setRtotal(int rtotal) {
		this.rtotal = rtotal;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRcheck() {
		return rcheck;
	}

	public void setRcheck(String rcheck) {
		this.rcheck = rcheck;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getRokdate() {
		return rokdate;
	}

	public void setRokdate(String rokdate) {
		this.rokdate = rokdate;
	}

	public String getRfaildate() {
		return rfaildate;
	}

	public void setRfaildate(String rfaildate) {
		this.rfaildate = rfaildate;
	}

	public int getRprice() {
		return rprice;
	}

	public void setRprice(int rprice) {
		this.rprice = rprice;
	}

	public int getRallprice() {
		return rallprice;
	}

	public void setRallprice(int rallprice) {
		this.rallprice = rallprice;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPcoin() {
		return pcoin;
	}

	public void setPcoin(String pcoin) {
		this.pcoin = pcoin;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public int getPallprice() {
		return pallprice;
	}

	public void setPallprice(int pallprice) {
		this.pallprice = pallprice;
	}

	public DmuTicketVO getTicketVo() {
		return ticketVo;
	}

	public void setTicketVo(DmuTicketVO ticketVo) {
		this.ticketVo = ticketVo;
	}

	public List<DmuPurchaseTicketVO> getTicketList() {
		return ticketList;
	}

	public void setTicketList(List<DmuPurchaseTicketVO> ticketList) {
		this.ticketList = ticketList;
	}
	
	
}
