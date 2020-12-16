package gd.fintech.lms.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentLectureService;
import gd.fintech.lms.vo.Classroom;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Subject;
import gd.fintech.lms.vo.Syllabus;
import gd.fintech.lms.vo.Textbook;

@Controller
public class StudentLectureController {
	@Autowired StudentLectureService studentLectureService;
	
	//페이징 처리한 전체 강의 목록 리스트
	@GetMapping("/student/lectureList/{currentPage}")
	public String lectureList(Model model,
							@PathVariable(name="currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 2;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage; 
		// 페이징 처리한 전체 강의 리스트
		List<Lecture> lectureList = studentLectureService.getLectureList(beginRow, rowPerPage); 
		// 전체 강의 목록 갯수
		int listTotal = studentLectureService.getLectureListTotal(); 
		// 마지막 페이지
		int lastPage = 0;
		if(listTotal%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (listTotal/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = listTotal/rowPerPage;
		}
		model.addAttribute("lectureList",lectureList);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		return "student/lectureList";
	}
	
	// 강의 목록 상세보기
	@GetMapping("/student/lectureListOne/{lectureNo}/{currentPage}")
	public String lectureListOne(Model model,
								@PathVariable(name="lectureNo") int lectureNo,
								@PathVariable(name="currentPage") int currentPage) {
		// 1. 강의실 정보
		Lecture lectureOne = studentLectureService.getLectureListOne(lectureNo);
		// 2. 과목 정보
		Subject subjectOne = studentLectureService.getSubjectOne(lectureOne.getSubjectNo());
		// 3. 교재 정보
		Textbook textbookOne = studentLectureService.getTextbookOne(lectureOne.getTextbookIsbn());
		// 4. 강의계획서
		Syllabus syllabusOne = studentLectureService.getSyllabusOne(lectureOne.getSyllabusNo());
		// 5. 강의실 정보
		Classroom classroomOne = studentLectureService.getClassroomOne(lectureOne.getClassroomNo());
		
		model.addAttribute("lectureOne",lectureOne);
		model.addAttribute("subjectOne",subjectOne);
		model.addAttribute("textbookOne",textbookOne);
		model.addAttribute("syllabusOne",syllabusOne);
		model.addAttribute("classroomOne",classroomOne);
		model.addAttribute("currentPage",currentPage);
		return "student/lectureListOne";
	}
	
	@GetMapping("/student/classRegistration/{studentId}/{lectureNo}")
	public String classRegistration(@PathVariable(name="studentId") String studentId,
									@PathVariable(name="lectureNo") int lectureNo) {
		
		studentLectureService.addClassRegistration(studentId,lectureNo);
		return "redirect:/student/myLectureList";
	}
	
	//나의 강의목록 리스트 출력
	@GetMapping("/student/myLectureList/{currentPage}")
	public String myLectureList() {
		return "student/myLectureList";
	}
}