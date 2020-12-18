package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerNoticeService;
import gd.fintech.lms.vo.LmsNotice;


@Controller
public class ManagerNoticeController {
	@Autowired ManagerNoticeService managerNoticeService;
	
	//공지사항 리스트 
	@GetMapping ("/manager/lmsNoticeList/{lmsNoticeNo}/{currentPage}")
	public String LmsNotice(Model model, @PathVariable(value = "lmsNoticeNo") int lmsNoticeNo, @PathVariable(value = "currentPage") int currentPage) {
		
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
		
		List<LmsNotice> lmsNoticeList = managerNoticeService.getLmsNoticeList(lmsNoticeNo, currentPage, rowPerPage);

		model.addAttribute("currentpage", currentPage);
		model.addAttribute("lastpage", lastPage);
		model.addAttribute("lmsNoticeList", lmsNoticeList);
	
		return "manager/lmsNoticeList";
	}
	
	//공지사항 작성 폼 
	@GetMapping ("/manager/addLmsNotice/{accountId}")
	public String addLmsNotice(@PathVariable(value="")Integer accountId) {
		return "mananger/addLmsNotice";
	}
	
	//공지사항 작성 액션 
	@PostMapping("/manager/addLmsNotice/{accountId}")
	public String addLmsNotice(LmsNotice accountId) {
		managerNoticeService.addLmsNotice(accountId);
		return "redirect:/manager/LmsNoticeList/"+accountId.getLmsNoticeNo();
	}
	//공지사항 상세내용 
	@GetMapping("/manager/LmsNoticeOne/{accountId}/{lmsNoticeNo}")
	public String managerNoticeOne(Model model, @PathVariable(value = "accountId")Integer accountId, @PathVariable(value = "LmsNoticeNo")int LmsNoticeNo) {
		LmsNotice LmsNoticeOne = managerNoticeService.getLmsNoticeOne(LmsNoticeNo);
		model.addAttribute("noticeOne", LmsNoticeOne);
		return "manager/LmsNoticeOne"; 
	}
	//공지사항 수정 폼 
	@GetMapping("/manager/modifyLmsNotice/{accountId}/{lmsNoticeNo}")
	public String modifyLmsNotice(Model model, @PathVariable(value = "accountId")Integer accountId, @PathVariable(value ="lmsNoticeNo")int lmsNoticeNo) {
		LmsNotice LmsNoticeOne = managerNoticeService.getLmsNoticeOne(lmsNoticeNo);
		model.addAttribute("noticeOne", LmsNoticeOne);
		return "manager/modifyLmsNotice";
	}
	//공지사항 수정 액션 
	@PostMapping("/manager/modifyLmsNotice/{accountId}/{lmsNoticeNo}")
	public String modifyLmsNotice(LmsNotice accountId) {
		managerNoticeService.addLmsNotice(accountId);
		return "redirect:/manager/LmsNoticeOne/"+accountId.getLmsNoticeNo()+"/"+accountId.getLmsNoticeNo();
	}
	//공지사항 삭제 
	@GetMapping("/manager/removeLmsNotice/{accountId}/{lmsNoticeNo}")
	public String removeLmsNotice(@PathVariable(value="accountId")Integer accountId,@PathVariable(value="lmsNoticeNo")int lmsNoitceNo) {
	managerNoticeService.removeLmsNotice(accountId);
	return"redirect:/manager/LmsNoticeList";
	}
}