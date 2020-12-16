package gd.fintech.lms.manager.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.ManagerMemberQueueService;
import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;

@Controller
public class ManagerMemberQueueController {
	@Autowired private ManagerMemberQueueService managerMemberQueueService;
	//학생, 강사 대기상태인 리스트 출력
	@GetMapping("/manager/member")
	public String memberQueueList(Model model) {
		List<StudentQueue> studentList = managerMemberQueueService.getStudentMemberQueueList();
		List<TeacherQueue> teacherList = managerMemberQueueService.getTeacherMemberQueueList();
		model.addAttribute("studentList",studentList);
		model.addAttribute("teacherList",teacherList);
		//System.out.println(studentList);
		
		//System.out.println(teacherList);
		return "/manager/member";
	}
	//학생 승인 거절시 작동하는 컨트롤러
	@GetMapping("/manager/deleteStudentQueue/{studentId}/{accountState}")
	public String deleteStudentQueue(@PathVariable(name = "studentId", required=true ) String studentId,
				@PathVariable(name = "accountState", required=true) String accountState) {
		managerMemberQueueService.deleteStudentQueue(studentId, accountState);
		return "redirect:/manager/member";
	}
	//강사 승인 거절시 작동하는 컨트롤러
	@GetMapping("/manager/deleteTeacherQueue/{teacherid}/{accountState}")
	public String deleteTeacherQueue(@PathVariable(name="teacherId", required=true) String teacherId,
				@PathVariable(name = "accountState", required=true) String accountState) {
		managerMemberQueueService.deleteTeacherQueue(teacherId, accountState);
		return "redirect:/manager/member";
	}
	//학생 승인 허가시 작동하는 컨트롤러
	@GetMapping("/manager/insertStudentQueue/{studentId}/{accountState}/{managerId}")
	public String insertStudentQueue(@PathVariable(name= "studentId", required=true ) String studentId,
				@PathVariable(name = "accountState", required=true) String accountState,
				@PathVariable(name = "managerId", required=true) String managerId) {
		managerMemberQueueService.insertStudent(studentId, accountState, managerId);
		return "redirect:/manager/member";
	}
	//강사 승인 허가시 작동하는 컨트롤러
	@GetMapping("/manager/insertTeacherQueue/{teacherId}/{accountState}/{managerId}")
	public String insertTeacherQueue(@PathVariable(name= "teacherId", required=true ) String teacherId,
				@PathVariable(name = "accountState", required=true) String accountState,
				@PathVariable(name = "managerId", required=true) String managerId) {
		System.out.println(managerId);
		managerMemberQueueService.insertTeacher(teacherId, accountState, managerId);
		return "redirect:/manager/member";
	}
}
