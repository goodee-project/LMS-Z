package gd.fintech.lms.teacher.restcontroller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.service.TeacherAttendanceService;
import gd.fintech.lms.vo.Attendance;

@RestController
public class TeacherAttendanceRestController {
	@Autowired TeacherAttendanceService teacherAttendanceService;
	
	@GetMapping("/teacher/attendanceListByNow")
	public Map<String, Object> attendanceListByNow(
			@RequestParam(value="lectureNo", required = false) int lectureNo){
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Calendar time = Calendar.getInstance();
		String attendanceDay = format1.format(time.getTime());
		
		String current[] = attendanceDay.split("-");
		String currentDayStr = current[2];
		int currentDay = 0;
		if(currentDayStr.substring(0) == "0") {
			currentDay = Integer.parseInt(currentDayStr.substring(1));
		} else {
			currentDay = Integer.parseInt(currentDayStr);
		}
		
		Map<String, Object> map = teacherAttendanceService.getAttendanceList(lectureNo, attendanceDay);
		
		map.put("attendanceDay", attendanceDay);
		map.put("currentDay", currentDay);
		return map;
	}
	
	//출석부 학생 목록 출력(일)
	@GetMapping("/teacher/attendanceListByDay")
	public Map<String, Object> attendanceList(
											@RequestParam(value = "lectureNo", required = false) int lectureNo, 
											@RequestParam(value = "currentYear", required = false) int currentYear, 
											@RequestParam(value = "currentMonth", required = false) int currentMonth, 
											@RequestParam(value = "currentDay", required = false) int currentDay){
			
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

		map.put("attendanceDay", attendanceDay);
		map.put("currentDay", currentDay);
			
		return map;
	}
}
