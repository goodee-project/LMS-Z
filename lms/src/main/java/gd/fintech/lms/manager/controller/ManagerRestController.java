package gd.fintech.lms.manager.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerLoginService;

@RestController
public class ManagerRestController {
	@Autowired ManagerLoginService managerLoginService;
	
	@GetMapping("/manager/overlap")
	public Map<String, Object> getAccountToSignupByoverlap(String accountId, String accountEmail){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int overlap = managerLoginService.getAccountToSignupByoverlap(accountId, accountEmail);
		
		return map;
	}
}
