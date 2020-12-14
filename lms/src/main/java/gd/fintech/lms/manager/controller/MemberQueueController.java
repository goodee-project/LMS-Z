package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.MemberQueueService;
import gd.fintech.lms.vo.Account;

@Controller
public class MemberQueueController {
	@Autowired private MemberQueueService memberQueueService;
	
	@GetMapping("/manager/member")
	public String memberQueueList(Model model) {
		List<Account> studentList = memberQueueService.getStudentMemberQueueList();
		List<Account> teacherList = memberQueueService.getTeacherMemberQueueList();
		model.addAttribute("studentList",studentList);
		model.addAttribute("teacherList",teacherList);
		System.out.println("******************");
		System.out.println(studentList);
		System.out.println(teacherList);
		return "/manager/member";
	}
	
}
