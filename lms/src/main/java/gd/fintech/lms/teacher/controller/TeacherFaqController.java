package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherFaqService;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Controller
public class TeacherFaqController {
	@Autowired TeacherFaqService teacherFaqService;
	
	// 전체 FAQ 목록리스트 출력(카테고리별 FAQ 목록출력, 페이징 코드 추가 필요)
	// 카테고리별 FAQ 목록리스트 오류로 인해 주석처리 -> 해결 필요
	@GetMapping("/teacher/faqList")
	public String faqList(Model model) {
		// 카테고리별 FAQ목록 출력시 필요
		// -> @PathVariable(value="faqCategory", required = false) String faqCategory
		//if(faqCategory.equals("blank")) {
			List<Faq> faqList = teacherFaqService.getFaqList();
			//List<FaqCategory> category = teacherFaqService.getFaqCategoryList();
			model.addAttribute("faqList", faqList);
			//model.addAttribute("category", category);
		//}else {
		/*
			List<Faq> faqList = teacherFaqService.getFaqListByCategory(faqCategory);
			List<FaqCategory> category = teacherFaqService.getFaqCategoryList();
			model.addAttribute("faqCategory", faqCategory);
			model.addAttribute("faqList", faqList);
			model.addAttribute("category", category);
		}
		*/
		
		return "teacher/faqList";
	}
}
