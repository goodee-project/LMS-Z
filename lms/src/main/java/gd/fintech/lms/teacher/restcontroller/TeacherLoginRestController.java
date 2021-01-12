package gd.fintech.lms.teacher.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.service.TeacherLoginService;
import gd.fintech.lms.vo.Account;

@RestController
public class TeacherLoginRestController {
	@Autowired TeacherLoginService teacherLoginService;
	
	@GetMapping("/teacherLoginCheck")
	public Map<String, Object> teacherLoginCheck(
			@RequestParam(value="accountId", required = false) String accountId,
			@RequestParam(value="accountPw", required = false) String accountPw){
		Map<String, Object> map = new HashMap<String, Object>();
		
		Account account = new Account();
		account.setAccountId(accountId);
		account.setAccountPw(accountPw);
		
		String check = teacherLoginService.getAccountToTeacherLogin(account);
		map.put("check", check);
		return map;
	}
	
	// 아이디, 비밀번호 찾기
	@GetMapping("/teacherSearchToNameAndEmail")
	public Map<String, Object> getTeacherToNameAndEmailByCheck(
			@RequestParam(value="teacherName", required = false) String teacherName,
			@RequestParam(value="teacherEmail", required = false) String teacherEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int check = teacherLoginService.getTeacherToNameAndEmailByCheck(teacherName, teacherEmail);
		
		map.put("check", check);
		
		return map;
	}
	
	// 주소의 리스트를 json으로 출력
	@GetMapping("/teacherAddressSearch")
	public Map<String, Object> getAddressToSearch(
			@RequestParam(value="doro", required=false, defaultValue = "") String doro){
		
		return teacherLoginService.getAddressToSearch(doro);
	}
	
	// 아이디 중복 값 체크해서 json으로 츨력
	@GetMapping("/teacherOverlapId")
	public Map<String, Object> getAccountToSignupByOverlapId(
			@RequestParam(value="accountId", required=false) String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlapId = teacherLoginService.getAccountToSignupByOverlapId(accountId);
		
		map.put("overlapId", overlapId);
		
		return map;
	}
	
	// 이메일 중복 값 체크해서 json으로 출력
	@GetMapping("/teacherOverlapEmail")
	public Map<String, Object> getTeacherToSignupByOverLapEmail(
			@RequestParam(value="teacherEmail", required=false) String teacherEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlapEmail = teacherLoginService.getManagerToSignupByOverLapEmail(teacherEmail);
		
		map.put("overlapEmail", overlapEmail);
		
		return map;
	}
}
