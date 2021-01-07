package gd.fintech.lms.teacher.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerConnectService;
import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.vo.Lecture;

@RestController
public class TeacherIndexRestController {
	@Autowired ManagerConnectService managerConnectService;
	@Autowired TeacherLectureService teacherLectureService;
	
	// 아래 조건을 만족하는 방문자 수를 json으로 출력
	@GetMapping("/teacher/getConnectList")
	public Map<String, Object> getConnect(){
		Map<String, Object> map = new HashMap<String, Object>();
			
		List<Map<String, Object>> connectList = managerConnectService.getConnect();
		map.put("connectList", connectList);
			
		return map;
	}
	
	// 현재 강사가 맡고 있는 강의
	@GetMapping("/teacher/getLecture/{teacherId}")
	public List<Lecture> getLecture(@PathVariable(name="teacherId") String teacherId){
		List<Lecture> lectureList = teacherLectureService.getLectureList(teacherId, 0, 5);
		return lectureList;
	}
}
