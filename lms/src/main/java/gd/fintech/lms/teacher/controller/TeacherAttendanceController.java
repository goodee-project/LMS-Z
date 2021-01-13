package gd.fintech.lms.teacher.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.teacher.service.TeacherAttendanceService;
import gd.fintech.lms.vo.Attendance;

@Controller
public class TeacherAttendanceController {
	
	@Autowired TeacherAttendanceService teacherAttendanceService;
	
	@GetMapping("/teacher/modifyAttendanceOneBack")
	public String modifyAttendanceOneState(
			@PathVariable(value="lectureNo") int lectureNo,
			@PathVariable(value="attendanceDay") String attendanceDay) {
		
		String current[] = attendanceDay.split("-");
		int currentYear = Integer.parseInt(current[0]);
		String currentMonthStr = current[1];
		int currentMonth = 0;
		if(currentMonthStr.substring(0) == "0") {
			currentMonth = Integer.parseInt(currentMonthStr.substring(1));
		} else {
			currentMonth = Integer.parseInt(currentMonthStr);
		}
		String currentDayStr = current[2];
		int currentDay = 0;
		if(currentDayStr.substring(0) == "0") {
			currentDay = Integer.parseInt(currentDayStr.substring(1));
		} else {
			currentDay = Integer.parseInt(currentDayStr);
		}
		
		return "redirect:/teacher/attendanceMonth/" + lectureNo + "/" + currentYear + "/" + currentMonth + "?currentDay=" + currentDay;
	}
	
	@PostMapping("/teacher/modifyAttendanceOneState")
	public String modifyAttendanceOneState(Attendance attendance) {
		
		String attendanceDay = attendance.getAttendanceDay();
		
		String current[] = attendanceDay.split("-");
		int currentYear = Integer.parseInt(current[0]);
		String currentMonthStr = current[1];
		int currentMonth = 0;
		if(currentMonthStr.substring(0) == "0") {
			currentMonth = Integer.parseInt(currentMonthStr.substring(1));
		} else {
			currentMonth = Integer.parseInt(currentMonthStr);
		}
		String currentDayStr = current[2];
		int currentDay = 0;
		if(currentDayStr.substring(0) == "0") {
			currentDay = Integer.parseInt(currentDayStr.substring(1));
		} else {
			currentDay = Integer.parseInt(currentDayStr);
		}
				
		teacherAttendanceService.modifyAttendanceOneState(attendance);
		
		return "redirect:/teacher/attendanceMonth/" + attendance.getLectureNo() + "/" + currentYear + "/" + currentMonth + "?currentDay=" + currentDay;
	}
	
	@GetMapping("/teacher/modifyAttendance/{lectureNo}/{attendanceDay}/{accountIdList}")
	public String modifyAttendacne(
			@PathVariable(value="lectureNo") int lectureNo,
			@PathVariable(value="attendanceDay") String attendanceDay,
			@PathVariable(value="accountIdList") List<String> accountIdList) {
		
		
		Attendance attendance = new Attendance();
		attendance.setAccountIdList(accountIdList);
		attendance.setAttendanceDay(attendanceDay);
		attendance.setLectureNo(lectureNo);
		
		teacherAttendanceService.modifyAttendanceState(attendance);
		
		String current[] = attendanceDay.split("-");
		int currentYear = Integer.parseInt(current[0]);
		String currentMonthStr = current[1];
		int currentMonth = 0;
		if(currentMonthStr.substring(0) == "0") {
			currentMonth = Integer.parseInt(currentMonthStr.substring(1));
		} else {
			currentMonth = Integer.parseInt(currentMonthStr);
		}
		String currentDayStr = current[2];
		int currentDay = 0;
		if(currentDayStr.substring(0) == "0") {
			currentDay = Integer.parseInt(currentDayStr.substring(1));
		} else {
			currentDay = Integer.parseInt(currentDayStr);
		}
		
		return "redirect:/teacher/attendanceMonth/" + attendance.getLectureNo() + "/" + currentYear + "/" + currentMonth;
	}
	
	//출석부 달력(월)
	@GetMapping("/teacher/attendanceMonth/{lectureNo}/{currentYear}/{currentMonth}")
	public String attendanceMonth(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "currentYear") int currentYear, 
			@PathVariable(value = "currentMonth") int currentMonth,
			@RequestParam(value = "currentDay", defaultValue = "0") int currentDay) {
		
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
		model.addAttribute("lectureNo", lectureNo);
		model.addAttribute("currentDay", currentDay);
		
		
		return "teacher/attendanceMonth";
	}
	/*
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
		
		String attendanceDay = Integer.toString(targetDay.get(Calendar.YEAR));
		attendanceDay += "-";
		if(targetDay.get(Calendar.MONTH) + 1 < 10) {
			attendanceDay += "0";
			attendanceDay += Integer.toString(targetDay.get(Calendar.MONTH) + 1);
		} else {
			attendanceDay += Integer.toString(targetDay.get(Calendar.MONTH) + 1);
		}
		attendanceDay += "-";
		if(targetDay.get(Calendar.DATE) < 10) {
			attendanceDay += "0";
			attendanceDay += Integer.toString(targetDay.get(Calendar.DATE));
		} else {
			attendanceDay += Integer.toString(targetDay.get(Calendar.DATE));
		}

		Map<String, Object> map = teacherAttendanceService.getAttendanceList(lectureNo, attendanceDay);
		List<Attendance> attendanceList = (List)map.get("attendanceList");
		List<Attendance> attendanceYesList = (List)map.get("attendanceYesList");
		

		model.addAttribute("attendanceList", attendanceList);
		model.addAttribute("attendanceYesList", attendanceYesList);
		model.addAttribute("lectureNo", lectureNo);
		model.addAttribute("attendanceDay", attendanceDay);
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONTH) + 1);
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));
		
		return "teacher/attendanceList";
	}*/
	/*
	//출석부 학생 출석상태 수정 폼
	@GetMapping("/teacher/modifyAttendanceStateOne/{studentId}/{lectureNo}/{attendanceDay}/{currentYear}/{currentMonth}/{currentDay}")
	public String modifyAttendanceStateOne(Model model, @PathVariable(value = "studentId") String studentId, 
														@PathVariable(value = "lectureNo") int lectureNo, 
														@PathVariable(value = "attendanceDay") String attendanceDay) {
		
		Attendance attendanceStateList = teacherAttendanceService.getAttendanceStateOne(lectureNo, studentId, attendanceDay);
		List<Attendance> attendanceList = teacherAttendanceService.getAttendanceList(lectureNo, currentYear, currentMonth, currentDay);

		
		model.addAttribute("attendanceStateList", attendanceStateList);
		model.addAttribute("attendanceList", attendanceList);
		
		return "teacher/attendanceStateOne";
	}*/
	
	/*
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
	}*/
	

}
