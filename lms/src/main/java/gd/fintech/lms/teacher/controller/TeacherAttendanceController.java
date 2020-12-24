package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherAttendanceService;
import gd.fintech.lms.vo.Attendance;

@Controller
public class TeacherAttendanceController {
	
	@Autowired TeacherAttendanceService teacherAttendanceService;
	
	//출석부 학생 목록 출력
	@GetMapping("/teacher/attendanceList/{lectureNo}")
	public String attendanceList(Model model, @PathVariable(value = "lectureNo") int lectureNo) {
		
		List<Attendance> attendanceList = teacherAttendanceService.getAttendanceList(lectureNo);
		model.addAttribute("attendanceList", attendanceList);
		
		return "teacher/attendanceList";
	}
	
	//출석부 학생 출석상태 수정 폼
	@GetMapping("/teacher/modifyAttendanceStateOne/{studentId}/{lectureNo}/{attendanceDay}")
	public String modifyAttendanceStateOne(Model model, @PathVariable(value = "studentId") String studentId, 
														@PathVariable(value = "lectureNo") int lectureNo, 
														@PathVariable(value = "attendanceDay") String attendanceDay) {
		
		List<Attendance> attendanceStateList = teacherAttendanceService.getAttendanceStateOne(lectureNo, studentId, attendanceDay);
		List<Attendance> attendanceList = teacherAttendanceService.getAttendanceList(lectureNo);
		model.addAttribute("attendanceStateList", attendanceStateList);
		model.addAttribute("attendanceList", attendanceList);
		
		return "teacher/attendanceStateOne";
	}
	
	//출석부 학생 출석상태 수정 액션
	@PostMapping("/teacher/modifyAttendanceStateOne/{studentId}/{lectureNo}/{attendanceDay}")
	public String modifyAttendanceStateOne(Attendance attendance, @PathVariable(value = "studentId") String studentId, 
																	@PathVariable(value = "lectureNo") int lectureNo, 
																	@PathVariable(value = "attendanceDay") String attendanceDay) {
		
		teacherAttendanceService.modifyAttendanceState(attendance);
				
		return "redirect:/teacher/attendanceList/" + attendance.getLectureNo();
	}

}
