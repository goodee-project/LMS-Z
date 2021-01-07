package gd.fintech.lms.manager.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerMemberQueueService;
import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;

@RestController
public class ManagerIndexRestController {
	@Autowired ManagerMemberQueueService managerMemberQueueService;
	//미승인 강사의 정보를 보여주는 json출력
	@GetMapping("/manager/getTeacherQueueList")
	public Map<String, Object> getTeacherQueueList(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<TeacherQueue> teacherList = managerMemberQueueService.getTeacherQueue();
		map.put("teacherList", teacherList);
		return map;
	}
	//미승인 학생의 정보를 보여주는 json출력
	@GetMapping("/manager/getStudentQueueList")
	public Map<String, Object> getStudentQueueList(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<StudentQueue> studentList = managerMemberQueueService.getStudentQueue();
		map.put("studentList", studentList);
		return map;
	}
}
