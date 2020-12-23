package gd.fintech.lms.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerTextbookService;
import gd.fintech.lms.vo.Textbook;

@Controller
public class ManagerTextbookController {
	@Autowired ManagerTextbookService managerTextbookService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//교재 리스트를 출력하기 위한 컨트롤러
	@GetMapping("/manager/textbookList/{currentPage}")
	public String selectTextbookList(Model model,
				@PathVariable(name="currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 2;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage;
		List<Textbook> textbookList = managerTextbookService.getTextbookList(beginRow, rowPerPage);
		int totalPage = managerTextbookService.getTextbookTotalCount();
		int lastPage = 0;
		if(totalPage%rowPerPage==1) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (totalPage/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = totalPage/rowPerPage;
		}
		model.addAttribute("textbookList",textbookList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		return "/manager/textbookList";
	}
	//교재를 등록하기 위한 폼을 불러오는 컨트롤러
	@GetMapping("/manager/insertTextbook")
	public String insertTextbook() {
		return "/manager/insertTextbook";
	}
	//교재 값을 입력하고 받은 값을 등록하기 위한 컨트롤러
	@PostMapping("/manager/insertTextbookAction")
	public String insertTextbook(Textbook textbook) {
		managerTextbookService.insertTextbook(textbook);
		return "redirect:/manager/textbookList/1";
	}
	//교재의 상세정보를 출력하기 위한 컨트롤러
	@GetMapping("/manager/textbookOne/{textbookIsbn}")
	public String selectTextbookOne(Model model,
			@PathVariable(name="textbookIsbn") String textbookIsbn) {
		Textbook textbookOne = managerTextbookService.getTextbookOne(textbookIsbn);
		model.addAttribute("textbookOne",textbookOne);
		return "/manager/textbookOne";
	}
	//교재 내용을 수정하기 위한 폼을 불러오는 컨트롤러
	@GetMapping("/manager/modifyTextbookOne/{textbookIsbn}")
	public String modifyTextbookOne(Model model,
			@PathVariable(name="textbookIsbn") String textbookIsbn) {
		Textbook textbookOne = managerTextbookService.getTextbookOne(textbookIsbn);
		model.addAttribute("textbookOne",textbookOne);
		return "/manager/modifyTextbookOne";
	}
	//교재를 수정하여 적용하기 위한 컨트롤러
	@PostMapping("/manager/modifyTextbookOneAction")
	public String modifyTextbookOneAction(Textbook textbook) {
		logger.debug("textbook ->"+textbook.toString());
		managerTextbookService.updateTextbookOne(textbook);
		return "redirect:/manager/textbookOne/"+textbook.getTextbookIsbn();
	}
	//교재를 삭제하기 위한 컨트롤러
	@GetMapping("/manager/deleteTextbookOne/{textbookIsbn}")
	public String deleteTextbookOne(@PathVariable(name="textbookIsbn") String textbookIsbn) {
		managerTextbookService.deleteTextbookOne(textbookIsbn);
		return "redirect:/manager/textbookList/1";
	}
}
