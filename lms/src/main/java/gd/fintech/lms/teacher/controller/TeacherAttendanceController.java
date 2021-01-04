package gd.fintech.lms.teacher.controller;

import java.util.Calendar;
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
	
	//출석부 달력(월)
	@GetMapping("/teacher/attendanceMonth/{lectureNo}/{currentYear}/{currentMonth}")
	public String attendanceMonth(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "currentYear") int currentYear, 
			@PathVariable(value = "currentMonth") int currentMonth) {
		
		Calendar currentDays = Calendar.getInstance();
	
		if (currentYear != -1 && currentMonth != -1) {
			if (currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			
			if (currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			
			currentDays.set(Calendar.YEAR, currentYear);
			
			currentDays.set(Calendar.MONTH, currentMonth - 1);
		}
		
		currentDays.set(Calendar.DATE, 1);
		currentYear = currentDays.get(Calendar.YEAR);
		currentMonth = currentDays.get(Calendar.MONTH) + 1;
		int lastDay = currentDays.getActualMaximum(Calendar.DATE);
		int firstDay = currentDays.get(Calendar.DAY_OF_WEEK);
		
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("firstDay", firstDay);
		
		
		return "teacher/attendanceMonth";
	}

	
	//출석부 학생 목록 출력(일)
	@GetMapping("/teacher/attendanceList/{lectureNo}/{currentYear}/{currentMonth}/{currentDay}")
	public String attendanceList(Model model, 
											@PathVariable(value = "lectureNo") int lectureNo, 
											@PathVariable(value = "currentYear") int currentYear, 
											@PathVariable(value = "currentMonth") int currentMonth, 
											@PathVariable(value = "currentDay") int currentDay){
		
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth - 1);
		targetDay.set(Calendar.DATE, currentDay);


		List<Attendance> attendanceList = teacherAttendanceService.getAttendanceList(lectureNo,
																						targetDay.get(Calendar.YEAR), 
																						targetDay.get(Calendar.MONTH) + 1, 
																						targetDay.get(Calendar.DATE));
		

		model.addAttribute("attendanceList", attendanceList);
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONTH) + 1);
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));
		
		return "teacher/attendanceList";
	}
	
	//출석부 학생 출석상태 수정 폼
	@GetMapping("/teacher/modifyAttendanceStateOne/{studentId}/{lectureNo}/{attendanceDay}/{currentYear}/{currentMonth}/{currentDay}")
	public String modifyAttendanceStateOne(Model model, @PathVariable(value = "studentId") String studentId, 
														@PathVariable(value = "lectureNo") int lectureNo, 
														@PathVariable(value = "attendanceDay") String attendanceDay,
														@PathVariable(value = "currentYear") int currentYear, 
														@PathVariable(value = "currentMonth") int currentMonth, 
														@PathVariable(value = "currentDay") int currentDay) {
		
		Attendance attendanceStateList = teacherAttendanceService.getAttendanceStateOne(lectureNo, studentId, attendanceDay);
		List<Attendance> attendanceList = teacherAttendanceService.getAttendanceList(lectureNo, currentYear, currentMonth, currentDay);

		
		model.addAttribute("attendanceStateList", attendanceStateList);
		model.addAttribute("attendanceList", attendanceList);
		
		return "teacher/attendanceStateOne";
	}
	
	//출석부 학생 출석상태 수정 액션
	@PostMapping("/teacher/modifyAttendanceStateOne/{studentId}/{lectureNo}/{attendanceDay}/{currentYear}/{currentMonth}/{currentDay}")
	public String modifyAttendanceStateOne(Attendance attendance, @PathVariable(value = "studentId") String studentId, 
																	@PathVariable(value = "lectureNo") int lectureNo, 
																	@PathVariable(value = "attendanceDay") String attendanceDay, 
																	@PathVariable(value = "currentYear") int currentYear, 
																	@PathVariable(value = "currentMonth") int currentMonth, 
																	@PathVariable(value = "currentDay") int currentDay) {
		
		teacherAttendanceService.modifyAttendanceState(attendance);
				
		return "redirect:/teacher/attendanceList/" + attendance.getLectureNo() + "/" + currentYear + "/" + currentMonth + "/" + currentDay;
	}
	

}
