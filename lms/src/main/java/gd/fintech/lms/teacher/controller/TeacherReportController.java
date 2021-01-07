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
	@GetMapping("/teacher/reportList/{lectureNo}/{currentPage}")
	public String reportList(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 5;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage;
		int startPage = ((currentPage/11)*rowPerPage)+1;
		List<Report> reportList = teacherReportService.getReportList(lectureNo,beginRow,rowPerPage);
		int totalPage = teacherReportService.getReportCount(lectureNo);
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
	@GetMapping("/teacher/addReport/{lectureNo}/{currentPage}")
	public String addReport(Model model,
						@PathVariable(name="currentPage") int currentPage,
						@PathVariable(value = "lectureNo") int lectureNo) {
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lectureNo",lectureNo);
		return "teacher/addReport";
	}
	
	//과제등록 액션
	@PostMapping("/teacher/addReport/{lectureNo}/{currentPage}")
	public String addReport(Report report,
							@PathVariable(value = "lectureNo") int lectureNo,
							@PathVariable(value = "currentPage") int currentPage) {
		// db에 모든 html태그 접근 제한
		String title = report.getReportTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		report.setReportTitle(title);
		String content = report.getReportContent().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		report.setReportContent(content);
		teacherReportService.addReport(report);
		
		return "redirect:/teacher/reportList/" + lectureNo + "/" + currentPage;
	}
	
	//과제삭제
	@GetMapping("/teacher/removeReport/{lectureNo}/{reportNo}")
	public String removeReport(@PathVariable(value = "lectureNo") int lectureNo,
							@PathVariable(value = "reportNo") int reportNo) {
		
		teacherReportService.removeReport(reportNo);
		
		return "redirect:/teacher/reportList/" + lectureNo + "/1";
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
