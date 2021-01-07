package gd.fintech.lms.teacher.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.ManagerLmsNoticeService;
import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LmsNotice;

@Controller
public class TeacherIndexController {
	@Autowired ManagerLmsNoticeService managerLmsNoticeService;
	
	@GetMapping(value={"/teacher" ,"/teacher/index"})
	public String index(Model model) {
			
		List<LmsNotice> lmsNoticeList = managerLmsNoticeService.getLmsNoticeList(0, 5);

		model.addAttribute("lmsNoticeList", lmsNoticeList);
		
		return "teacher/index";
	}
}
