package gd.fintech.lms.admin.controller;


import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testesttest {
	@Autowired private JavaMailSender mailSender;
	
	@GetMapping("/testtest")
	public String test(){
		 String name = "byoungyoon";
	     String email = "bur5698@naver.com";
	     StringBuffer password = new StringBuffer();
	     Random rnd = new Random();
	     for (int i = 0; i < 13; i++) {
	         int rIndex = rnd.nextInt(3);
	         switch (rIndex) {
	         case 0:
	             // a-z
	        	 password.append((char) ((int) (rnd.nextInt(26)) + 97));
	             break;
	         case 1:
	             // A-Z
	        	 password.append((char) ((int) (rnd.nextInt(26)) + 65));
	             break;
	         case 2:
	             // 0-9
	        	 password.append((rnd.nextInt(10)));
	             break;
	         }
	     }
	             
	        try {
	            MimeMessage msg = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
	             
	            messageHelper.setSubject("LMS - " + name + "님 비밀번호 찾기 메일입니다.");
	            messageHelper.setText("비밀번호는 "+password+" 입니다.");
	            messageHelper.setTo(email);
	            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email));
	            mailSender.send(msg);
	             
	        }catch(MessagingException e) {
	            System.out.println("MessagingException");
	            e.printStackTrace();
	        }
	    
		return "redirect:/";
		
	}
}
