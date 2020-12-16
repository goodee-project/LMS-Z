package gd.fintech.lms.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerIndexController {
	@GetMapping(value={"/manager", "/manager/index"})
	public String index() {
		return "manager/index";
	}
}
