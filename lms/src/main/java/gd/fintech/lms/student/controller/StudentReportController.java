package gd.fintech.lms.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.student.service.StudentReportService;
import gd.fintech.lms.vo.Report;

@Controller
public class StudentReportController {
	@Autowired StudentReportService studentReportService;
	
	@GetMapping("/student/reportList/{currentPage}")
	public String listReport(Model model,
			@PathVariable(name="currentPage",required=true)int currentPage,
			@RequestParam(name="accountId")String accountId) {
		int rowPerPage = 10;
		List<Report> reportList = studentReportService.getReportPage(currentPage, rowPerPage, accountId);

		int countReport = 10;
		int lastPage = countReport / rowPerPage;
		if(countReport % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("reportList", reportList);
		return "/student/reportList";
	}
}
