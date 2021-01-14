package gd.fintech.lms.teacher.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.service.TeacherLectureService;

@RestController
public class TeacherLectureRestController {
	@Autowired TeacherLectureService teacherLectureService;
	
	@GetMapping("/teacher/lectureImage")
	public Map<String, Object> lectureImage(
			@RequestParam(value="lectureNo") int lectureNo,
			@RequestParam(value="lectureImage") String lectureImage,
			@RequestParam(value="lectureImageColor") String lectureImageColor){
		Map<String, Object> map = new HashMap<String, Object>();
		
		teacherLectureService.modifyLectureImage(lectureNo, lectureImage, lectureImageColor);
		return map;
	}
}
