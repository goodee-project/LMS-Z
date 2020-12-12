package gd.fintech.lms.teachercontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.teacherservice.LoginTeacherService;

@Controller
public class LoginTeacherController {
	@Autowired LoginTeacherService loginTeacherService;
	
	@GetMapping("/teacherLogin")
	public String login() {
		return "teacher/login";
	}
}
