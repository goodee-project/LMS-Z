package gd.fintech.lms.manager.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.manager.service.ManagerMemberService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Controller
public class ManagerMemberController {
	@Autowired ManagerMemberService managerMemberService;
	
	//활성화된 학생, 강사 리스트 출력
	@GetMapping("/manager/memberList/{currentPage}/{searchLevel}")
	public String memberList(Model model, 
			@PathVariable(name="currentPage") int currentPage,
			@PathVariable(name="searchLevel") String searchLevel) {
		// page당 목록 갯수
		int rowPerPage = 5;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage;
		int startPage = ((currentPage/11)*rowPerPage)+1;
		List<Account> memberList = null;
		int totalPage = 0;
		if(searchLevel.equals("선택안함")) {
			memberList = managerMemberService.getTeacherAndStudentList(beginRow, rowPerPage);
			totalPage = managerMemberService.getTeacherAndStudentCount();
		}else if(!searchLevel.equals("선택안함")) {
			memberList = managerMemberService.getTeacherOrStudentList(searchLevel, beginRow, rowPerPage);
			totalPage = managerMemberService.getTeacherOrStudentCount(searchLevel);
		}
		int lastPage = 0;
		if(totalPage%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (totalPage/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = totalPage/rowPerPage;
		}
		model.addAttribute("searchLevel",searchLevel);
		model.addAttribute("memberList",memberList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("startPage",startPage);
		return "/manager/memberList";
	}
	//검색 또는 직책 선택시 값을 getMapping으로 보내주는 컨트롤러
	@PostMapping("/manager/searchMemberList")
	public String searchMemberList(@RequestParam(value="searchLevel") String searchLevel) throws UnsupportedEncodingException{
		 String Level = URLEncoder.encode(searchLevel, "UTF-8");
		return "redirect:/manager/memberList/1/"+Level;
	}
	//강사 이름 클릭시 해당하는 강사의 정보를 상세보기
	@GetMapping("/manager/teacherOne/{teacherId}/{searchLevel}")
	public String teacherOne(Model model,
				@PathVariable(name="teacherId") String teacherId,
				@PathVariable(name="searchLevel") String searchLevel) {
		Teacher teacherOne = managerMemberService.getTeacherOne(teacherId);
		model.addAttribute("teacherOne",teacherOne);
		model.addAttribute("searchLevel",searchLevel);
		return "/manager/teacherOne";
	}
	//학생 이름 클릭시 해당하는 학생의 정보 상세보기
	@GetMapping("/manager/studentOne/{studentId}/{searchLevel}")
	public String studentOne(Model model,
				@PathVariable(name="studentId") String studentId,
				@PathVariable(name="searchLevel") String searchLevel) {
		Student studentOne = managerMemberService.getStudentOne(studentId);
		model.addAttribute("studentOne", studentOne);
		model.addAttribute("searchLevel",searchLevel);
		return "/manager/studentOne";
	}
	
}
