package com.museum.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class EmailServiceImpl implements EmailService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	int check_code;

	//인증번호 난수 발생 (111111 ~ 999999)
	@Override
	public void getCode() {
		Random random = new Random();
		int code = random.nextInt(888888) + 111111;
		
		check_code = code;
	}
	
	//이메일 형식
	@Override
	public String emailForm(String email) {
		getCode();
		//호스트 이메일에 자신의 계정을 넣을 것! 자신의 계정(발신자)에서 String email(수신자)로 받은 사용자 이메일로 메시지가 전송됨.
		String fromMail = "호스트 이메일";
		String toMail = email;
		String title = "[D'MUSEUM] 인증 번호 입니다.";
		String content = "[D'MUSEUM] 홈페이지를 이용해주셔서 감사합니다.<br><br>"
				+ "요청하신 인증번호는 [" + check_code + "] 입니다.<br>"
				+ "인증번호 확인란에 정확하게 기입하여 주세요.";
		
		mailSend(fromMail, toMail, title, content);
		
		//숫자형을 문자형으로 변환(login_idfind.do에 반환)
		return Integer.toString(check_code);
	}
	
	//이메일 전송
	@Override
	public void mailSend(String fromMail, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(fromMail);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
