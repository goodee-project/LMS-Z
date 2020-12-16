package gd.fintech.lms.teacher.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherLoginService;
import gd.fintech.lms.vo.Account;

@Controller
public class TeacherLoginController {
	@Autowired TeacherLoginService teacherLoginService;
	
	@GetMapping("/teacherLogin")
	public String login() {
		return "teacher/login";
	}
	
	
	@PostMapping("/teacherLogin")
	public String login(Account account, HttpServletRequest request) {
		
		if(teacherLoginService.getAccountToTeacherLogin(account) == null) {
			return "redirect:/teacherLogin";
		}
		
		HttpSession session = request.getSession();
	    session.setAttribute("teacherId", account.getAccountId());
		
		return "teacher/index";
	}
	@GetMapping("/teacher/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/teacherLogin#";
	}
}
