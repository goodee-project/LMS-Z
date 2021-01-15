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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import gd.fintech.lms.student.service.StudentLectureArchiveService;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureArchive;

@Controller
public class StudentLectureArchiveController {
	@Autowired StudentLectureArchiveService studentLectureArchiveService;
	private static String OS = System.getProperty("os.name").toLowerCase();
	
	@GetMapping("/student/lectureArchiveList/{accountId}/{currentPage}")
	public String listLectureArchive(Model model, 
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage=5;
		List<LectureArchive> lectureArchive = studentLectureArchiveService.getLectureArchiveList(currentPage, rowPerPage, accountId);
		List<Lecture> lectureList = studentLectureArchiveService.getLectureList(accountId);
		int listUnderPerPage = 10;	
		int listUnderFirstPage = currentPage - (currentPage % listUnderPerPage) + 1;
		int listUnderLastPage = listUnderFirstPage + listUnderPerPage - 1;
		
		if (currentPage % listUnderPerPage == 0 && currentPage != 0) {
			listUnderFirstPage = listUnderFirstPage - listUnderPerPage;
			listUnderLastPage = listUnderLastPage - listUnderPerPage;
		}
		
		int totalArchive = studentLectureArchiveService.listCountLectureArchive(accountId);
		int lastPage = totalArchive/rowPerPage;
		if(totalArchive % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("listUnderPerPage",listUnderPerPage);
		model.addAttribute("listUnderFirstPage",listUnderFirstPage);
		model.addAttribute("listUnderLastPage",listUnderLastPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("listCurrentPage",currentPage);
		model.addAttribute("lectureArchive",lectureArchive);
		model.addAttribute("lectureList",lectureList);
		return "/student/lectureArchiveList";
	}
	
	@GetMapping("/student/lectureSearchArchive/{accountId}/{lectureNo}/{currentPage}")
	public String searchLectureArchiveLecture(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="lectureNo")int lectureNo,
			@PathVariable(name="currentPage")int currentPage) {
		
		int rowPerPage=5;
		List<LectureArchive> lectureArchive = studentLectureArchiveService.getLectureArchiveSearchLecture(currentPage, rowPerPage, lectureNo, accountId);
		List<Lecture> lectureList = studentLectureArchiveService.getLectureList(accountId);
		int searchLectureCount = studentLectureArchiveService.searchCountLecture(accountId, lectureNo);
		int searchLectureUnderPerPage = 10;	
		int searchLectureUnderFirstPage = currentPage - (currentPage % searchLectureUnderPerPage) + 1;
		int searchLectureUnderLastPage = searchLectureUnderFirstPage + searchLectureUnderPerPage - 1;
		
		if (currentPage % searchLectureUnderPerPage == 0 && currentPage != 0) {
			searchLectureUnderFirstPage = searchLectureUnderFirstPage - searchLectureUnderPerPage;
			searchLectureUnderLastPage = searchLectureUnderLastPage - searchLectureUnderPerPage;
		}
		
		int lastPage = searchLectureCount/rowPerPage;
		if(searchLectureCount % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("searchLectureUnderPerPage",searchLectureUnderPerPage);
		model.addAttribute("searchLectureUnderFirstPage",searchLectureUnderFirstPage);
		model.addAttribute("searchLectureUnderLastPage",searchLectureUnderLastPage);
		model.addAttribute("searchLectureLastPage",lastPage);
		model.addAttribute("searchLectureCurrentPage",currentPage);
		model.addAttribute("lectureArchive",lectureArchive);
		model.addAttribute("lectureList",lectureList);
		model.addAttribute("lectureNO",lectureNo);
		return "/student/lectureArchiveList";
	}
	
	@GetMapping("/student/lectureArchiveSearch/{accountId}/{lectureArchiveTitle}/{currentPage}")
	public String searchLectureArchive(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="lectureArchiveTitle")String lectureArchiveTitle,
			@PathVariable(name="currentPage")int currentPage) {
		
		int rowPerPage=5;
		List<LectureArchive> lectureArchive = studentLectureArchiveService.getLectureArchiveSearchList(currentPage, rowPerPage, accountId, lectureArchiveTitle);
		int searchCount = studentLectureArchiveService.searchCountLectureArchive(accountId, lectureArchiveTitle);
		int searchUnderPerPage = 10;	
		int searchUnderFirstPage = currentPage - (currentPage % searchUnderPerPage) + 1;
		int searchUnderLastPage = searchUnderFirstPage + searchUnderPerPage - 1;
		
		if (currentPage % searchUnderPerPage == 0 && currentPage != 0) {
			searchUnderFirstPage = searchUnderFirstPage - searchUnderPerPage;
			searchUnderLastPage = searchUnderLastPage - searchUnderPerPage;
		}
		
		int lastPage = searchCount/rowPerPage;
		if(searchCount % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("searchUnderPerPage",searchUnderPerPage);
		model.addAttribute("searchUnderFirstPage",searchUnderFirstPage);
		model.addAttribute("searchUnderLastPage",searchUnderLastPage);
		model.addAttribute("searchLastPage",lastPage);
		model.addAttribute("searchCurrentPage",currentPage);
		model.addAttribute("lectureArchiveTitle",lectureArchiveTitle);
		model.addAttribute("lectureArchive",lectureArchive);
		return "/student/lectureArchiveList";
	}
	
	@GetMapping("/student/lectureArchiveCountUp/{lectureArchiveNo}")
	public String CountUplectureArchive(@PathVariable(name="lectureArchiveNo")int lectureArchiveNo) {
		studentLectureArchiveService.upCountLectureArchive(lectureArchiveNo);
		return "redirect:/student/lectureArchiveOne/{lectureArchiveNo}";
	}
	
	@GetMapping("/student/lectureArchiveFileCountUp/{lectureArchiveFileUuid}")
	public String CountUplectureArchiveFile(@PathVariable(name="lectureArchiveFileUuid")String lectureArchiveFileUuid) {
		studentLectureArchiveService.upCountLectureArchiveFile(lectureArchiveFileUuid);
		return "redirect:/student/lectureArchiveFileDownload/{lectureArchiveFileUuid}";
	}
	
	@GetMapping("/student/lectureArchiveOne/{lectureArchiveNo}")
	public String oneLectureArchive(Model model,@PathVariable(name="lectureArchiveNo")int lectureArchiveNo) {
		LectureArchive lectureArchive = studentLectureArchiveService.getLectureArchiveOne(lectureArchiveNo);
		model.addAttribute("lectureArchive", lectureArchive);
		return "/student/lectureArchiveListOne";
	}
	
	@GetMapping("/student/lectureArchiveFileDownload/{lectureArchiveFileUuid}")
	public ResponseEntity<byte[]> displayFile(@PathVariable(name="lectureArchiveFileUuid")String fileName,HttpServletResponse response)throws Exception{
		
		String rootPath = "";
		
		String attachPath = "";
		
		 if ( OS.indexOf("nux") >= 0) {
	        	rootPath = "/var/lib/tomcat9/webapps/lms/";
	        	attachPath = "uploadfile/lectureArchivefile/";
	        } else {
	            File file = new File("");
	            rootPath =  file.getAbsolutePath() + "\\src\\main\\webapp\\";
	            attachPath = "uploadfile\\lectureArchivefile\\";
	        }
		
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
