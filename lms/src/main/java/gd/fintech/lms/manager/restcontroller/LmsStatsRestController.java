package gd.fintech.lms.manager.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.LmsStatsRestService;

@RestController
public class LmsStatsRestController {
	@Autowired LmsStatsRestService lmsStateRestService;
	
	@GetMapping("/manager/teacherInOutCount/{year}")
	public List<Map<String, Object>> teacherInOutCount(@PathVariable(name="year") int year){
		return lmsStateRestService.getTeacherInOutCount(year);
	}
}
