package gd.fintech.lms.operatorcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.operatorservice.LoginOperatorService;

@Controller
public class LoginOperatorController {
	@Autowired LoginOperatorService loginOperatorService;
	
	@GetMapping("/operatorLogin")
	public String login() {
		return "operator/login";
	}
}
