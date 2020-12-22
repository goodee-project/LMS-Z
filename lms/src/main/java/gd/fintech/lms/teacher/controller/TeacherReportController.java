package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherReportService;
import gd.fintech.lms.vo.Report;

@Controller
public class TeacherReportController {
	@Autowired TeacherReportService teacherReportService;
	
	//과제목록
	@GetMapping("/teacher/reportList/{teacherId}")
	public String reportList(Model model, @PathVariable(value = "teacherId") String teacherId) {
		
		List<Report> reportList = teacherReportService.getReportList(teacherId);
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
	
	//과제삭제
	@GetMapping("/teacher/removeReport/{reportNo}")
	public String removeReport(@PathVariable(value = "reportNo") int reportNo) {
		
		teacherReportService.removeReport(reportNo);
		
		return "redirect:/teacher/reportList";
	}
	
	//과제 상세보기
	@GetMapping("/teacher/reportOne/{reportNo}")
	public String reportOne(Model model, @PathVariable(value = "reportNo") int reportNo) {
		
		Report reportOne = teacherReportService.getReportOne(reportNo);
		model.addAttribute("reportOne", reportOne);
		
		return "teacher/reportOne";
	}
	
	//과제수정 폼
	@GetMapping("/teacher/modifyReport/{reportNo}")
	public String modifyReport(Model model, @PathVariable(value = "reportNo") int reportNo) {
		
		Report reportOne = teacherReportService.getReportOne(reportNo);
		model.addAttribute("reportOne", reportOne);
		
		return "teacher/modifyReport";
	}
	
	//과제수정 액션
	@PostMapping("/teacher/modifyReport/{reportNo}")
	public String modifyReport(Report report) {
		
		teacherReportService.modifyReport(report);
		
		return "redirect:/teacher/reportOne/"+report.getReportNo();
	}
	
}
