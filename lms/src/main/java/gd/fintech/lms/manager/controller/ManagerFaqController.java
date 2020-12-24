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
	@Autowired
	ManagerFaqService managerFaqService;
	@Autowired
	ManagerLmsNoticeService managerLmsNoticeService;

	// 카테고리 별 FAQ 리스트 출력
	@GetMapping("/manager/faqList/{faqCategory}/{currentPage}")
	public String faqList(Model model, @PathVariable(name = "faqCategory") String faqCategory,
			@PathVariable(name = "currentPage") int currentPage) {
		String faqTitle="";
		// 페이지 당 리스트 갯수
		int rowPerPage = 5;
		// 페이지 별 시작 리스트
		int beginRow = (currentPage - 1) * rowPerPage;
		// 페이징) 1~10 한묶음 중 첫번째 페이지
		int startPage = ((currentPage / 11) * rowPerPage) + 1;
		// 페이징) 카테고리 별 전체 리스트 갯수
		int totalRow = managerFaqService.getFaqTotal(faqCategory);
		// 페이징) 마지막 페이지
		int lastPage = 0;
		if (totalRow % rowPerPage != 0) {
			lastPage = (totalRow / rowPerPage) + 1;
		} else {
			lastPage = totalRow / rowPerPage;
		}
		// 데이터마다 갖고 있는 no값이 1,2,3처럼 규칙이 없기 때문에
		// UI에서는 규칙적인 NO를 보여주기 위해
		int ruleNo = (totalRow-(rowPerPage*(currentPage-1)));
		// 카테고리 별 faq 리스트
		List<Faq> faqList = managerFaqService.getFaqList(beginRow, rowPerPage, faqCategory);
		// 카테고리 리스트
		List<FaqCategory> categoryList = managerFaqService.getFaqCategoryList();

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		// 데이터마다 갖고 있는 no값이 1,2,3처럼 규칙이 없기 때문에
		// UI에서는 규칙적인 NO를 보여주기 위해
		model.addAttribute("ruleNo", ruleNo);
		// 현재 faq카테고리 페이지에 있는지 구분하기 위해 (페이징 처리에 필요)
		model.addAttribute("currentFaqCategory", faqCategory);
		model.addAttribute("faqList", faqList);
		model.addAttribute("categoryList", categoryList);
		// 전체 또는 검색했을 때 페이지 번호에 정해진 url이 달라져야하기 때문에
		model.addAttribute("faqTitle",faqTitle);
		
		return "manager/faqList";
	}

	//검색했을 때 일치하는 FAQ 리스트 출력
	@GetMapping("/manager/faqList/{faqTitle}/{faqCategory}/{currentPage}")
	public String faqList(Model model, 
			@PathVariable(name = "faqTitle") String faqTitle,
			@PathVariable(name = "faqCategory") String faqCategory,
			@PathVariable(name = "currentPage") int currentPage) {
		// 페이지 당 리스트 갯수
		int rowPerPage = 5;
		// 페이지 별 시작 리스트
		int beginRow = (currentPage - 1) * rowPerPage;
		// 페이징) 1~10 한묶음 중 첫번째 페이지
		int startPage = ((currentPage / 11) * rowPerPage) + 1;
		// 페이징) 검색했을 때 일치하는 DB데이터 총 개수
		int totalRow = managerFaqService.getSearchTotal(faqTitle, faqCategory);
		// 페이징) 마지막 페이지
		int lastPage = 0;
		if (totalRow % rowPerPage != 0) {
			lastPage = (totalRow / rowPerPage) + 1;
		} else {
			lastPage = totalRow / rowPerPage;
		}
		// 데이터마다 갖고 있는 no값이 1,2,3처럼 규칙이 없기 때문에
		// UI에서는 규칙적인 NO를 보여주기 위해
		int ruleNo = (totalRow-(rowPerPage*(currentPage-1)));
		// 카테고리 별 faq 리스트
		List<Faq> faqList = managerFaqService.getSearchFaqList(faqTitle, faqCategory, beginRow, rowPerPage);
		// 카테고리 리스트
		List<FaqCategory> categoryList = managerFaqService.getFaqCategoryList();

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		// 데이터마다 갖고 있는 no값이 1,2,3처럼 규칙이 없기 때문에
		// UI에서는 규칙적인 NO를 보여주기 위해
		model.addAttribute("ruleNo", ruleNo);
		// 현재 faq카테고리 페이지에 있는지 구분하기 위해 (페이징 처리에 필요)
		model.addAttribute("currentFaqCategory", faqCategory);
		model.addAttribute("faqList", faqList);
		model.addAttribute("categoryList", categoryList);
		// 전체 또는 검색했을 때 페이지 번호에 정해진 url이 달라져야하기 때문에
		model.addAttribute("faqTitle",faqTitle);

		return "manager/faqList";
	}

	// FAQ 추가 폼
	@GetMapping("/manager/addFaqList/{managerId}/{currentPage}")
	public String addFaqList(Model model, @PathVariable(name = "currentPage") int currentPage,
			@PathVariable(name = "managerId") String managerId) {
		//FAQ 작성하는 매니저 이름 자동 출력
		String faqWriter = managerLmsNoticeService.getManagerName(managerId);
		// 카테고리 리스트
		List<FaqCategory> categoryList = managerFaqService.getFaqCategoryList();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("faqWriter", faqWriter);
		model.addAttribute("categoryList", categoryList);
		return "manager/addFaqList";
	}

	// FAQ 추가 액션
	@PostMapping("/manager/addFaqList/{currentPage}")
	public String addFaqList(Faq faq, @PathVariable(name = "currentPage") int currentPage)
			throws UnsupportedEncodingException {
		/*
		 * redirect:/manager/faqList/"+category+"/"+currentPage =>
		 * manager/faqList/??/currentPage 한글이 깨짐 => redirect url에선 ASCII아닌 문자는 사용할 수 없기
		 * 때문에 해결방안 URLEncoder 사용
		 */
		String category = URLEncoder.encode(faq.getFaqCategory(), "UTF-8");

		// 스크립트가 db접근 하는 것을 방지
		String title = faq.getFaqTitle().replaceAll("(?i)<script", "&lt;script");
		faq.setFaqTitle(title);
		String content = faq.getFaqContent().replaceAll("(?i)<script", "&lt;script");
		faq.setFaqContent(content);

		managerFaqService.addFaqList(faq);

		return "redirect:/manager/faqList/" + category + "/" + currentPage;
	}

	// FAQ 조회수
	@GetMapping("/manager/faqCountUp/{faqNo}/{currentPage}")
	public String faqCountUp(@PathVariable(name = "faqNo") int faqNo,
			@PathVariable(name = "currentPage") int currentPage) {
		managerFaqService.modifyFaqCountUp(faqNo);
		return "redirect:/manager/faqOne/" + faqNo + "/" + currentPage;
	}

	// FAQ 상세보기
	@GetMapping("/manager/faqOne/{faqNo}/{currentPage}")
	public String faqOne(Model model, @PathVariable(name = "faqNo") int faqNo,
			@PathVariable(name = "currentPage") int currentPage) {
		// 조회할 FAQ 정보 가져오기
		Faq faqOne = managerFaqService.getFaqOne(faqNo);

		model.addAttribute("faqOne", faqOne);
		model.addAttribute("currentPage", currentPage);
		return "manager/faqOne";
	}

	// FAQ 수정 폼
	@GetMapping("manager/modifyFaq/{faqNo}/{currentPage}")
	public String modifyFaq(Model model, @PathVariable(name = "faqNo") int faqNo,
			@PathVariable(name = "currentPage") int currentPage) {
		// 수정할 FAQ 정보 가져오기
		Faq faqOne = managerFaqService.getFaqOne(faqNo);
		// 카테고리 수정 칸에 현재 카테고리를 selected하기 위해
		String category = faqOne.getFaqCategory();
		// 카테고리 리스트
		List<FaqCategory> categoryList = managerFaqService.getFaqCategoryList();

		model.addAttribute("faqOne", faqOne);
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("currentPage", currentPage);
		return "manager/modifyFaq";
	}

	// FAQ 수정 액션
	@PostMapping("manager/modifyFaq/{currentPage}")
	public String modifyFaq(Faq faq, @PathVariable(name = "currentPage") int currentPage) {
		// db에 스크립트 접근 방지
		String title = faq.getFaqTitle().replaceAll("(?i)<script", "&lt;script");
		faq.setFaqTitle(title);
		String content = faq.getFaqContent().replaceAll("(?i)<script", "&lt;script");
		faq.setFaqContent(content);

		managerFaqService.modifyFaqList(faq);

		return "redirect:/manager/faqOne/" + faq.getFaqNo() + "/" + currentPage;
	}

	// FAQ 삭제 액션
	@GetMapping("manager/removeFaq/{faqCategory}/{faqNo}/{currentPage}")
	public String removeFaq(@PathVariable(name = "faqCategory") String faqCategory,
			@PathVariable(name = "faqNo") int faqNo, @PathVariable(name = "currentPage") int currentPage)
			throws UnsupportedEncodingException {
		// redirect url에 한글 사용하기 위해 ASKII코드로 변경
		String category = URLEncoder.encode(faqCategory, "UTF-8");
		managerFaqService.removeFaqOne(faqNo);
		return "redirect:/manager/faqList/" + category + "/" + currentPage;
	}
}
