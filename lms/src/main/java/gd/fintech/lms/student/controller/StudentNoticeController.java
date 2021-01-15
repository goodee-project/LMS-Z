package gd.fintech.lms.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.manager.service.ManagerLmsNoticeService;
import gd.fintech.lms.teacher.mapper.TeacherLectureNoticeMapper;
import gd.fintech.lms.teacher.service.TeacherLectureNoticeService;
import gd.fintech.lms.teacher.service.TeacherLmsNoticeService;
import gd.fintech.lms.vo.LectureNotice;
import gd.fintech.lms.vo.LmsNotice;


@Controller
public class StudentNoticeController {
	@Autowired TeacherLmsNoticeService teacherLmsNoticeService;
	@Autowired TeacherLectureNoticeService teacherLectureNoticeService;
	@Autowired ManagerLmsNoticeService managerLmsNoticeService;
	
	//Lms 공지사항 전체 불러오기
	//공지사항 리스트 
		@GetMapping ("/student/lmsNoticeList/{currentPage}")
		public String lmsNoticeList(Model model,
								@PathVariable(value = "currentPage") int currentPage) {
			
			//한 페이지 출력 공지사항 개수 
			int rowPerPage = 5;
			int beginRow = (currentPage -1) * rowPerPage; 
			int startPage = ((currentPage/11)*rowPerPage)+1;
			
			//last 페이지
			int lastPage = 0; 
			//공지사항 total Count
			int totalRow = managerLmsNoticeService.getLmsNoticeCount();
			// 데이터마다 갖고 있는 no값이 1,2,3처럼 규칙이 없기 때문에
			// UI에서는 규칙적인 NO를 보여주기 위해
			int ruleNo = (totalRow-(rowPerPage*(currentPage-1)));
			//나누어 떨어지면 
			if(totalRow % rowPerPage == 0) {
				lastPage = totalRow / rowPerPage;
			} else {//나누어 떨어지지 않는다면
				lastPage = totalRow / rowPerPage +1;
			}
			
			List<LmsNotice> lmsNoticeList = managerLmsNoticeService.getLmsNoticeList(beginRow, rowPerPage);

			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("ruleNo",ruleNo);
			model.addAttribute("lmsNoticeList", lmsNoticeList);
			model.addAttribute("startPage",startPage);
			return "student/lmsNoticeList";
		}
		
		//공지사항 검색 리스트
		@GetMapping ("/student/lmsNoticeList/{lmsNoticeTitle}/{currentPage}")
		public String searchLmsNoticeList(Model model,
								@PathVariable(name="lmsNoticeTitle") String lmsNoticeTitle,
								@PathVariable(name = "currentPage") int currentPage) {
			
			//한 페이지 출력 공지사항 개수 
			int rowPerPage = 5;
			int beginRow = (currentPage -1) * rowPerPage; 
			int startPage = ((currentPage/11)*rowPerPage)+1;
			
			//last 페이지
			int lastPage = 0; 
			//공지사항 total Count
			int totalRow = managerLmsNoticeService.getSearchNoticeTotal(lmsNoticeTitle.replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", ""));
			
			//나누어 떨어지면 
			if(totalRow % rowPerPage == 0) {
				lastPage = totalRow / rowPerPage;
			} else {//나누어 떨어지지 않는다면
				lastPage = totalRow / rowPerPage +1;
			}
			// 데이터마다 갖고 있는 no값이 1,2,3처럼 규칙이 없기 때문에
			// UI에서는 규칙적인 NO를 보여주기 위해
			int ruleNo = (totalRow-(rowPerPage*(currentPage-1)));
			//html 태그 제거
			List<LmsNotice> lmsNoticeList = managerLmsNoticeService.getSearchLmsNotice(lmsNoticeTitle.replaceAll("<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>", ""), beginRow, rowPerPage);

			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("lmsNoticeList", lmsNoticeList);
			model.addAttribute("startPage",startPage);
			// 데이터마다 갖고 있는 no값이 1,2,3처럼 규칙이 없기 때문에
			// UI에서는 규칙적인 NO를 보여주기 위해
			model.addAttribute("ruleNo", ruleNo);
			// 전체 또는 검색했을 때 페이지 번호에 정해진 url이 달라져야하기 때문에
			model.addAttribute("lmsNoticeTitle",lmsNoticeTitle);

			return "student/lmsNoticeList";
		}
	
	//공지사항 조회 시 조회수 +1
	@GetMapping("/student/noticeCountup/{lmsNoticeNo}/{currentPage}")
	public String noticeCountUp(@PathVariable(name="lmsNoticeNo") int lmsNoticeNo,
								@PathVariable(name="currentPage") int currentPage) {
		managerLmsNoticeService.modifyLmsNoticeCount(lmsNoticeNo);
		return "redirect:/student/lmsNoticeOne/"+lmsNoticeNo+"/"+currentPage;
	}
	/*
	 * 조회수 +1 메서드를 따로 만들어서 공지사항상세보기에서
	 * 새로고침을 해도 count+1되지 않도록 함
	 */
	
	//Lms 공지사항 상세보기
	@GetMapping("/student/lmsNoticeOne/{lmsNoticeNo}/{currentPage}")
	public String lmsNoticeOne(Model model,
							@PathVariable(name="lmsNoticeNo") int lmsNoticeNo,
							@PathVariable(name="currentPage") int currentPage) {
		LmsNotice lmsNotice = managerLmsNoticeService.getLmsNoticeOne(lmsNoticeNo);
		model.addAttribute("lmsNotice", lmsNotice);
		model.addAttribute("currentPage",currentPage);
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
