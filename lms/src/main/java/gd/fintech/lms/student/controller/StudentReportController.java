package gd.fintech.lms.student.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import gd.fintech.lms.student.service.StudentReportService;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;
import gd.fintech.lms.vo.ReportSubmitAddForm;
import gd.fintech.lms.vo.Student;

@Controller
public class StudentReportController {
	@Autowired StudentReportService studentReportService;
	
	@GetMapping("/student/reportList/{accountId}/{currentPage}")
	public String listReport(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage=5;
		List<Report> reportList = studentReportService.getReportPage(currentPage,rowPerPage,accountId);
		
		int listUnderPerPage = 10;	
		int listUnderFirstPage = currentPage - (currentPage % listUnderPerPage) + 1;
		int listUnderLastPage = listUnderFirstPage + listUnderPerPage - 1;
		
		if (currentPage % listUnderPerPage == 0 && currentPage != 0) {
			listUnderFirstPage = listUnderFirstPage - listUnderPerPage;
			listUnderLastPage = listUnderLastPage - listUnderPerPage;
		}
		
		int totalReport = studentReportService.totalReport(accountId);
		int lastPage = totalReport/rowPerPage;
		if(totalReport % rowPerPage !=0) {
			lastPage +=1;
		}
	
		model.addAttribute("listUnderPerPage",listUnderPerPage);
		model.addAttribute("listUnderFirstPage",listUnderFirstPage);
		model.addAttribute("listUnderLastPage",listUnderLastPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("listCurrentPage",currentPage);
		model.addAttribute("reportList",reportList);
		return "/student/reportList";
	}
	
	@GetMapping("/student/reportOverdueList/{accountId}/{currentPage}")
	public String listOverdueReport(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage=5;
		List<Report> reportList = studentReportService.getOverdueReportPage(currentPage, rowPerPage, accountId);
		
		int overdueListUnderPerPage = 10;	
		int overdueListUnderFirstPage = currentPage - (currentPage % overdueListUnderPerPage) + 1;
		int overdueListUnderLastPage =  overdueListUnderFirstPage + overdueListUnderPerPage - 1;
		
		if (currentPage % overdueListUnderPerPage == 0 && currentPage != 0) {
			 overdueListUnderFirstPage = overdueListUnderFirstPage - overdueListUnderPerPage;
			 overdueListUnderLastPage = overdueListUnderLastPage - overdueListUnderPerPage;
		}
		
		int totalOverdueReport = studentReportService.totalOverdueReport(accountId);
		int lastOverduePage = totalOverdueReport/rowPerPage;
		if(totalOverdueReport % rowPerPage !=0) {
			lastOverduePage +=1;
		}
	
		model.addAttribute("overdueListUnderPerPage",overdueListUnderPerPage);
		model.addAttribute("overdueListUnderFirstPage",overdueListUnderFirstPage);
		model.addAttribute("overdueListUnderLastPage",overdueListUnderLastPage);
		model.addAttribute("lastOverduePage",lastOverduePage);
		model.addAttribute("OverdueListCurrentPage",currentPage);
		model.addAttribute("reportList",reportList);
		return "/student/reportOverdue";
	}
	
	@GetMapping("/student/reportOverdueSearch/{accountId}/{reportTitle}/{currentPage}")
	public String listOverdueReportSearch(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="reportTitle")String reportTitle,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage=5;
		List<Report> reportList = studentReportService.getOverdueReportSearch(currentPage, rowPerPage, accountId, reportTitle);
		
		int searchUnderPerPage = 10;	
		int searchUnderFirstPage = currentPage - (currentPage % searchUnderPerPage) + 1;
		int searchUnderLastPage = searchUnderFirstPage + searchUnderPerPage - 1;
		
		if (currentPage % searchUnderPerPage == 0 && currentPage != 0) {
			searchUnderFirstPage = searchUnderFirstPage - searchUnderPerPage;
			searchUnderLastPage = searchUnderLastPage - searchUnderPerPage;
		}
		
		int totalOverdueSearchReport = studentReportService.totalOverdueSearch(accountId, reportTitle);
		int lastOverdueSearchPage = totalOverdueSearchReport/rowPerPage;
		if(totalOverdueSearchReport % rowPerPage !=0) {
			lastOverdueSearchPage +=1;
		}
		model.addAttribute("searchUnderPerPage",searchUnderPerPage);
		model.addAttribute("searchUnderFirstPage",searchUnderFirstPage);
		model.addAttribute("searchUnderLastPage",searchUnderLastPage);
		model.addAttribute("lastOverdueSearchPage",lastOverdueSearchPage);
		model.addAttribute("OverdueSearchCurrentPage",currentPage);
		model.addAttribute("reportTitle",reportTitle);
		model.addAttribute("reportList",reportList);
		return "/student/reportOverdue";
	}
	
