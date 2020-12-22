package gd.fintech.lms.teacher.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.service.TeacherInfoService;

@RestController
public class TeacherMyInfoRestController {
	@Autowired TeacherInfoService teacherInfoService;
	
	// 마이페이지 이메일 중복체크
	@GetMapping("/teacher/myInfoByOverlapEmail")
	public Map<String, Object> getTeacherAndTeacherQueueByOverlapEmail(
			@RequestParam(value="teacherEmail", required = false) String teacherEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int teacherEmailCheck = teacherInfoService.getTeacherAndTeacherQueueByOverlapEmail(teacherEmail);
		
		map.put("teacherEmailCheck", teacherEmailCheck);
		
		return map;
	}
	
	// Id와 Pw값을 가져와서 pw값이 맞는지 확인
	@GetMapping("/teacher/myInfoPwCheck")
	public Map<String, Object> getAccountByPw(
			@RequestParam(value="accountId") String accountId,
			@RequestParam(value="accountPw", required = false) String accountPw){
		
		//System.out.println(accountId);
		//System.out.println(accountPw);
		
		int accountPwCheck = teacherInfoService.getAccountByPw(accountId, accountPw);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountPwCheck", accountPwCheck);
		
		return map;
	}
}
