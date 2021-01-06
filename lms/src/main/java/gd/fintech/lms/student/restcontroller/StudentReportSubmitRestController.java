package gd.fintech.lms.student.restcontroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentReportSubmitRestService;

@RestController
public class StudentReportSubmitRestController {
	@Autowired StudentReportSubmitRestService studentReportSubmitRestService;
	
	//학생 과제 제출 빈도 및 강의별 과제 총 수
	@GetMapping("/chart/reportSubmit/{studentId}")
	public Map<String, Object> reportSubmit(@PathVariable(name="studentId") String studentId){
		return studentReportSubmitRestService.getReportSubmit(studentId);
	}
}
