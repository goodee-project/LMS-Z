package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import gd.fintech.lms.manager.service.ManagerLectureService;
import gd.fintech.lms.vo.Classroom;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Subject;
import gd.fintech.lms.vo.Syllabus;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.Textbook;

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
		List<Subject> subjectList = managerLectureService.getSubjectList();
		logger.debug("subjectList="+subjectList.toString());
		List<Textbook> textbookList = managerLectureService.getTextbookList();
		List<Syllabus> syllabusList = managerLectureService.getSyllabusList();
		List<Classroom> classroomList = managerLectureService.getClassroomList();
		
		model.addAttribute("teacherList",teacherList);
		model.addAttribute("subjectList",subjectList);
		model.addAttribute("textbookList",textbookList);
		model.addAttribute("syllabusList",syllabusList);
		model.addAttribute("classroomList",classroomList);
		return "/manager/insertLecture";
	}
	//강좌정보를 입력후 등록버튼 클릭시 form안의 데이터를 받아와 서비스를 호출
	@PostMapping("/manager/insertAction")
	public String insertAction(Lecture lecture) {
		logger.debug("lecture"+lecture.toString());
		
		managerLectureService.insertLecture(lecture);
		return "redirect:/manager/lectureList";
	}
	//강좌 삭제버튼 클릭시 해당 강좌를 삭제하기 위한 서비스 호출
	@GetMapping("/manager/deleteLecture/{lectureNo}")
	public String deleteLecture(@PathVariable(name="lectureNo") int lectureNo) {
		managerLectureService.deleteLecture(lectureNo);
		return "redirect:/manager/lectureList";
	}
}
