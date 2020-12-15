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
	//학생 승인 거절시 작동하는 컨트롤러
	@GetMapping("/manager/deleteStudentQueue/{studentId}/{accountState}")
	public String deleteStudentQueue(@PathVariable(name = "studentId", required=true ) String studentId,
				@PathVariable(name = "accountState", required=true) String accountState) {
		memberQueueService.deleteStudentQueue(studentId, accountState);
		return "redirect:/manager/member";
	}
	//강사 승인 거절시 작동하는 컨트롤러
	@GetMapping("/manager/deleteTeacherQueue/{teacherid}/{accountState}")
	public String deleteTeacherQueue(@PathVariable(name="teacherId", required=true) String teacherId,
				@PathVariable(name = "accountState", required=true) String accountState) {
		memberQueueService.deleteTeacherQueue(teacherId, accountState);
		return "redirect:/manager/member";
	}
	//학생 승인 허가시 작동하는 컨트롤러
	@GetMapping("/manager/insertStudentQueue/{studentId}/{accountState}")
	public String insertStudentQueue(@PathVariable(name= "studentId", required=true ) String studentId,
				@PathVariable(name = "accountState", required=true) String accountState) {
		memberQueueService.insertStudent(studentId, accountState);
		return "redirect:/manager/member";
	}
	//강사 승인 허가시 작동하는 컨트롤러
	@GetMapping("/manager/insertTeacherQueue/{teacherId}/{accountState}")
	public String insertTeacherQueue(@PathVariable(name= "teacherId", required=true ) String teacherId,
				@PathVariable(name = "accountState", required=true) String accountState) {
		memberQueueService.insertTeacher(teacherId, accountState);
		return "redirect:/manager/member";
	}
}
