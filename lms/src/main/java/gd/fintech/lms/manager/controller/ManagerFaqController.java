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

import gd.fintech.lms.manager.service.ManagerFaqService;
import gd.fintech.lms.manager.service.ManagerLmsNoticeService;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Controller
public class ManagerFaqController {
	@Autowired ManagerFaqService managerFaqService;
	@Autowired ManagerLmsNoticeService managerLmsNoticeService;
	
	// 카테고리 별 FAQ 리스트 출력
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
		//현재 faq카테고리 페이지에 있는지 구분하기 위해 (페이징 처리에 필요)
		model.addAttribute("currentFaqCategory", faqCategory);
		model.addAttribute("faqList",faqList);
		model.addAttribute("categoryList",categoryList);
		return "manager/faqList";
	}
	
	// FAQ 추가 폼
	@GetMapping("/manager/addFaqList/{managerId}/{currentPage}")
	public String addFaqList(Model model,
							@PathVariable(name="currentPage") int currentPage,
							@PathVariable(name="managerId") String managerId) {
		String faqWriter = managerLmsNoticeService.getManagerName(managerId);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("faqWriter",faqWriter);
		return "manager/addFaqList";
	}
	
	// FAQ 추가 액션
	@PostMapping("/manager/addFaqList/{currentPage}")
	public String addFaqList(Faq faq,
							@PathVariable(name="currentPage") int currentPage) throws UnsupportedEncodingException {
		/*
		 * redirect:/manager/faqList/"+category+"/"+currentPage 
		 * => manager/faqList/??/currentPage 한글이 깨짐
		 * => redirect url에선 ASCII아닌 문자는 사용할 수 없기 때문에
		 * 해결방안 URLEncoder 사용
		 */
		String category = URLEncoder.encode(faq.getFaqCategory(), "UTF-8");
		managerFaqService.addFaqList(faq);
		return "redirect:/manager/faqList/"+category+"/"+currentPage;
	}
}






















