package gd.fintech.lms.teacher.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.service.TeacherMsgService;
import gd.fintech.lms.vo.Msg;

@RestController
public class TeacherMsgRestController {
	@Autowired TeacherMsgService teacherMsgService;
	//메세지 리스트 출력
		@GetMapping("/teacher/msgList")
		public List<Msg> msgList(@RequestParam(value="studentId") String studentId,
								@RequestParam(value="teacherId") String teacherId){
			List<Msg> msgList = teacherMsgService.getTeacherMsgList(studentId, teacherId);
			return msgList;
		}
		
		//강사님께 메세지 보내기
		@PostMapping("/teacher/toStudentMsg")
		public String toStudentMsg(Msg msg) {
			String content = msg.getMsgContent().replaceAll("(?i)<script", "&lt;script");
			msg.setMsgContent(content);
			teacherMsgService.addToStudentMsg(msg);
			
			return "success";
		}
		
		//메세지 읽음 표시
		@PostMapping("/teacher/teacherReadMsg")
		public String teacherReadMsg(Msg msg) {
			//메세지 읽었기 때문에 false->true
			teacherMsgService.modifyTeacherMsgRead(msg);
			return "success";
		}
}



/*
 student에 있는 Msg MVC와 코드가 같아 같이 쓰려고 했는데 안됨!!!!!!!!!!
 왜>/....
 teacher view에서 student RestController에 접근하려니까
 filter에 걸려서 접근이 안되고
 success(data)에는 studentLogin.jsp 코드들이 불러져 온다. 
 */
