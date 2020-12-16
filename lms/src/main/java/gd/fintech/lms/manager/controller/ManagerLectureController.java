package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import gd.fintech.lms.manager.service.ManagerLectureService;
import gd.fintech.lms.vo.Lecture;

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
}
