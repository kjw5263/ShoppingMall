package com.member.action;

import javax.mail.internet.MimeMessage;
import java.util.Properties;
import javax.mail.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.internet.InternetAddress;
import email.GoogleAuthentication;
import email.random;

public class emailSendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		//랜덤 생성 된 인증번호
		random r = new random();
		String content = r.randomNum();
		
		session.setAttribute("content", content);
		String contentKey = (String)session.getAttribute("content");
		String receiver_mail = (String)session.getAttribute("userEmail");
		
			System.out.println(receiver_mail);
			System.out.println(contentKey);
		
		response.setContentType("text/html;charset=UTF-8");
		String senderEmail="cosshopping29@gmail.com"; //보내는 사람 (쇼핑몰 메일주소)
		String subject =  "JUST SKIN 회원가입 인증메일입니다."; //보내는 제목
		
		
		try {
			//보낼 이메일 정보를 담을 객체
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host","smtp.gmail.com");
			properties.put("mail.smtp.auth","true");
			properties.put("mail.smtp.port","587");
			
			Authenticator auth = new GoogleAuthentication();
			
			Session s = Session.getDefaultInstance(properties, auth);
			Message message = new MimeMessage(s);
			Address sender_address = new InternetAddress(senderEmail);
			Address user_mail_address = new InternetAddress(receiver_mail);
			message.setHeader("content-type", "text/html;charset=UTF-8");
			message.setFrom(sender_address);
			message.setReplyTo(new Address[]{sender_address});
			message.addRecipient(Message.RecipientType.TO, user_mail_address);
			message.setSubject(subject);
			message.setContent("인증번호를 회원가입창에서 입력해주세요"+"<br>"+"인증 번호는 "+contentKey+" 입니다.","text/html;charset=UTF-8");
			message.setSentDate(new java.util.Date());
			message.saveChanges();
			Transport.send(message);
			
		} catch (Exception e) {
			System.out.println("SMTP 서버가 잘못설정되었거나 서비스에 문제가 있습니다.");
			e.printStackTrace();
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./emailKeyCheck.me");
		forward.setRedirect(true);
	
		
		return forward;
	}

	
	
	
	
}
