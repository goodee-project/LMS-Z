package gd.fintech.lms.manager.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerLoginService;

@RestController
public class ManagerRestController {
	@Autowired ManagerLoginService managerLoginService;
	
	@GetMapping("/managerAddressSearch")
	public Map<String, Object> getAddressToSearch(
			@RequestParam(value="doro", required=false, defaultValue = "") String doro,
			@RequestParam(value="currentPage", required=false, defaultValue = "1") int currentPage){
		
		return managerLoginService.getAddressToSearch(doro, currentPage);
	}
	
	@GetMapping("/managerOverlapId")
	public Map<String, Object> getAccountToSignupByOverlapId(
			@RequestParam(value="accountId", required=false) String accountId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlapId = managerLoginService.getAccountToSignupByOverlapId(accountId);
		
		map.put("overlapId", overlapId);
		
		return map;
	}
	
	@GetMapping("/managerOverlapEmail")
	public Map<String, Object> getManagerToSignupByOverLapEmail(
			@RequestParam(value="managerEmail", required=false) String managerEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlapEmail = managerLoginService.getManagerToSignupByOverLapEmail(managerEmail);
		
		map.put("overlapEmail", overlapEmail);
		
		return map;
	}
}
