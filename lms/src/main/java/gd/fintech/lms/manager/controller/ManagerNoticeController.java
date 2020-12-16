package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.manager.service.ManagerNoticeService;
import gd.fintech.lms.vo.LmsNotice;


@Controller
public class ManagerNoticeController {
	@Autowired ManagerNoticeService managerNoticeService;
	
	//공지사항 리스트 
	@GetMapping ("/manager/LmsNoticeList/{lmsNoticeNo}/{currentPage}")
	public String LmsNotice(Model model, @RequestParam(value = "lmsNoticeNo") int lmsNoticeNo, @RequestParam(value = "currentPage") int currentPage) {
		
		//한 페이지 출력 공지사항 개수 
		int rowPerPage = 10;
		
		//last 페이지
		int lastPage = 0; 
		
		//공지사항 total Count
		int totalCount = managerNoticeService.getLmsNoticeCount(lmsNoticeNo);
				
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage +1;
		}
		
		List<LmsNotice> LmsnoticeList = managerNoticeService.getLmsNoticeList(lmsNoticeNo, currentPage, rowPerPage);

		model.addAttribute("currentpage", currentPage);
		model.addAttribute("lastpage", lastPage);
		model.addAttribute("lmsnoticeList", LmsnoticeList);
	
		return "manager/LmsNoticeList";
	}
	
	//공지사항 작성 폼 
	@GetMapping ("/manager/addLmsNotice/{LmsNotice}")
	public String addLmsNotice(@PathVariable(value="LmsNotice")int lmsNotice) {
		return "mananger/addLmsNotice";
	}
	
	//공지사항 작성 액션 
	@PostMapping("/manager/addLmsNotice/{LmsNotice}")
	public String addLmsNotice(LmsNotice lmsNotice) {
		return "redirect:/manager/LmsNoticeList/"+lmsNotice.getLmsNoticeNo();
	}
	//공지사항 상세내용 
	@GetMapping("/manager/LmsNoticeOne/{LmsNotice}/{lmsNoticeNo}")
	public String managerNoticeOne(Model model, @PathVariable(value = "LmsNotice") int LmsNotice, @PathVariable(value = "LmsNoticeNo")int LmsNoticeNo) {
	return""; 
	}
}