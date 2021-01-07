package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.ManagerLmsNoticeService;
import gd.fintech.lms.vo.LmsNotice;

@Controller
public class ManagerIndexController {
	@Autowired ManagerLmsNoticeService managerLmsNoticeService;
	
	@GetMapping(value={"/manager", "/manager/index"})
	public String index(Model model) {
		int currentPage = 1;
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
		
		return "manager/index";
	}
}
