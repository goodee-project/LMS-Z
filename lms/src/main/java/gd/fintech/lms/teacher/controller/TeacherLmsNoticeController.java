package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherLmsNoticeService;
import gd.fintech.lms.vo.LmsNotice;

@Controller
public class TeacherLmsNoticeController {
	
	@Autowired TeacherLmsNoticeService teacherLmsNoticeService;
	
	//공지사항 목록
	@GetMapping("/teacher/lmsNoticeList/{currentPage}")
	public String lmsNoticeList(Model model,
										@PathVariable(value = "currentPage") int currentPage) {
		
		//페이징에 필요한 변수선언
		int rowPerPage = 5;
		int beginRow = (currentPage - 1) * rowPerPage;
		int lastPage = 0;
		int totalCount = teacherLmsNoticeService.getLmsNoticeCount();
		
		//마지막 페이지
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		}else {
			lastPage = totalCount / rowPerPage + 1;
		}
		
		List<LmsNotice> lmsNoticeList = teacherLmsNoticeService.getLmsNoticeList(beginRow, rowPerPage);
		model.addAttribute("lmsNoticeList", lmsNoticeList);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		
		return "teacher/lmsNoticeList";
	}
	
	//공지사항 상세보기
	@GetMapping("/teacher/lmsNoticeOne/{lmsNoticeNo}/{currentPage}")
	public String lmsNoticeOne(Model model, @PathVariable(value = "lmsNoticeNo") int lmsNoticeNo, @PathVariable(value = "currentPage") int currentPage) {
		
		LmsNotice lmsNotice = teacherLmsNoticeService.getLmsNoticeOne(lmsNoticeNo);
		model.addAttribute("lmsNotice", lmsNotice);
		
		return "teacher/lmsNoticeOne";
	}
	
	//공지사항 조회수 증가
	@GetMapping("/teacher/modifyLmsNoticeCount/{lmsNoticeNo}/{currentPage}")
	public String modifyLmsNoticeCount(@PathVariable(value = "lmsNoticeNo") int lmsNoticeNo, @PathVariable(value = "currentPage") int currentPage) {
		
		teacherLmsNoticeService.modifyLmsNoticeCount(lmsNoticeNo);
		
		return "redirect:/teacher/lmsNoticeOne/" + lmsNoticeNo + "/" + currentPage;
	}

}
