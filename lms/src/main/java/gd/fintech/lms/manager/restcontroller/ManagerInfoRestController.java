package gd.fintech.lms.manager.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerInfoService;

@RestController
public class ManagerInfoRestController {
	@Autowired ManagerInfoService managerInfoService;
	
	// 마이페이지 이메일 중복체크
	@GetMapping("/manager/myInfoByOverlapEmail")
	public Map<String, Object> getManagerAndmanagerQueueByOverlapEmail(
			@RequestParam(value="managerEmail", required = false) String managerEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int managerEmailCheck = managerInfoService.getManagerAndManagerQueueByOverlapEmail(managerEmail);
		
		map.put("managerEmailCheck", managerEmailCheck);
		
		return map;
	}
	
	// Id와 Pw값을 가져와서 pw값이 맞는지 확인
	@GetMapping("/manager/myInfoPwCheck")
	public Map<String, Object> getAccountByPw(
			@RequestParam(value="accountId") String accountId,
			@RequestParam(value="accountPw", required = false) String accountPw){
		
		//System.out.println(accountId);
		//System.out.println(accountPw);
		
		int accountPwCheck = managerInfoService.getAccountByPw(accountId, accountPw);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountPwCheck", accountPwCheck);
		
		return map;
	}
}
