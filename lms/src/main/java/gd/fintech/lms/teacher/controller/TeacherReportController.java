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
	@GetMapping("/teacher/reportList/{teacherId}/{currentPage}")
	public String reportList(Model model, 
			@PathVariable(value = "teacherId") String teacherId,
			@PathVariable(value = "currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 5;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage;
		int startPage = ((currentPage/11)*rowPerPage)+1;
		List<Report> reportList = teacherReportService.getReportList(teacherId,beginRow,rowPerPage);
		int totalPage = teacherReportService.getReportCount(teacherId);
		// 마지막 페이지
		int lastPage = 0;
		if(totalPage%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (totalPage/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = totalPage/rowPerPage;
		}
		model.addAttribute("reportList", reportList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		
		return "teacher/reportList";
	}
	
	//과제등록 폼
	@GetMapping("/teacher/addReport")
	public String addReport() {
		
		return "teacher/addReport";
	}
	
	//과제등록 액션
	@PostMapping("/teacher/addReport/{teacherId}")
	public String addReport(Report report, @PathVariable(value = "teacherId") String teacherId) {
		
		teacherReportService.addReport(report);
		
		return "redirect:/teacher/reportList/" + teacherId;
	}
	
	//과제삭제
	@GetMapping("/teacher/removeReport/{reportNo}/{teacherId}")
	public String removeReport(@PathVariable(value = "reportNo") int reportNo, @PathVariable(value = "teacherId") String teacherId) {
		
		teacherReportService.removeReport(reportNo);
		
		return "redirect:/teacher/reportList/" + teacherId;
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