	@GetMapping("/student/reportSubmitAdd/{reportNo}/{accountId}")
	public String addReportSubmit(Model model,
			@PathVariable(name="reportNo")int reportNo,
			@PathVariable(name="accountId")String accountId) {
		Report report = studentReportService.getReportOne(reportNo);
		Student student = studentReportService.getStudentName(accountId);
		model.addAttribute("student", student);
		model.addAttribute("report", report);
		return "/student/reportSubmitAdd";
	}
	
	@PostMapping("/student/reportSubmitAdd")
	public String addReportSubmit(ReportSubmitAddForm reportSubmitAddForm) {
		// db에 모든 html태그 접근 제한
		String title = reportSubmitAddForm.getReportSubmitTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		reportSubmitAddForm.setReportSubmitTitle(title);
		String content = reportSubmitAddForm.getReportSubmitContent().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		reportSubmitAddForm.setReportSubmitContent(content);
		
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
	
	@PostMapping("/student/reportSubmitModify/{reportSubmitNo}/{reportNo}/{accountId}")
	public String modifyReportSubmit(ReportSubmitAddForm reportSubmitAddForm,
			@PathVariable(name="reportSubmitNo")int reportSubmitNo,
			@PathVariable(name="reportNo")int reportNo,
			@PathVariable(name="accountId")String accountId) {
		String title = reportSubmitAddForm.getReportSubmitTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		reportSubmitAddForm.setReportSubmitTitle(title);
		String content = reportSubmitAddForm.getReportSubmitContent().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		reportSubmitAddForm.setReportSubmitContent(content);
		studentReportService.updateReportSubmit(reportSubmitAddForm);
		return  "redirect:/student/reportSubmitOne/{reportNo}/{accountId}";
	}
	
	@GetMapping("student/reportSubmitOneFileRemove/{reportSubmitFileUuid}/{reportNo}/{accountId}")
	public String removeReportSubmitOneFile(@PathVariable(name="reportSubmitFileUuid")String reportSubmitFileUuid,
			@PathVariable(name="reportNo")int reportNo,
			@PathVariable(name="accountId")String accountId){
		studentReportService.deleteReportOneFile(reportSubmitFileUuid);
		return "redirect:/student/reportSubmitModify/{reportNo}/{accountId}";
	}
	
	@GetMapping("student/reportSubmitAllRemove")
	public String removeReportSubmitAll(@RequestParam(value="reportSubmitNo")int reportSubmitNo) {
		studentReportService.deleteReportAllSubmit(reportSubmitNo);
		return "redirect:/student";
	}
	
	@GetMapping("/student/reportSubmitFileCount/{reportSubmitFileUuid}")
	public String reportSubmitFileCountUp(@PathVariable(name="reportSubmitFileUuid")String reportSubmitFileUuid) {
		studentReportService.upCountReportFile(reportSubmitFileUuid);
		return "redirect:/student/reportSubmitFileDownload/{reportSubmitFileUuid}";
	}
	
	@GetMapping("/student/reportSubmitFileDownload/{reportSubmitFileUuid}")
	public ResponseEntity<byte[]> displayFile(@PathVariable(name="reportSubmitFileUuid")String fileName,HttpServletResponse response)throws Exception{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = "uploadfile\\reportfile\\";
		
		File f = new File(rootPath + attachPath + fileName);
		// 파일을 다운로드 받기 위한 스트림
		InputStream in = null;
		ResponseEntity<byte[]> entity= null;
				
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(f);
					
			// 다운로드 파일 컨텐트 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");
					
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			in.close();
		}
		return entity;
	}
	
}
