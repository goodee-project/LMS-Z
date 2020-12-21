package gd.fintech.lms.manager.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.service.ManagerClassroomService;

@RestController
public class ManagerClassroomRestController {
	@Autowired ManagerClassroomService managerClassroomService;
	// 강의실 번호 중복값 체크 후 json으로 전달
		@GetMapping("/manager/classroomCk")
		public Map<String, Object> getManagerToSignupByOverLapEmail(
				@RequestParam(value="classroomNumber", required=false) int classroomNumber){
			Map<String, Object> map = new HashMap<String, Object>();
			
			int classroomNum = managerClassroomService.getClassroomNumberOverlap(classroomNumber);
				
			map.put("classroomNum", classroomNum);
				
			return map;
		}
}
