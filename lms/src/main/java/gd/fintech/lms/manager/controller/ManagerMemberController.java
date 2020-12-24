package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.ManagerMemberService;
import gd.fintech.lms.vo.Account;

@Controller
public class ManagerMemberController {
	@Autowired ManagerMemberService managerMemberService;
	
	//활성화된 학생, 강사 리스트 출력
	@GetMapping("/manager/memberList/{currentPage}")
	public String memberList(Model model, 
			@PathVariable(name="currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 3;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage;
		int startPage = ((currentPage/11)*rowPerPage)+1;
		List<Account> memberList = managerMemberService.getTeacherAndStudentList(beginRow, rowPerPage);
		int totalPage = managerMemberService.getTeacherAndStudentCount();
		int lastPage = 0;
		if(totalPage%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (totalPage/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = totalPage/rowPerPage;
		}
		model.addAttribute("memberList",memberList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("startPage",startPage);
		return "/manager/memberList";
	}
	//검색 또는 직책 선택시 출력해주는 컨트롤러
	
}
