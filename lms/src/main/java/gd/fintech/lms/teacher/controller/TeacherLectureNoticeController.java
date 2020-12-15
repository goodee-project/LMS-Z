package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.teacher.service.TeacherLectureNoticeService;
import gd.fintech.lms.vo.LectureNotice;

@Controller
public class TeacherLectureNoticeController {
	@Autowired TeacherLectureNoticeService teacherLectureNoticeService;
	
	// 강좌별 공지사항 목록(lectureNo, currentPage 받아옴)
	@GetMapping("/teacher/lectureNoticeList/{lectureNo}/{currentPage}")
	public String lectureNotice(Model model,
								@PathVariable(value="lectureNo") int lectureNo,
								@PathVariable(value="currentPage") int currentPage) {
		int rowPerPage = 5;
		int lastPage = 0; // 마지막 페이지
		int totalCount = teacherLectureNoticeService.getLectureNoticeCount(lectureNo); // 공지사항 전체개수
		
		// 마지막 페이지 구하기
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		}else {
			lastPage = totalCount / rowPerPage + 1;
		}
		
		List<LectureNotice> noticeList = teacherLectureNoticeService.getLectureNoticeList(lectureNo, currentPage, rowPerPage);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("noticeList", noticeList);
		
		return "teacher/lectureNoticeList";
	}
	
	// 공지사항 추가(외래키 연결 필요)
	@GetMapping("/teacher/addLectureNotice/{lectureNo}")
	public String addLectureNotice(@PathVariable(value="lectureNo") int lectureNo) {
		return "teacher/addLectureNotice";
	}
	
	@PostMapping("/teacher/addLectureNotice/{lectureNo}")
	public String addLectureNotice(LectureNotice lectureNotice) {
		System.out.println(lectureNotice);
		teacherLectureNoticeService.addLectureNotice(lectureNotice);
		return "redirect:/teacher/lectureNoticeList/"+lectureNotice.getLectureNo()+"/1";
	}
	
	// 공지사항 상세보기
	@GetMapping("/teacher/lectureNoticeOne/{lectureNo}/{lectureNoticeNo}")
	public String lectureNoticeOne(Model model,
									@PathVariable(value="lectureNo") int lectureNo,
									@PathVariable(value="lectureNoticeNo") int lectureNoticeNo){
		LectureNotice noticeOne = teacherLectureNoticeService.getLectureNoticeOne(lectureNo, lectureNoticeNo);
		model.addAttribute("noticeOne", noticeOne);
		return "teacher/lectureNoticeOne";
	}
}
