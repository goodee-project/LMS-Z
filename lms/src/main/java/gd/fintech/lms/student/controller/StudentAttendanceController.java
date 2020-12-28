package gd.fintech.lms.student.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentAttendanceService;
import gd.fintech.lms.student.service.StudentLectureService;
import gd.fintech.lms.vo.ClassRegistrationForm;

@Controller
public class StudentAttendanceController {
	@Autowired StudentAttendanceService studentAttendanceService;
	@Autowired StudentLectureService studentLectureService;
	
	@GetMapping("student/attendance/{studentId}/{lectureNo}/{currentPage}")
	public String attendance(Model model,
							@PathVariable(name="studentId") String studentId,
							@PathVariable(name="lectureNo") int lectureNo,
							@PathVariable(name="currentPage") int currentPage) {
		//오늘 날짜 출력
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = format.format(date);
		
		//출석,지각,조퇴,외출,결석 빈도를 체크하기 위해 service에서 불러오기
		int attendance = studentAttendanceService.getAttendanceTotal(studentId);
		int comLate = studentAttendanceService.getComLateTotal(studentId);
		int earlyLeave = studentAttendanceService.getEarlyLeaveTotal(studentId);
		int outing = studentAttendanceService.getOutingTotal(studentId);
		int absent = studentAttendanceService.getAbsentTotal(studentId);
		
		// 지각/조퇴/외출 3회는 결석 1회로 산정 (accumulate:누적)
		int accumulateAbsent = 0;
		if((comLate+earlyLeave+outing)/3 != 0) {
			int temp = (comLate+earlyLeave+outing)/3;
			accumulateAbsent = absent+temp;
		}
	
		
		//수강중인 강의의 총 일수 (주말 제외)
		ClassRegistrationForm myLectureListOne = studentLectureService.getMyLectureListOne(studentId, lectureNo);
		int totalLectureDays = studentAttendanceService.getTotalLectureDays(
									myLectureListOne.getLecture().getLectureStartdate(), 
									myLectureListOne.getLecture().getLectureEnddate(),
									lectureNo);
				
		//나의 출석률 %
		float attendancePer = 0;
		if(attendance != 0) {
			attendancePer = ((float)attendance/(float)totalLectureDays)*(float)100.0;
		}else {
			attendancePer=0;
		}
		
		//과정 진행률
		int lectureProgress = studentAttendanceService.getCommonLectureDays(
								myLectureListOne.getLecture().getLectureStartdate(), lectureNo);
		//과정 진행률 %
		float progressPer = 0;
		progressPer = ((float)lectureProgress/(float)totalLectureDays)*(float)100.0;
		
		model.addAttribute("myLectureListOne",myLectureListOne);
		model.addAttribute("today",today);
		model.addAttribute("attendance",attendance);
		model.addAttribute("comLate",comLate);
		model.addAttribute("earlyLeave",earlyLeave);
		model.addAttribute("outing",outing);
		model.addAttribute("absent",absent);
		model.addAttribute("totalLectureDays",totalLectureDays);
		//소수 첫째자리만 반올림
		model.addAttribute("attendancePer",String.format("%.1f", attendancePer));
		model.addAttribute("lectureProgress",lectureProgress);
		model.addAttribute("progressPer",String.format("%.1f", progressPer));
		model.addAttribute("accumulateAbsent",accumulateAbsent);
		
		return "student/attendance";
	}
}
