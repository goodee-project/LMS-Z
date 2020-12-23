package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.ManagerFaqService;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Controller
public class ManagerFaqController {
	@Autowired ManagerFaqService managerFaqService;
	
	@GetMapping("/manager/faqList/{faqCategory}/{currentPage}")
	public String faqList(Model model,
						@PathVariable(name="faqCategory") String faqCategory,
						@PathVariable(name="currentPage") int currentPage) {
		// 페이지 당 리스트 갯수
		int rowPerPage=5;
		// 페이지 별 시작 리스트
		int beginRow = (currentPage-1)*rowPerPage;
		// 페이징) 1~5 한묶음 중 첫번째 페이지
		int startPage = (currentPage/(rowPerPage+1)*rowPerPage)+1;
		// 페이징) 카테고리 별 전체 리스트 갯수
		int totalRow = managerFaqService.getFaqTotal(faqCategory);
		// 페이징) 마지막 페이지
		int lastPage = 0;
		if(totalRow%rowPerPage!=0) {
			lastPage = (totalRow/rowPerPage)+1;
		}else {
			lastPage=totalRow/rowPerPage;
		}
		//카테고리 별 faq 리스트
		List<Faq> faqList = managerFaqService.getManagerFaqList(beginRow, rowPerPage, faqCategory);
		//카테고리 리스트
		List<FaqCategory> categoryList = managerFaqService.getFaqCategoryList();
		
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("faqList",faqList);
		model.addAttribute("categoryList",categoryList);
		return "manager/faqList";
	}
}
