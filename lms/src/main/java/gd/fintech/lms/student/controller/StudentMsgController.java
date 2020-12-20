package gd.fintech.lms.student.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentMsgService;
import gd.fintech.lms.vo.Msg;

@Controller
public class StudentMsgController {
	@Autowired StudentMsgService studentMsgService;
	
	/*
	//강사님께 메세지 보내기
	@PostMapping("/student/toTeacherMsg/{lectureNo}/{currentPage}")
	public String toTeacherMsg(Msg msg,
							@PathVariable(name="lectureNo") int lectureNo,
							@PathVariable(name="currentPage") int currentPage) {
		studentMsgService.addToteacherMsg(msg);
		return "redirect:/student/myLectureListOne/"+msg.getFromId()+"/"+msg.getToId()+"/"+lectureNo+"/"+currentPage;
	}
	*/
}
