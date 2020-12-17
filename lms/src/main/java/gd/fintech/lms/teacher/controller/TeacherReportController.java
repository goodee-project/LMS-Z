package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherReportService;
import gd.fintech.lms.vo.Report;

@Controller
public class TeacherReportController {
	@Autowired TeacherReportService teacherReportService;
	
	//과제목록
	@GetMapping("/teacher/reportList")
	public String reportList(Model model) {
		
		List<Report> reportList = teacherReportService.getReportList();
		model.addAttribute("reportList", reportList);
		
		return "teacher/reportList";
	}
	
	//과제등록 폼
	@GetMapping("/teacher/addReport")
	public String addReport() {
		
		return "teacher/addReport";
	}
	
	//과제등록 액션
	@PostMapping("/teacher/addReport")
	public String addReport(Report report) {
		
		teacherReportService.addReport(report);
		
		return "redirect:/teacher/reportList";
	}
}
