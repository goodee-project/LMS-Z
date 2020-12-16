package gd.fintech.lms.student.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentLectureService;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.ClassRegistrationForm;
import gd.fintech.lms.vo.Lecture;

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
		// 강의실 정보
		Lecture lectureOne = studentLectureService.getLectureListOne(lectureNo);
		
		model.addAttribute("lectureOne",lectureOne);
		model.addAttribute("currentPage",currentPage);
		return "student/lectureListOne";
	}
	
	@GetMapping("/student/classRegistration/{studentId}/{lectureNo}")
	public String classRegistration(@PathVariable(name="studentId") String studentId,
									@PathVariable(name="lectureNo") int lectureNo) {
		
		studentLectureService.addClassRegistration(studentId,lectureNo);
		return "redirect:/student/myLectureList/1";
	}
	
	//나의 강의목록 리스트 출력
	@GetMapping("/student/myLectureList/{studentId}/{currentPage}")
	public String myLectureList(Model model,
							@PathVariable(name="studentId") String studentId,
							@PathVariable(name="currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 2;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage; 
		// 페이징 처리한 나의 강의 현황 리스트
		List<ClassRegistration> myLectureList = studentLectureService.getMyLectureList(studentId, beginRow, rowPerPage); 
		// 전체 나의 강의 목록 갯수
		int listTotal = studentLectureService.getMyLectureListTotal(studentId); 
		// 마지막 페이지
		int lastPage = 0;
		if(listTotal%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (listTotal/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = listTotal/rowPerPage;
		}
		model.addAttribute("myLectureList",myLectureList);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		return "student/myLectureList";
	}
	//==== 나의 수강 현황 상세보기 ====
	@GetMapping("/student/myLectureListOne/{studentId}/{lectureNo}/{currentPage}")
	public String myLectureListOne(Model model,
								@PathVariable(name="studentId") String studentId,
								@PathVariable(name="lectureNo") int lectureNo,
								@PathVariable(name="currentPage") int currentPage) {
		// 강의실 정보
		ClassRegistrationForm myLectureListOne = studentLectureService.getMyLectureListOne(studentId, lectureNo);
		
		model.addAttribute("myLectureListOne",myLectureListOne);
		model.addAttribute("currentPage",currentPage);
		return "student/myLectureListOne";
	}
}