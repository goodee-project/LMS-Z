package gd.fintech.lms.manager.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerLectureService;
import gd.fintech.lms.vo.Teacher;

@RestController
public class ManagerLectureRestController {
	@Autowired ManagerLectureService managerLectureService;
	
	//강좌개설할 때 선택할 강사 선택 -> 동명이인이 존재할 수 있으므로 강사의 정보에 일치하는 teacherId를 가져오는 것이 목적
	@PostMapping("/manager/searchTeacherId")
	public String searchTeacherId(Teacher teacher) {
		String teacherId = managerLectureService.getTeacherId(teacher);
		return teacherId;
	}
}
