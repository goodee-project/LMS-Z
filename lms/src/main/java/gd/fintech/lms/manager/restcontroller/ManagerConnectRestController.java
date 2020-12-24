package gd.fintech.lms.manager.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerConnectService;

@RestController
public class ManagerConnectRestController {
	@Autowired ManagerConnectService managerConnectService;
	
	// json 형식으로 connect테이블 받아온 값 출력
	@GetMapping("/manager/getConnectList")
	public Map<String, Object> test() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("connectList", managerConnectService.getConnect());
		
		return map;
	}
}
