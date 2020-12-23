package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.ManagerMemberService;
import gd.fintech.lms.vo.Account;

@Controller
public class ManagerMemberController {
	@Autowired ManagerMemberService managerMemberService;
	
	//활성화된 학생, 강사 리스트 출력
	@GetMapping("/manager/memberList/{currentPage}")
	public String memberList(Model model, 
			@PathVariable(name="currentPage") int currentPage) {
		List<Account> memberList = managerMemberService.getTeacherAndStudentList();
		model.addAttribute("memberList",memberList);
		return "/manager/memberList";
	}
}
