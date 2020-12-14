package gd.fintech.lms.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.LoginManagerService;

@Controller
public class LoginManagerController {
	@Autowired LoginManagerService loginManagerService;
	
	@GetMapping("/managerLogin")
	public String login() {
		return "manager/login";
	}
	
	@GetMapping(value={"/manager", "/manager/index"})
	public String index() {
		return "manager/index";
	}
}
