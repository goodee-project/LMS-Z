package gd.fintech.lms.managercontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.managerservice.LoginManagerService;

@Controller
public class LoginManagerController {
	@Autowired LoginManagerService loginManagerService;
	
	@GetMapping("/managerLogin")
	public String login() {
		return "manager/login";
	}
}
