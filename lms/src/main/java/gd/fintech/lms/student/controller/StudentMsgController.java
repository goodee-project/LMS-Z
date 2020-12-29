package gd.fintech.lms.student.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentMsgService;
import gd.fintech.lms.vo.Msg;

@Controller
public class StudentMsgController {
	@Autowired StudentMsgService studentMsgService;
	
	//메세지에 필요한 변수 가져오기
	@GetMapping("/student/msgToFrom/{studentId}/{studentName}/{teacher_Id}/{lectureNo}/{currentPage}")
	public String msgToFrom(Model model,
							@PathVariable(name="studentId") String studentId,
							@PathVariable(name="studentName") String studentName,
							@PathVariable(name="teacher_Id") String teacher_Id,
							@PathVariable(name="lectureNo") int lectureNo,
							@PathVariable(name="currentPage") int currentPage) {
		model.addAttribute("studentId",studentId);
		model.addAttribute("studentName",studentName);
		model.addAttribute("teacher_Id",teacher_Id);
		model.addAttribute("lectureNo",lectureNo);
		model.addAttribute("currentPage",currentPage);
		return "student/msgToFrom";
	}
}
