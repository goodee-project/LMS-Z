package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.teacher.service.TeacherLmsNoticeService;
import gd.fintech.lms.vo.LmsNotice;

@Controller
public class TeacherLmsNoticeController {
	
	@Autowired TeacherLmsNoticeService teacherLmsNoticeService;
	
	//공지사항 목록
	@GetMapping("/teacher/lmsNoticeList")
	public String lmsNoticeList(Model model) {
		
		List<LmsNotice> lmsNoticeList = teacherLmsNoticeService.getLmsNoticeList();
		model.addAttribute("lmsNoticeList", lmsNoticeList);
		
		return "teacher/lmsNoticeList";
	}

}
