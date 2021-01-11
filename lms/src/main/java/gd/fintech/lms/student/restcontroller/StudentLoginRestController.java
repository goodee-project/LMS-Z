package gd.fintech.lms.student.restcontroller;

import java.util.HashMap;

import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.service.StudentLoginService;

@RestController
public class StudentLoginRestController {
	@Autowired StudentLoginService studentLoginService;
	@Autowired JavaMailSender mailSender;
	// 아이디/ 비밀번호 찾기
	@GetMapping("/studentSearchToNameAndEmail")
	public Map<String, Object> getStudentToNameAndEmailByCheck(
			@RequestParam(value="studentName", required = false) String studentName,
			@RequestParam(value="studentEmail", required = false) String studentEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int check = studentLoginService.getStudentToNameAndEmailByCheck(studentName, studentEmail);
		
		map.put("check", check);
		
		return map;
	}
	
	// 주소의 리스트를 json으로 출력
	@GetMapping("/studentAddressSearch")
	public Map<String, Object> getAddressToSearch(
			@RequestParam(value="doro", required=false, defaultValue = "") String doro){
		
		return studentLoginService.getAddressToSearch(doro);
	}
		
	// 아이디 중복 값 체크해서 json으로 츨력
	@GetMapping("/studentOverlapId")
	public Map<String, Object> getAccountToSignupByOverlapId(
			@RequestParam(value="accountId", required=false) String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlapId = studentLoginService.getAccountToSignupByOverlapId(accountId);
			
		map.put("overlapId", overlapId);
			
		return map;
	}
		
	// 이메일 중복 값 체크해서 json으로 출력
	@GetMapping("/studentOverlapEmail")
	public Map<String, Object> getStudentToSignupByOverLapEmail(
			@RequestParam(value="studentEmail", required=false) String studentEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlapEmail = studentLoginService.getStudentToSignupByOverLapEmail(studentEmail);
			
		map.put("overlapEmail", overlapEmail);
			
		return map;
	}
	
	// 휴면계정 인증 번호 보내기
	@GetMapping("/studentDormantMsg/{studentId}")
	public int getStudentDormantMsg(HttpServletRequest request,
			@PathVariable(name="studentId") String studentId) {
		int dormantMsg = 0;
		dormantMsg = Integer.parseInt(studentLoginService.getDormantMsg(studentId));
		HttpSession session = request.getSession();
		session.setAttribute("dormantMsg", dormantMsg);
		return dormantMsg;
	}
}
