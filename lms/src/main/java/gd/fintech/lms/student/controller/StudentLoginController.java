package gd.fintech.lms.student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentLoginService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentForm;

@Controller
public class StudentLoginController {
	@Autowired StudentLoginService studentLoginService;
	
	// 아이디/비밀번호 찾기 페이지로 이동
	@GetMapping("/studentLoginSearch")
	public String studentLoginSearch() {
		return "student/loginSearch";
	}
	
	// 아이디/비밀번호 찾기 액션
	@PostMapping("/studentLoginSearch")
	public String studentLoginSearch(Student student) {
		studentLoginService.modifyAccountToPw(student);
		return "redirect:/studentLogin";
	}
	
	// 로그인 폼으로 이동
	@GetMapping("/studentLogin")
	public String login(HttpSession session) {
		//로그인 상태일 때 로그인 창으로 접근 방지
		if(session.getAttribute("studentId") != null) {
			return "redirect:/student/index";
		}
		return "student/login";
	}
	
	// 로그인 액션
	@PostMapping("/studentLogin")
	public String login(Account account, HttpServletRequest request) {
		if(studentLoginService.getAccountToStudentLogin(account) == null) {
			return "redirect:/studentLogin";
		} else if(studentLoginService.getAccountToStudentLogin(account).equals("중복")) {
			return "redirect:/studentLogin";
		}//휴면상태일 때 해제 인증 폼으로 이동 
		else if(studentLoginService.getAccountStateCk(account.getAccountId()).equals("휴면상태")) {
	  		return "redirect:/studentDormantRelease/"+account.getAccountId();
	  	}
		HttpSession session = request.getSession();
	    session.setAttribute("studentId", account.getAccountId());
	    
	    String studentImage = studentLoginService.getStudentImage(account.getAccountId());
	    session.setAttribute("studentImage", studentImage);
	   
		return "redirect:/student/index";
		
	}
	
	// 로그아웃
	@GetMapping("/student/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/studentLogin#";
	}
	
	// 회원가입 폼으로 이동
	@GetMapping("/studentSignup")
	public String signup() {
		return "student/signup";
	}
	
	// 회원가입 액션
	@PostMapping("/studentSignup")
	public String signup(StudentForm studentForm) {
		studentLoginService.addSignup(studentForm);
		
		return "redirect:/studentLogin";
	}
	
	// 휴면해제 인증 폼
	@GetMapping("/studentDormantRelease/{studentId}")
	public String dormantRealease(Model model,
			@PathVariable(name="studentId") String studentId) {
		model.addAttribute("studentId",studentId);
		return "/student/studentDormantRelease";
	}
	// 휴면해제 인증 성공
	@GetMapping("/studentDormantReleaseSuccess/{studentId}")
	public String login(HttpServletRequest request,
				@PathVariable(name="studentId") String studentId) {
		
		// 휴면 해제 인증 성공시 활성화 상태로 변경
		studentLoginService.modifyChangeActivity(studentId);
		
		HttpSession session = request.getSession();
	    session.setAttribute("studentId", studentId);
	    
	    String studentImage = studentLoginService.getStudentImage(studentId);
	    session.setAttribute("studentImage", studentImage);
	   
		return "redirect:/student/index";
		
	}
}













