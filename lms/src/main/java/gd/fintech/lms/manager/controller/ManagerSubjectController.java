package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerSubjectService;
import gd.fintech.lms.vo.Subject;

@Controller
public class ManagerSubjectController {
	@Autowired ManagerSubjectService managerSubjectService;
	//과목 리스트를 보여주는 컨트롤러
	@GetMapping("/manager/subjectList/{currentPage}")
	public String subjectList(Model model,
				@PathVariable(name="currentPage") int currentPage) {
		
		// page당 목록 갯수
		int rowPerPage = 5;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage;
		int startPage = ((currentPage/11)*rowPerPage)+1;
		List<Subject> subjectList = managerSubjectService.getSubjectList(beginRow, rowPerPage);
		int totalPage = managerSubjectService.getSubjectTotalCount();
		// 마지막 페이지
		int lastPage = 0;
		if(totalPage%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (totalPage/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = totalPage/rowPerPage;
		}
		model.addAttribute("subjectList",subjectList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("lastPage",lastPage);
		return "/manager/subjectList";
	}
	//과목 추가하기 위한 폼을 불러오는 컨트롤러
	@GetMapping("/manager/insertSubject")
	public String insertSubject() {
		return "/manager/insertSubject";
	}
	//과목 추가 액션
	@PostMapping("/manager/insertSubjectAction")
	public String insertSubjectAction(Subject subject) {
		managerSubjectService.insertSubject(subject);
		return "redirect:/manager/subjectList/1";
	}
	//과목 상세보기 
	@GetMapping("/manager/subjectOne/{subjectNo}")
	public String subjectOne(Model model,
				@PathVariable(name="subjectNo") int subjectNo) {
		Subject subjectOne = managerSubjectService.getSubjectOne(subjectNo);
		model.addAttribute("subjectOne",subjectOne);
		return "/manager/subjectOne";
	}
	//과목 수정 폼
	@GetMapping("/manager/modifySubjectOne/{subjectNo}")
	public String modifySubjectOne(Model model,
			@PathVariable(name="subjectNo") int subjectNo) {
		Subject subjectOne = managerSubjectService.getSubjectOne(subjectNo);
		model.addAttribute("subjectOne",subjectOne);
		return "/manager/modifySubjectOne";
	}
	//과목 수정 액션
	@PostMapping("/manager/modifySubjectOneAction")
	public String modifySubjectOneAction(Subject subject) {
		managerSubjectService.updateSubjectOne(subject);
		return "redirect:/manager/subjectOne/"+subject.getSubjectNo();
	}
	//과목 삭제
	@GetMapping("manager/deleteSubjectOne/{subjectNo}")
	public String deleteSubjectOne(@PathVariable(name="subjectNo") int subjectNo) {
		managerSubjectService.deleteSubjectOne(subjectNo);
		return "redirect:/manager/subjectList/1";
	}
}
