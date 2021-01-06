package gd.fintech.lms.manager.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.LmsStatsRestService;

@RestController
public class LmsStatsRestController {
	@Autowired LmsStatsRestService lmsStateRestService;
	//연도별 강사 가입 수 / 탈퇴 수
	@GetMapping("/chart/teacherInOutCount")
	public List<Map<String, Object>> teacherInOutCount(){
		return lmsStateRestService.getTeacherInOutCount();
	}
	//연도별 학생 가입 수 / 탈퇴 수 
	@GetMapping("/chart/studentInOutCount")
	public List<Map<String, Object>> studentInOutCount(){
		return lmsStateRestService.getStudentInOutCount();
	}
	//전체 강사와 학생의 lms이용자 수
	@GetMapping("/chart/teacherAndStudentCount")
	public Map<String, Object> teacherAndStudentCount(){
		return lmsStateRestService.getTeacherAndStudentCount();
	}
}
