package gd.fintech.lms.teacher.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.teacher.service.LoginTeacherService;

@Controller
public class LoginTeacherController {
	@Autowired LoginTeacherService loginTeacherService;
	
	@GetMapping("/teacherLogin")
	public String login() {
		return "teacher/login";
	}
	
	@GetMapping(value={"/teacher" ,"/teacher/index"})
	public String index() {
		return "teacher/index";
	}
}
