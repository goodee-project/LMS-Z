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
	@GetMapping("/manager/memberQueue/{currentPageS}/{currentPageT}")
	public String memberQueueList(Model model,
				@PathVariable(name = "currentPageS") int currentPageS,
				@PathVariable(name = "currentPageT") int currentPageT) {
		// page당 목록 갯수
		int rowPerPage = 2;
		// 시작 목록
		int beginRowS = (currentPageS-1)*rowPerPage; 
		int beginRowT = (currentPageT-1)*rowPerPage;
		List<StudentQueue> studentList = managerMemberQueueService.getStudentMemberQueueList(beginRowS,rowPerPage);
		int totalPageS = managerMemberQueueService.getStudentTotalCount();
		// 마지막 페이지
		int lastPageS = 0;
		if(totalPageS%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPageS = (totalPageS/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPageS = totalPageS/rowPerPage;
		}
		List<TeacherQueue> teacherList = managerMemberQueueService.getTeacherMemberQueueList(beginRowT,rowPerPage);
		int totalPageT = managerMemberQueueService.getTeacherTotalCount();
		// 마지막 페이지
		int lastPageT = 0;
		if(totalPageT%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPageT = (totalPageT/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPageT = totalPageT/rowPerPage;
		}

		model.addAttribute("studentList",studentList);
		model.addAttribute("teacherList",teacherList);
		model.addAttribute("currentPageS",currentPageS);
		model.addAttribute("currentPageT",currentPageT);
		model.addAttribute("lastPageS",lastPageS);
		model.addAttribute("lastPageT",lastPageT);
		//System.out.println(studentList);
		//System.out.println(teacherList);
		return "/manager/memberQueue";
	}
	//학생 승인 거절시 작동하는 컨트롤러
	@GetMapping("/manager/deleteStudentQueue/{studentId}/{accountState}/{currentPageS}/{currentPageT}")
	public String deleteStudentQueue(@PathVariable(name = "studentId", required=true ) String studentId,
				@PathVariable(name = "accountState", required=true) String accountState,
				@PathVariable(name = "currentPageS") int currentPageS,
				@PathVariable(name = "currentPageT") int currentPageT) {
		managerMemberQueueService.deleteStudentQueue(studentId, accountState);
		return "redirect:/manager/memberQueue/"+currentPageS+"/"+currentPageT;
	}
	//강사 승인 거절시 작동하는 컨트롤러
	@GetMapping("/manager/deleteTeacherQueue/{teacherId}/{accountState}/{currentPageS}/{currentPageT}")
	public String deleteTeacherQueue(@PathVariable(name="teacherId", required=true) String teacherId,
				@PathVariable(name = "accountState", required=true) String accountState,
				@PathVariable(name = "currentPageS") int currentPageS,
				@PathVariable(name = "currentPageT") int currentPageT) {
		managerMemberQueueService.deleteTeacherQueue(teacherId, accountState);
		return "redirect:/manager/memberQueue/"+currentPageS+"/"+currentPageT;
	}
	//학생 승인 허가시 작동하는 컨트롤러
	@GetMapping("/manager/insertStudentQueue/{studentId}/{accountState}/{managerId}/{currentPageS}/{currentPageT}")
	public String insertStudentQueue(@PathVariable(name= "studentId", required=true ) String studentId,
				@PathVariable(name = "accountState", required=true) String accountState,
				@PathVariable(name = "managerId", required=true) String managerId,
				@PathVariable(name = "currentPageS") int currentPageS,
				@PathVariable(name = "currentPageT") int currentPageT) {
		managerMemberQueueService.insertStudent(studentId, accountState, managerId);
		return "redirect:/manager/memberQueue/"+currentPageS+"/"+currentPageT;
	}
	//강사 승인 허가시 작동하는 컨트롤러
	@GetMapping("/manager/insertTeacherQueue/{teacherId}/{accountState}/{managerId}/{currentPageS}/{currentPageT}")
	public String insertTeacherQueue(@PathVariable(name= "teacherId", required=true ) String teacherId,
				@PathVariable(name = "accountState", required=true) String accountState,
				@PathVariable(name = "managerId", required=true) String managerId,
				@PathVariable(name = "currentPageS") int currentPageS,
				@PathVariable(name = "currentPageT") int currentPageT) {
		System.out.println(managerId);
		managerMemberQueueService.insertTeacher(teacherId, accountState, managerId);
		return "redirect:/manager/memberQueue/"+currentPageS+"/"+currentPageT;
	}
}
