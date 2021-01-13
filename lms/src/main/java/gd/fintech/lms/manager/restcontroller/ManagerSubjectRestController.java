package gd.fintech.lms.manager.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerSubjectService;

@RestController
public class ManagerSubjectRestController {
	@Autowired ManagerSubjectService managerSubjectService;
	//강좌에서 과목을 사용하고 있는지 체크 후 json으로 전달
	@GetMapping("/manager/subjectCk")
	public Map<String, Object> getSubjectCk(
			@RequestParam(value="subjectNo", required=false) Integer subjectNo){
		Map<String, Object> map = new HashMap<>();
		int subjectCount = managerSubjectService.getSubjectCk(subjectNo);
		map.put("subjectCount", subjectCount);
		return map;
	}
}
