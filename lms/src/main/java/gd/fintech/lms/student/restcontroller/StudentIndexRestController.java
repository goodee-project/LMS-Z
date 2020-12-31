package gd.fintech.lms.student.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerConnectService;
import gd.fintech.lms.student.service.StudentIndexService;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Report;

@RestController
public class StudentIndexRestController {
	@Autowired StudentIndexService studentIndexService;
	@Autowired ManagerConnectService managerConnectService;
	
	// 아래 조건을 만족하는 과제들을 json으로 출력
	@GetMapping("/student/getReport")
	public Map<String, Object> getReport(
			@RequestParam(value="studentId", required = false) String studentId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Report> reportList = studentIndexService.getReport(studentId);
		
		map.put("reportList", reportList);
		
		return map;
	}
	
	// 아래 조건을 만족하는 강좌들을 json으로 출력
	@GetMapping("/student/getLecture")
	public Map<String, Object> getLecture(
			@RequestParam(value="studentId", required = false) String studentId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Lecture> lectureList = studentIndexService.getLecture(studentId);
		map.put("lectureList", lectureList);
		
		return map;
	}
	
	// 아래 조건을 만족하는 방문자 수를 json으로 출력
	@GetMapping("/student/getConnectList")
	public Map<String, Object> getConnect(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> connectList = managerConnectService.getConnect();
		map.put("connectList", connectList);
		
		return map;
	}
}
