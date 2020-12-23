package gd.fintech.lms.manager.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerLectureService;

@RestController
public class ManagerTextbookRestController {
	@Autowired ManagerLectureService managerLectureService;
	//강좌에서 교재를 사용하고 있는지 체크 후 json으로 전달
	@GetMapping("/manager/textbookCk")
	public Map<String, Object> getTextbookCk(
			@RequestParam(value="textbookIsbn", required=false) String textbookIsbn){
		Map<String, Object> map = new HashMap<>();
		int textbookCount = managerLectureService.getTextbookCk(textbookIsbn);
		map.put("textbookCount", textbookCount);
		return map;
	}
}
