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
import gd.fintech.lms.vo.LectureArchive;

@Controller
public class StudentLectureArchiveController {
	@Autowired StudentLectureArchiveService studentLectureArchiveService;
	
	@GetMapping("/student/lectureArchiveList/{accountId}/{currentPage}")
	public String listLectureArchive(Model model, 
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage=1;
		List<LectureArchive> lectureArchive = studentLectureArchiveService.getLectureArchiveList(currentPage, rowPerPage, accountId);
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
		return "/student/lectureArchiveList";
	}
	
	@GetMapping("/student/lectureArchiveCountUp/{lectureArchiveNo}")
	public String CountUplectureArchive(@PathVariable(name="lectureArchiveNo")int lectureArchiveNo) {
		studentLectureArchiveService.upCountLectureArchive(lectureArchiveNo);
		return "redirect:/student/lectureArchiveOne/{lectureArchiveNo}";
	}
	
	@GetMapping("/student/lectureArchiveOne/{lectureArchiveNo}")
	public String oneLectureArchive(Model model,@PathVariable(name="lectureArchiveNo")int lectureArchiveNo) {
		LectureArchive lectureArchive = studentLectureArchiveService.getLectureArchiveOne(lectureArchiveNo);
		model.addAttribute("lectureArchive", lectureArchive);
		return "/student/lectureArchiveListOne";
	}
	
	@GetMapping("/student/lectureArchiveFileDownload/{lectureArchiveFileUuid}")
	public ResponseEntity<byte[]> displayFile(@PathVariable(name="lectureArchiveFileUuid")String fileName,HttpServletResponse response)throws Exception{
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = "uploadfile\\lectureArchivefile\\";
		
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
