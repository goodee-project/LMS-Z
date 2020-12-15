package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.MemberQueueService;
import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;

@Controller
public class MemberQueueController {
	@Autowired private MemberQueueService memberQueueService;
	//학생, 강사 대기상태인 리스트 출력
	@GetMapping("/manager/member")
	public String memberQueueList(Model model) {
		List<StudentQueue> studentList = memberQueueService.getStudentMemberQueueList();
		List<TeacherQueue> teacherList = memberQueueService.getTeacherMemberQueueList();
		model.addAttribute("studentList",studentList);
		model.addAttribute("teacherList",teacherList);
		System.out.println("******************");
		System.out.println(studentList);
		System.out.println(teacherList);
		return "/manager/member";
	}
	@GetMapping("/manager/deleteStudentQueue/{studentId}")
	public String deleteStudentQueue(@PathVariable(name = "studentId", required=true ) String studentId) {
		memberQueueService.deleteStudentQueue(studentId);
		return "redirect:/manager/member";
	}
}
