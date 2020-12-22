package gd.fintech.lms.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.student.service.StudentReportService;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;
import gd.fintech.lms.vo.ReportSubmitAddForm;

@Controller
public class StudentReportController {
	@Autowired StudentReportService studentReportService;
	
	@GetMapping("/student/reportList/{accountId}/{currentPage}")
	public String listReport(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage=5;
		List<Report> reportList = studentReportService.getReportPage(currentPage,rowPerPage,accountId);
		int totalReport = studentReportService.totalReport(accountId);
		int lastPage = totalReport/rowPerPage;
		if(totalReport % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("reportList",reportList);
		return "/student/reportList";
	}
	
	@GetMapping("/student/reportSubmitAdd/{reportNo}")
	public String addReportSubmit(Model model,
			@PathVariable(name="reportNo")int reportNo) {
		Report report = studentReportService.getReportOne(reportNo);
		model.addAttribute("report", report);
		return "/student/reportSubmitAdd";
	}
	
	@PostMapping("/student/reportSubmitAdd")
	public String addReportSubmit(ReportSubmitAddForm reportSubmitAddForm) {
		studentReportService.addReportSubmit(reportSubmitAddForm);
		return "redirect:/student";
	}
	
	@GetMapping("/student/reportSubmitOne/{reportNo}/{accountId}")
	public String listReportSubmitOne(Model model,
			@PathVariable(name="reportNo")int reportNo,
			@PathVariable(name="accountId")String accountId) {
		ReportSubmit reportSubmit = studentReportService.getReportSubmitOne(reportNo, accountId);
		Report report = studentReportService.getReportOne(reportNo);
		model.addAttribute("report", report);
		model.addAttribute("reportSubmit",reportSubmit);
		return "/student/reportSubmitOne"; 
	}
	
	@GetMapping("/student/reportSubmitModify/{reportNo}/{accountId}")
	public String modifyReportSubmit(Model model,
			@PathVariable(name="reportNo")int reportNo,
			@PathVariable(name="accountId")String accountId) {
		ReportSubmit reportSubmit = studentReportService.getReportSubmitOne(reportNo, accountId);
		Report report = studentReportService.getReportOne(reportNo);
		model.addAttribute("report", report);
		model.addAttribute("reportSubmit",reportSubmit);
		return "/student/reportSubmitModify"; 
	}
	
	@PostMapping("/student/reportSubmitModify")
	public String modifyReportSubmit(ReportSubmitAddForm reportSubmitAddForm,
			@RequestParam(value="reportSubmitNo")int reportSubmitNo) {
		studentReportService.updateReportSubmit(reportSubmitAddForm);
		return  "redirect:/student";
	}
	
	@GetMapping("student/reportSubmitOneFileRemove/{reportSubmitFileUuid}")
	public String removeReportSubmitOneFile(@PathVariable(name="reportSubmitFileUuid")String reportSubmitFileUuid){
		studentReportService.deleteReportOneFile(reportSubmitFileUuid);
		return "redirect:/student";
	}
	
	@GetMapping("student/reportSubmitAllRemove")
	public String removeReportSubmitAll(@RequestParam(value="reportSubmitNo")int reportSubmitNo) {
		studentReportService.deleteReportAllSubmit(reportSubmitNo);
		return "redirect:/student";
	}
	
}
