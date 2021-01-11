package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherReportSubmitService;
import gd.fintech.lms.vo.ReportSubmit;

@Controller
public class TeacherReportSubmitController {
	
	@Autowired TeacherReportSubmitService teacherReportSubmitService;
	
	//과제제출목록
	@GetMapping("/teacher/reportSubmitList/{reportNo}")
	public String reportSubmitList(Model model, @PathVariable(value = "reportNo") int reportNo) {
		
		List<ReportSubmit> reportSubmitList = teacherReportSubmitService.getReportSubmit(reportNo);
		model.addAttribute("reportSubmitList", reportSubmitList);
		
		return "redirect:/teacher/reportSubmitList";
	}
	
	//과제제출 상세보기
	@GetMapping("/teacher/reportSubmitOne/{reportSubmitNo}")
	public String reportSubmitOne(Model model, @PathVariable(value = "reportSubmitNo") int reportSubmitNo) {
		
		ReportSubmit reportSubmitOne = teacherReportSubmitService.getReportSubmitOne(reportSubmitNo);
		model.addAttribute("reportSubmitOne", reportSubmitOne);
		
		return "teacher/reportSubmitOne";
	}
	
	@PostMapping("/teacher/modifyReportSubmit")
	public String PostReportSubmit(ReportSubmit reportSubmit) {
		
		teacherReportSubmitService.modifyReportSubmit(reportSubmit);
		
		return "redirect:/teacher/reportSubmitOne/" + reportSubmit.getReportSubmitNo();
	}
}
