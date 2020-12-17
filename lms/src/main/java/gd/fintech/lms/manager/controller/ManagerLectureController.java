package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import gd.fintech.lms.manager.service.ManagerLectureService;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Teacher;


@Controller
public class ManagerLectureController {
	@Autowired ManagerLectureService managerLectureService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	//강좌 리스트
	@GetMapping("/manager/lectureList")
	public String LectureList(Model model) {
		List<Lecture> lectureList = managerLectureService.getLectureList();
		logger.debug("lectureList="+lectureList.toString());
		model.addAttribute("lectureList",lectureList);
		return "/manager/lectureList";
	}
	//강좌 등록을 위한 컨트롤러 각각의 리스트를 불러와 선택하기 위한 서비스 호출
	@GetMapping("/manager/insertLecture")
	public String insertLecture(Model model) {
		List<Teacher> teacherList = managerLectureService.getTeacherList();
		logger.debug("teacherList="+teacherList.toString());
		
		model.addAttribute("teacherList",teacherList);
		return "/manager/insertLecture";
	}
	@PostMapping("/manager/insertAction")
	public String insertAction(Lecture lecture) {
		logger.debug("lecture"+lecture);
		
		return "redirect:/manager/lectureList";
	}
}
