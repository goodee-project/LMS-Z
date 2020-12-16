package gd.fintech.lms.student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentLoginService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.StudentForm;

@Controller
public class StudentLoginController {
	@Autowired StudentLoginService studentLoginService;
	
	@GetMapping(value={"/student", "/student/index"})
	public String index() {
		return "student/index";
	}
	
	@GetMapping("/studentLogin")
	public String login() {
		return "student/login";
	}
	
	@PostMapping("/studentLogin")
	public String login(Account account, HttpServletRequest request) {
		if(studentLoginService.getAccountToStudentLogin(account) == null) {
			return "redirect:/studentLogin";
		}
		
		HttpSession session = request.getSession();
	    session.setAttribute("studentId", account.getAccountId());
		
		return "redirect:/student/index";
	}
	
	@GetMapping("/student/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/studentLogin#";
	}
	
	@GetMapping("/studentSignup")
	public String signup() {
		return "student/signup";
	}
	
	@PostMapping("/studentSignup")
	public String signup(StudentForm studentForm) {
		studentLoginService.addSignup(studentForm);
		
		return "redirect:/studentLogin";
	}
}













