package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
		// 한 페이지에 출력할 개수
		int rowPerPage = 5; 
		
		int beginRow = (currentPage - 1) * rowPerPage;
		// 마지막 페이지
		int lastPage = 0; 
		int startPage = ((currentPage/11)*rowPerPage)+1;
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
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("noticeList", noticeList);
		
		return "teacher/lectureNoticeList";
	}
	
	// 강좌별 공지사항 추가 폼
	@GetMapping("/teacher/addLectureNotice/{lectureNo}")
	public String addLectureNotice(@PathVariable(value="lectureNo") int lectureNo) {
		// 해당 강좌의 공지사항에 등록하기 위해 강좌번호(lectureNo)를 PathVariable로 받아옴
		return "teacher/addLectureNotice";
	}
	
	// 강좌별 공지사항 추가 액션
	@PostMapping("/teacher/addLectureNotice/{lectureNo}")
	public String addLectureNotice(LectureNotice lectureNotice) {
		// 추가할 내용 값이 넘어왔는지 확인
		System.out.println(lectureNotice);
		// db에 모는 html태그 접근 제한
		String title = lectureNotice.getLectureNoticeTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		lectureNotice.setLectureNoticeTitle(title);
		String content = lectureNotice.getLectureNoticeContent().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		lectureNotice.setLectureNoticeContent(content);
		// 넘어온 내용 값 추가하기 위해 service의 add메소드 호출
		teacherLectureNoticeService.addLectureNotice(lectureNotice);
		// action 작동 후 공지사항 목록페이지로 return
		return "redirect:/teacher/lectureNoticeList/"+lectureNotice.getLectureNo()+"/1";
	}
	
	// 강좌별 공지사항 상세보기
	@GetMapping("/teacher/lectureNoticeOne/{lectureNo}/{lectureNoticeNo}")
	public String lectureNoticeOne(Model model,
									@PathVariable(value="lectureNo") int lectureNo,
									@PathVariable(value="lectureNoticeNo") int lectureNoticeNo){
		// 해당 강좌의 각 공지사항의 상세보기이므로 강좌번호(lectureNo)와 공지번호(lectureNoticeNo) 둘 다 받아옴
		// 공자사항의 내용을 출력하기 위해 LectureNotice의 객체 선언 및 service의 메소드를 호출하여 초기화한다.
		LectureNotice noticeOne = teacherLectureNoticeService.getLectureNoticeOne(lectureNoticeNo);
		// jsp파일에서 출력할 값 model에 입력
		model.addAttribute("noticeOne", noticeOne);
		// 공지사항 상세보기 jsp파일로 return
		return "teacher/lectureNoticeOne";
	}
	
	// 강좌별 공지사항 조회수 증가
	@GetMapping("/teacher/modifyLectureNoticeCount/{lectureNo}/{lectureNoticeNo}")
	public String lectureNoticeOne(@PathVariable(value="lectureNo") int lectureNo,
									@PathVariable(value="lectureNoticeNo") int lectureNoticeNo) {
		// 강좌별 공지사항 조회 시 조회수 증가 메서드 호출
		teacherLectureNoticeService.modifyLectureNoticeCount(lectureNoticeNo);
		return "redirect:/teacher/lectureNoticeOne/"+lectureNo+"/"+lectureNoticeNo;
	}
	
	// 강좌별 공지사항 수정 폼
	@GetMapping("/teacher/modifyLectureNotice/{lectureNo}/{lectureNoticeNo}")
	public String modifyLectureNotice(Model model,
										@PathVariable(value="lectureNo") int lectureNo,
										@PathVariable(value="lectureNoticeNo") int lectureNoticeNo) {
		// 해당 강좌의 각 공지사항을 수정하기 위해 공지번호(lectureNoticeNo) 둘 다 받아옴
		// 공지사항의 수정할 내용을 출력하기 위해 LectureNotice의 객체 선언 및 service의 메소드를 호출하여 초기화
		LectureNotice noticeOne = teacherLectureNoticeService.getLectureNoticeOne(lectureNoticeNo);
		// jsp파일에서 출력할 값 model에 입력
		model.addAttribute("noticeOne", noticeOne);
		// 공지사항 수정 jsp파일로 return
		return "teacher/modifyLectureNotice";
	}
	
	// 강좌별 공지사항 수정 액션
	@PostMapping("/teacher/modifyLectureNotice/{lectureNo}/{lectureNoticeNo}")
	public String modifyLectureNotice(LectureNotice lectureNotice) {
		// 수정한 값 정상적으로 받아왔는지 확인
		System.out.println(lectureNotice);
		// db에 모든 html태그 접근 제한
		String title = lectureNotice.getLectureNoticeTitle().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		lectureNotice.setLectureNoticeTitle(title);
		String content = lectureNotice.getLectureNoticeContent().replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", "");
		lectureNotice.setLectureNoticeContent(content);
		// 받아온 값으로 수정하기 위해 service의 modify메소드 호출
		teacherLectureNoticeService.modifyLectureNotice(lectureNotice);
		// action 작동 후 수정된 값 확인을 위해 공지사항 상세보기(lectureNoticeOne)으로 return
		return "redirect:/teacher/lectureNoticeOne/"+lectureNotice.getLectureNo()+"/"+lectureNotice.getLectureNoticeNo();
	}
	
	// 강좌별 공지사항 삭제
	@GetMapping("/teacher/removeLectureNotice/{lectureNo}/{lectureNoticeNo}")
	public String removeLectureNotice(@PathVariable(value="lectureNo") int lectureNo,
										@PathVariable(value="lectureNoticeNo") int lectureNoticeNo) {
		// 해당 강좌의 공지사항을 삭제하기 위해서 공지번호(lectureNoticeNo)를 받아옴
		// 공지사항을 삭제하기 위해 service의 remove메소드 호출
		teacherLectureNoticeService.removeLectureNotice(lectureNoticeNo);
		// 삭제 후 공지사항 목록으로 return
		return "redirect:/teacher/lectureNoticeList/"+lectureNo+"/1";
	}
}
