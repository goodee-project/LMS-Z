package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherAttendanceService;
import gd.fintech.lms.vo.Attendance;

@Controller
public class TeacherAttendanceController {
	
	@Autowired TeacherAttendanceService teacherAttendanceService;
	
	@GetMapping("/teacher/attendanceList/{lectureNo}")
	public String attendanceList(Model model, @PathVariable(value = "lectureNo") int lectureNo) {
		
		Attendance attendanceList = teacherAttendanceService.getAttendanceList(lectureNo);
		model.addAttribute("attendanceList", attendanceList);
		
		return "teacher/attendanceList";
	}

}
