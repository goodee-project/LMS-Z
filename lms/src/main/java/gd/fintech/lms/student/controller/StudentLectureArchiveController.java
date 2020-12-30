package gd.fintech.lms.student.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

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

import gd.fintech.lms.student.service.StudentLectureArchiveService;
import gd.fintech.lms.vo.LectureArchive;

@Controller
public class StudentLectureArchiveController {
	@Autowired StudentLectureArchiveService studentLectureArchiveService;
	
	@GetMapping("/student/lectureArchiveList/{accountId}")
	public String listLectureArchive(Model model, @PathVariable(name="accountId")String accountId) {
		List<LectureArchive> lectureArchive = studentLectureArchiveService.getLectureArchiveList(accountId);
		model.addAttribute("lectureArchive",lectureArchive);
		return "/student/lectureArchiveList";
	}
	
	@GetMapping("/student/lectureArchiveOne/{lectureArchiveNo}")
	public String oneLectureArchive(Model model,@PathVariable(name="lectureArchiveNo")int lectureArchiveNo) {
		LectureArchive lectureArchive = studentLectureArchiveService.getLectureArchiveOne(lectureArchiveNo);
		model.addAttribute("lectureArchive", lectureArchive);
		return "/student/lectureArchiveListOne";
	}
	
	@GetMapping("/student/lectureArchiveFileDownload/{lectureArchiveFileUuid}")
	public ResponseEntity<byte[]> displayFile(@PathVariable(name="lectureArchiveFileUuid")String fileName,HttpServletResponse response)throws Exception{
		String PATH ="C:\\Users\\박연원\\git\\LMS-Z\\lms\\src\\main\\webapp\\uploadfile\\questionfile\\";
		// 파일을 다운로드 받기 위한 스트림
		InputStream in = null;
		ResponseEntity<byte[]> entity= null;
				
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(PATH + fileName);
							
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
