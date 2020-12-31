package gd.fintech.lms.manager.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerLoginService;

@RestController
public class ManagerLoginRestController {
	@Autowired ManagerLoginService managerLoginService;
	
	// 아이디, 패스워드 체크
	@GetMapping("/managerSearchToNameAndEmail")
	public Map<String, Object> getManagerToNameAndEmailByCheck(
			@RequestParam(value="managerName", required = false) String managerName,
			@RequestParam(value="managerEmail", required = false) String managerEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int check = managerLoginService.getManagerToNameAndEmailByCheck(managerName, managerEmail);
		
		map.put("check", check);
		
		return map;
	}
	
	// 주소의 리스트를 json으로 출력
	@GetMapping("/managerAddressSearch")
	public Map<String, Object> getAddressToSearch(
			@RequestParam(value="doro", required=false, defaultValue = "") String doro){
		
		return managerLoginService.getAddressToSearch(doro);
	}
		
	// 아이디 중복 값 체크해서 json으로 츨력
	@GetMapping("/managerOverlapId")
	public Map<String, Object> getAccountToSignupByOverlapId(
			@RequestParam(value="accountId", required=false) String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlapId = managerLoginService.getAccountToSignupByOverlapId(accountId);
			
		map.put("overlapId", overlapId);
			
		return map;
	}
		
	// 이메일 중복 값 체크해서 json으로 출력
	@GetMapping("/managerOverlapEmail")
	public Map<String, Object> getManagerToSignupByOverLapEmail(
			@RequestParam(value="managerEmail", required=false) String managerEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlapEmail = managerLoginService.getManagerToSignupByOverLapEmail(managerEmail);
			
		map.put("overlapEmail", overlapEmail);
			
		return map;
	}
}
