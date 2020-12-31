package gd.fintech.lms.teacher.service;

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

import gd.fintech.lms.teacher.mapper.TeacherLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.TeacherForm;

@Service
@Transactional
public class TeacherLoginService {
	@Autowired TeacherLoginMapper teacherLoginMapper;
	@Autowired JavaMailSender mailSender;
	
	// 아이디, 비밀번호 찾기
	public int getTeacherToNameAndEmailByCheck(String teacherName, String teacherEmail) {
		Teacher teacher = new Teacher();
		teacher.setTeacherEmail(teacherEmail);
		teacher.setTeacherName(teacherName);
		
		return teacherLoginMapper.selectTeacherToNameAndEmailByCheck(teacher);
	}
	
	// 아이디 패스워드 찾기
	public void modifyAccountToPw(Teacher teacher) {
		Teacher returnTeacher = teacherLoginMapper.selectTeacherToNameAndEmail(teacher);
		if(returnTeacher == null) {
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
		             
		     messageHelper.setSubject("LMS - " + returnTeacher.getTeacherName() + "님 비밀번호 찾기 메일입니다.");
		     messageHelper.setText("아이디는 "+returnTeacher.getTeacherId()+" 입니다. \n 비밀밀번호는 "+accountPw+" 입니다.");
		     messageHelper.setTo(returnTeacher.getTeacherEmail());
		     msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(returnTeacher.getTeacherEmail()));
		     mailSender.send(msg);
	             
	     } catch(MessagingException e) {
	    	 e.printStackTrace();	     }

			teacherLoginMapper.updateAccountToPw(returnTeacher.getTeacherId(), accountPw);
	}
	
	// 로그인 시 이미지 가져오기
	public String getTeacherImage(String teacherId) {
		return teacherLoginMapper.selectTeacherImage(teacherId);
	}
	
	// 회원가입하는 mapper2개를 가져와 manager_queue와 level 순서로 insert실행
	public void addSignup(TeacherForm teacherForm) {
		teacherForm.setAccountLevel("강사");
		teacherForm.setAccountState("대기");
		
		teacherForm.setTeacherPhone(teacherForm.getTeacherPhone1()+teacherForm.getTeacherPhone2()+teacherForm.getTeacherPhone3());
			
		teacherLoginMapper.insertTeacherQueueToSignup(teacherForm);
		teacherLoginMapper.insertAccountToSignup(teacherForm);
	}
	
	// 회원가입 주소 찾기 service
	public Map<String, Object> getAddressToSearch(String doro){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Address> addressList = teacherLoginMapper.selectAddressToSearch(doro);
		map.put("addressList", addressList);
		
		return map;
	}
	
	// 회원가입하는 사람의 이메일 중복검사 service
	public int getManagerToSignupByOverLapEmail(String teacherEmail) {
		return teacherLoginMapper.selectTeacherToSignupByOverLapEmail(teacherEmail);
	}
	
	// 회원가입하는 사람의 아이디 중복검사 service
	public int getAccountToSignupByOverlapId(String accountId) {
		return teacherLoginMapper.selectAccountToSignupByOverlapId(accountId);
	}
	
	// 로그인 액션
	public String getAccountToTeacherLogin(Account account) {
		Connect connect = new Connect();
		connect.setAccountId(account.getAccountId());
		connect.setConnectState("접속");
		if(teacherLoginMapper.selectConnectByOverlapLogin(connect) == 0) {
			account.setAccountLevel("강사");
			account.setAccountState("활성화");
			
			return teacherLoginMapper.selectAccountToTeacherLogin(account);
		}
		return "중복";
	}
}
