package gd.fintech.lms.teacher.controller;

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

import gd.fintech.lms.teacher.service.TeacherLectureArchiveService;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureArchive;
import gd.fintech.lms.vo.LectureArchiveAddForm;


@Controller
public class TeacherLectureArchiveController {
	@Autowired TeacherLectureArchiveService teacherLectureArchiveService;
	
	@GetMapping("/teacher/lectureArchiveList/{accountId}/{currentPage}")
	public String listLectureArchive(Model model,
			@PathVariable(name="accountId")String accountId,
			@PathVariable(name="currentPage")int currentPage) {
		int rowPerPage=10;
		List<LectureArchive> lectureArchiveList = teacherLectureArchiveService.getLectureArchiveList(currentPage, rowPerPage, accountId);
		
		int listUnderPerPage = 10;	
		int listUnderFirstPage = currentPage - (currentPage % listUnderPerPage) + 1;
		int listUnderLastPage = listUnderFirstPage + listUnderPerPage - 1;
		
		if (currentPage % listUnderPerPage == 0 && currentPage != 0) {
			listUnderFirstPage = listUnderFirstPage - listUnderPerPage;
			listUnderLastPage = listUnderLastPage - listUnderPerPage;
		}
		
		int totalReport = teacherLectureArchiveService.listCountLectureArchive(accountId);
		int lastPage = totalReport/rowPerPage;
		if(totalReport % rowPerPage !=0) {
			lastPage +=1;
		}
		model.addAttribute("listUnderPerPage",listUnderPerPage);
		model.addAttribute("listUnderFirstPage",listUnderFirstPage);
		model.addAttribute("listUnderLastPage",listUnderLastPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("listCurrentPage",currentPage);
		model.addAttribute("lectureArchiveList",lectureArchiveList);
		return "/teacher/lectureArchiveList";
	}
	
	@GetMapping("/teacher/lectureArchiveAdd/{accountId}")
	public String addLectureArchive(Model model,
			@PathVariable(name="accountId")String accountId) {
		List<Lecture> lectureList = teacherLectureArchiveService.getLectureList(accountId);
		model.addAttribute("lectureList", lectureList);
		return "/teacher/lectureArchiveAdd";
	}
	
	@PostMapping("/teacher/lectureArchiveAdd")
	public String accLectureArchive(LectureArchiveAddForm lectureArchiveAddForm,
			@RequestParam(value="teacherId")String teacherId) {
		teacherLectureArchiveService.addLectureArchive(lectureArchiveAddForm);
		String title = lectureArchiveAddForm.getLectureArchiveTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		lectureArchiveAddForm.setLectureArchiveTitle(title);
		String content = lectureArchiveAddForm.getLectureArchiveContent().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		lectureArchiveAddForm.setLectureArchiveContent(content);
		return "redirect:/teacher/lectureArchiveList/"+teacherId+"/1";
	}
	
	@GetMapping("/teacher/lectureArchiveOne/{lectureArchiveNo}")
	public String oneLectureArchive(Model model,@PathVariable(name="lectureArchiveNo")int lectureArchiveNo) {
		LectureArchive lectureArchive = teacherLectureArchiveService.getLectureArchiveOne(lectureArchiveNo);
		model.addAttribute("lectureArchive", lectureArchive);
		return "/teacher/lectureArchiveListOne";
	}
	
	@GetMapping("/teacher/lectureArchiveModify/{accountId}/{lectureArchiveNo}")
	public String modifylectureArchive(Model model,
			@PathVariable(name="lectureArchiveNo")int lectureArchiveNo,
			@PathVariable(name="accountId")String accountId) {
		List<Lecture> lectureList = teacherLectureArchiveService.getLectureList(accountId);
		LectureArchive lectureArchive = teacherLectureArchiveService.getLectureArchiveOne(lectureArchiveNo);
		model.addAttribute("lectureArchive", lectureArchive);
		model.addAttribute("lectureList", lectureList);
		
		return "/teacher/lectureArchiveModify";
	}
	
	@PostMapping("/teacher/lectureArchiveModify/{lectureArchiveNo}")
	public String modifylectureArchive(LectureArchiveAddForm lectureArchiveAddForm,
			@PathVariable(name="lectureArchiveNo")int lectureArchiveNo) {
		teacherLectureArchiveService.updateLectureArchive(lectureArchiveAddForm);
		return "redirect:/teacher/lectureArchiveOne/"+lectureArchiveNo;
	}
	
	
	@GetMapping("/teacher/lectureArchiveOneFileRemove/{lectureArchiveFileUuid}")
	public String removeLectureArchiveOneFile(@PathVariable(name="lectureArchiveFileUuid")String lectureArchiveFileUuid) {
		teacherLectureArchiveService.deleteLectureArchiveOneFile(lectureArchiveFileUuid);
		return "redirect:/teacher/";
	}
	@GetMapping("/teacher/lectureArchiveRemove/{lectureArchiveNo}")
	public String removeLectureArchive(@PathVariable(name="lectureArchiveNo")int lectureArchiveNo) {
		teacherLectureArchiveService.deleteLectureArchive(lectureArchiveNo);
		System.out.println(lectureArchiveNo);
		return "redirect:/teacher/";
	}
	
	
	@GetMapping("/teacher/lectureArchiveFileDownload/{lectureArchiveFileUuid}")
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
