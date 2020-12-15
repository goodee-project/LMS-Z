package gd.fintech.lms.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import gd.fintech.lms.vo.LmsNotice;
import gd.fintech.lms.notice.service.LmsNoticeService;

@Controller
public class LmsNoticeController {
	@Autowired LmsNoticeService lmsNoticeService;
	
	//공지사항 리스트 
	@GetMapping ("")
	public String LmsNotice(Model model, @RequestParam(value = "lmsNoticeNo") int lmsNoticeNo, @RequestParam(value = "currentPage") int currentPage) {
		int rowPerPage = 10;
		int lastPage = 0; 
		int totalCount = lmsNoticeService.getLmsNoticeCount(lmsNoticeNo);
				
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage +1;
		}
		
		List<LmsNotice> LmsnoticeList = lmsNoticeService.getLmsNoticeList(lmsNoticeNo, currentPage, rowPerPage);

		model.addAttribute("currentpage", currentPage);
		model.addAttribute("lastpage", lastPage);
		model.addAttribute("lmsnoticeList", LmsnoticeList);
	
		return "";
	}
	
	
}