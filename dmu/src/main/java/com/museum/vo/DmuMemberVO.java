package com.museum.vo;

public class DmuMemberVO {
	//DB Column Name
	int rno;
	String did, pass, nationality, dname, gender, email, birth, pnumber, 
		zonecode, addr1, addr2, terms, older, consent, unregister, status, ddate;
	
	//View에서 넘어오는 name
	String email1, email2, pnum1, pnum2, pnum3, year, month, day;

	
	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		if(email == null) {
			return email1 + "@" + email2;
		}else {
			return email;			
		}
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		if(birth == null) {
			return year + "-" + month + "-" + day;
		}else {
			return birth;			
		}
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPnumber() {
		if(pnumber == null) {
			return pnum1 + "-" + pnum2 + "-" + pnum3;
		}else {
			return pnumber;			
		}
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	public String getZonecode() {
		return zonecode;
	}

	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getTerms() {
		return terms;
	}

	public void setTerms(String terms) {
		this.terms = terms;
	}

	public String getOlder() {
		return older;
	}

	public void setOlder(String older) {
		this.older = older;
	}

	public String getConsent() {
		return consent;
	}

	public void setConsent(String consent) {
		this.consent = consent;
	}

	public String getUnregister() {
		return unregister;
	}

	public void setUnregister(String unregister) {
		this.unregister = unregister;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getPnum1() {
		return pnum1;
	}

	public void setPnum1(String pnum1) {
		this.pnum1 = pnum1;
	}

	public String getPnum2() {
		return pnum2;
	}

	public void setPnum2(String pnum2) {
		this.pnum2 = pnum2;
	}

	public String getPnum3() {
		return pnum3;
	}

	public void setPnum3(String pnum3) {
		this.pnum3 = pnum3;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	
	
}
