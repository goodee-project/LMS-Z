package gd.fintech.lms.student.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
	
	@GetMapping("/student/reportOverdueList/{accountId}/{currentPage}")
	public String listOverdueReport(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage=5;
		List<Report> reportList = studentReportService.getOverdueReportPage(currentPage, rowPerPage, accountId);
		int totalOverdueReport = studentReportService.totalOverdueReport(accountId);
		int lastOverduePage = totalOverdueReport/rowPerPage;
		if(totalOverdueReport % rowPerPage !=0) {
			lastOverduePage +=1;
		}
		model.addAttribute("lastOverduePage",lastOverduePage);
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
	
	@GetMapping("/student/reportSubmitFileDownload/{reportSubmitFileUuid}")
	public ResponseEntity<byte[]> displayFile(@PathVariable(name="reportSubmitFileUuid")String fileName)throws Exception{
		String PATH ="C:\\Users\\git\\LMS-Z\\lms\\src\\main\\webapp\\uploadfile\\reportfile\\";
		// 파일을 다운로드 받기 위한 스트림
		InputStream in = null;
		ResponseEntity<byte[]> entity= null;
				
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(PATH + fileName);
					
			// 다운로드 파일 컨텐트 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			in.close();
		}
		return entity;
	}
	
}
