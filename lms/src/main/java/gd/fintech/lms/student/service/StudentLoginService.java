package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerForm;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentForm;

@Service
@Transactional
public class StudentLoginService {
	@Autowired StudentLoginMapper studentLoginMapper;
	@Autowired JavaMailSender mailSender;
	
	public int getStudentToNameAndEmailByCheck(String studentName, String studentEmail) {
		Student student = new Student();
		
		student.setStudentEmail(studentEmail);
		student.setStudentName(studentName);
		
		return studentLoginMapper.selectStudentToNameAndEmailByCheck(student);
	}
	
	// 아이디 패스워드 찾기
	public void modifyAccountToPw(Student student) {
		Student returnStudent = studentLoginMapper.selectStudentToNameAndEmail(student);
		if(returnStudent == null) {
			return;
		}
		
		StringBuffer accountPwBuffer = new StringBuffer();
		Random rnd = new Random();
	     for (int i = 0; i < 13; i++) {
	         int rIndex = rnd.nextInt(3);
	         switch (rIndex) {
	         case 0:
	        	 // a-z
		       	 accountPwBuffer.append((char) ((int) (rnd.nextInt(26)) + 97));
		         break;
	         case 1:
	             // A-Z
	        	 accountPwBuffer.append((char) ((int) (rnd.nextInt(26)) + 65));
	             break;
	         case 2:
	             // 0-9
	        	 accountPwBuffer.append((rnd.nextInt(10)));
	             break;
	         }
	     }
		     
	     String accountPw = accountPwBuffer.toString();
		     
	     try {
		     MimeMessage msg = mailSender.createMimeMessage();
		     MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
		             
		     messageHelper.setSubject("LMS - " + returnStudent.getStudentName() + "님 비밀번호 찾기 메일입니다.");
		     messageHelper.setText("아이디는 "+returnStudent.getStudentId()+" 입니다. \n 비밀밀번호는 "+accountPw+" 입니다.");
		     messageHelper.setTo(returnStudent.getStudentEmail());
		     msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(returnStudent.getStudentEmail()));
		     mailSender.send(msg);
	             
	     } catch(MessagingException e) {
	    	 e.printStackTrace();	     }

			studentLoginMapper.updateAccountToPw(returnStudent.getStudentId(), accountPw);
	}
	
	// 로그인 시 이미지 가져오기
	public String getStudentImage(String studentId) {
		return studentLoginMapper.selectStudentImage(studentId);
	}
	
	// 회원가입 주소 찾기 service
	public Map<String, Object> getAddressToSearch(String doro){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Address> addressList = studentLoginMapper.selectAddressToSearch(doro);
		map.put("addressList", addressList);
		
		return map;
	}
	
	// 회원가입하는 사람의 이메일 중복검사 service
	public int getStudentToSignupByOverLapEmail(String studentEmail) {
		return studentLoginMapper.selectStudentToSignupByOverLapEmail(studentEmail);
	}
	
	// 회원가입하는 사람의 아이디 중복검사 service
	public int getAccountToSignupByOverlapId(String accountId) {
		return studentLoginMapper.selectAccountToSignupByOverlapId(accountId);
	}
	
	// 로그인 액션
	public String getAccountToStudentLogin(Account account) {
		Connect connect = new Connect();
		connect.setAccountId(account.getAccountId());
		connect.setConnectState("접속");
		if(studentLoginMapper.selectConnectByOverlapLogin(connect) == 0) {
			account.setAccountLevel("학생");
			account.setAccountState("활성화");
			
			return studentLoginMapper.selectAccountToStudentLogin(account);
		}
		return "중복";
	}
	
	// 회원가입하는 mapper2개를 가져와 manager_queue와 account 순서로 insert실행
	public void addSignup(StudentForm studentForm) {
		studentForm.setAccountLevel("학생");
		studentForm.setAccountState("대기");
		
		studentForm.setStudentPhone(studentForm.getStudentPhone1()+studentForm.getStudentPhone2()+studentForm.getStudentPhone3());
			
		studentLoginMapper.insertstudentQueueToSignup(studentForm);
		studentLoginMapper.insertAccountToSignup(studentForm);
	}
}
