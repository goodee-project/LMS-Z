package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerClassroomService;
import gd.fintech.lms.vo.Classroom;

@Controller
public class ManagerClassroomController {
	@Autowired ManagerClassroomService managerClassroomService;
	//강의실 리스트 출력
	@GetMapping("/manager/classroomList")
	public String classroomList(Model model) {
		List<Classroom> classroomList = managerClassroomService.getClassroomList();
		model.addAttribute("classroomList",classroomList);
		return "/manager/classroomList";
	}
	//강의실 추가 폼
	@GetMapping("/manager/insertClassroom")
	public String insertClassroom() {
		return "/manager/insertClassroom";
	}
	//강의실 추가 액션
	@PostMapping
	public String insertClassroomAction(Classroom classroom) {
		
		return "redirect:/manager/classroomList";
	}
}
