package gd.fintech.lms.student.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.service.StudentMsgService;
import gd.fintech.lms.vo.Msg;

@RestController
public class StudentMsgRestController {
	@Autowired StudentMsgService studentMsgService;
	
	//메세지 리스트 출력
	@GetMapping("/student/msgList")
	public List<Msg> msgList(@RequestParam(value="studentId") String studentId,
							@RequestParam(value="teacherId") String teacherId){
		List<Msg> msgList = studentMsgService.getStudentMsgList(studentId, teacherId);
		return msgList;
	}
	
	//강사님께 메세지 보내기
	@PostMapping("/student/toTeacherMsg")
	public String toTeacherMsg(Msg msg) {
		String content = msg.getMsgContent().replaceAll("(?i)<script", "&lt;script");
		msg.setMsgContent(content);
		studentMsgService.addToteacherMsg(msg);
		
		return "success";
	}
	
	//메세지 읽음 표시
	@PostMapping("/student/studentReadMsg")
	public String studentReadMsg(Msg msg) {
		//메세지 읽었기 때문에 false->true
		studentMsgService.modifyStudentMsgRead(msg);
		return "success";
	}
}
