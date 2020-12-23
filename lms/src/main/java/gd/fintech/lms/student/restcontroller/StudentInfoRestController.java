package gd.fintech.lms.student.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.service.StudentInfoService;

@RestController
public class StudentInfoRestController {
	@Autowired StudentInfoService studentInfoService;
	
	// 마이페이지 이메일 중복체크
	@GetMapping("/student/myInfoByOverlapEmail")
	public Map<String, Object> getStudentAndStudentQueueByOverlapEmail(
			@RequestParam(value="studentEmail", required = false) String studentEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int studentEmailCheck = studentInfoService.getStudentAndStudentQueueByOverlapEmail(studentEmail);
		
		map.put("studentEmailCheck", studentEmailCheck);
		
		return map;
	}
	
	// Id와 Pw값을 가져와서 pw값이 맞는지 확인
	@GetMapping("/student/myInfoPwCheck")
	public Map<String, Object> getAccountByPw(
			@RequestParam(value="accountId") String accountId,
			@RequestParam(value="accountPw", required = false) String accountPw){
		
		//System.out.println(accountId);
		//System.out.println(accountPw);
		
		int accountPwCheck = studentInfoService.getAccountByPw(accountId, accountPw);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountPwCheck", accountPwCheck);
		
		return map;
	}
}
