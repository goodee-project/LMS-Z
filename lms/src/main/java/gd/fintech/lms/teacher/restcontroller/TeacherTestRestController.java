package gd.fintech.lms.teacher.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.service.TeacherTestService;

@RestController
public class TeacherTestRestController {
	@Autowired TeacherTestService teacherTestService;
	
	// 시험문제번호 중복체크
	@GetMapping("/teacher/questionIdOverlap")
	public Map<String, Integer> getQuestionIdOverlap(@RequestParam(value="lectureNo") int lectureNo,
													@RequestParam(value="multiplechoiceId") int multiplechoiceId){
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int questionId = teacherTestService.getMultiplechoiceIdOverlap(lectureNo, multiplechoiceId);
		map.put("questionId", questionId);
		return map;
	}
}
