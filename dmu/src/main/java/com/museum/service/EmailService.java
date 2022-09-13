package com.museum.service;

public interface EmailService {
	void getCode();					//인증번호 난수 발생
	String emailForm(String email);	//이메일 형식
	void mailSend(String fromMail, String toMail, String title, String content);
}
