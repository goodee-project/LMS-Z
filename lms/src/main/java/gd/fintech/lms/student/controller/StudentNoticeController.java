package gd.fintech.lms.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.mapper.TeacherLectureNoticeMapper;
import gd.fintech.lms.teacher.service.TeacherLectureNoticeService;
import gd.fintech.lms.teacher.service.TeacherLmsNoticeService;
import gd.fintech.lms.vo.LectureNotice;
import gd.fintech.lms.vo.LmsNotice;


@Controller
public class StudentNoticeController {
	@Autowired TeacherLmsNoticeService teacherLmsNoticeService;
	@Autowired TeacherLectureNoticeService teacherLectureNoticeService;
	
	//Lms 공지사항 전체 불러오기
	@GetMapping("/student/lmsNoticeList/{currentPage}")
	public String lmsNoticeList(Model model,
								@PathVariable(value = "currentPage") int currentPage) {
		
		//페이징에 필요한 변수선언
		int rowPerPage = 5;
		int beginRow = (currentPage - 1) * rowPerPage;
		// 페이징) 1~10 한묶음 중 첫번째 페이지
		int startPage = ((currentPage / 11) * rowPerPage) + 1;
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
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("startPage",startPage);
		return "student/lmsNoticeList";
	}
	//Lms 공지사항 상세보기
	@GetMapping("/student/lmsNoticeOne/{lmsNoticeNo}")
	public String lmsNoticeOne(Model model,
							@PathVariable(name="lmsNoticeNo") int lmsNoticeNo) {
		LmsNotice lmsNotice = teacherLmsNoticeService.getLmsNoticeOne(lmsNoticeNo);
		model.addAttribute("lmsNotice", lmsNotice);
		
		return "student/lmsNoticeOne";
	}
	//강의별 공지사항 전체 불러오기
	@GetMapping("/student/lectureNoticeList/{lectureNo}/{currentPage}")
	public String lectureNotice(Model model,
								@PathVariable(value="lectureNo") int lectureNo,
								@PathVariable(value="currentPage") int currentPage) {
		// 한 페이지에 출력할 개수
		int rowPerPage = 5; 
		
		int beginRow = (currentPage - 1) * rowPerPage;
		// 페이징) 1~10 한묶음 중 첫번째 페이지
		int startPage = ((currentPage / 11) * rowPerPage) + 1;
		// 마지막 페이지
		int lastPage = 0; 
		// 공지사항 전체 개수
		int totalCount = teacherLectureNoticeService.getLectureNoticeCount(lectureNo);
		
		// 마지막 페이지 구하기
		// totalCount / rowPerPage를 한 후 나머지가 0이면 lastPage는 totalCount / rowPerPage
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		}else { // 나머지가 0이 아니면 + 1을 하여 페이지를 늘린다.
			lastPage = totalCount / rowPerPage + 1;
		}
		
		// 리스트로 출력하기 위해 List형태의 LectureNotice 객체 선언 및 초기화
		List<LectureNotice> noticeList = teacherLectureNoticeService.getLectureNoticeList(lectureNo, beginRow, rowPerPage);
		
		// jsp파일에 필요한 변수값 model에 입력(현재 페이지, 마지막 페이지, 공지사항 목록)
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("lectureNo",lectureNo);
		model.addAttribute("noticeList", noticeList);
		
		return "student/lectureNoticeList";
	}
	// 강좌별 공지사항 상세보기
		@GetMapping("/student/lectureNoticeOne/{lectureNo}/{lectureNoticeNo}/{currentPage}")
		public String lectureNoticeOne(Model model,
										@PathVariable(value="lectureNo") int lectureNo,
										@PathVariable(value="lectureNoticeNo") int lectureNoticeNo,
										@PathVariable(value="currentPage") int currentPage){
			
			// 해당 강좌의 각 공지사항의 상세보기이므로 강좌번호(lectureNo)와 공지번호(lectureNoticeNo) 둘 다 받아옴
			// 공자사항의 내용을 출력하기 위해 LectureNotice의 객체 선언 및 service의 메소드를 호출하여 초기화한다.
			LectureNotice noticeOne = teacherLectureNoticeService.getLectureNoticeOne(lectureNoticeNo);
			// jsp파일에서 출력할 값 model에 입력
			model.addAttribute("noticeOne", noticeOne);
			model.addAttribute("currentPage",currentPage);
			// 공지사항 상세보기 jsp파일로 return
			return "student/lectureNoticeOne";
		}
}
