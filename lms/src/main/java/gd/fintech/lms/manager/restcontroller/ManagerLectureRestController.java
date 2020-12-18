package gd.fintech.lms.manager.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerLectureService;
import gd.fintech.lms.vo.Teacher;

@RestController
public class ManagerLectureRestController {
	@Autowired ManagerLectureService managerLectureService;
	
	@PostMapping("/manager/searchTeacherId")
	public String searchTeacherId(Teacher teacher) {
		String teacherId = managerLectureService.getTeacherId(teacher);
		return teacherId;
	}
}
