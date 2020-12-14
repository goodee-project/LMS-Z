package gd.fintech.lms.studentcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.studentservice.LoginStudentService;

@Controller
public class LoginStudentController {
	@Autowired LoginStudentService loginStudentService;
	
	@GetMapping("/studentLogin")
	public String login() {
		return "student/login";
	}
	
	@GetMapping("/student/index")
	public String index() {
		return "student/index";
	}
}
