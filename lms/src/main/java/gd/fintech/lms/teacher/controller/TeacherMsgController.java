package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.teacher.service.TeacherMsgService;
import gd.fintech.lms.vo.Student;

@Controller
public class TeacherMsgController {
	@Autowired TeacherMsgService teacherMsgService;
	@Autowired TeacherLectureService teacherLectureService;
	// 강의 상세보기 -> 강의 수강중인 학생 리스트 출력
	@GetMapping("/teacher/studentList/{teacherId}/{lectureNo}")
	public String studentList(Model model,
							@PathVariable(name="teacherId") String teacherId,
							@PathVariable(name="lectureNo") int lectureNo){
		//학생 리스트
		List<Student> studentList = teacherMsgService.getLectureInStudent(teacherId,lectureNo);
		//메세지 보낸 강사 이름
		String teacherName = teacherLectureService.getLectureOne(lectureNo).getTeacherName();
		
		model.addAttribute("studentList",studentList);
		model.addAttribute("lectureNo",lectureNo);
		model.addAttribute("teacherName",teacherName);
		return "teacher/studentList";
	}
	@GetMapping("/teacher/msgToFrom/{student_Id}/{studentName}/{teacherName}/{teacherId}/{lectureNo}")
	public String msgToFrom(Model model,
							@PathVariable(name="student_Id") String student_Id,
							@PathVariable(name="studentName") String studentName,
							@PathVariable(name="teacherName") String teacherName,
							@PathVariable(name="teacherId") String teacherId,
							@PathVariable(name="lectureNo") int lectureNo) {
		model.addAttribute("student_Id",student_Id);
		model.addAttribute("studentName",studentName);
		model.addAttribute("teacherName",teacherName);
		model.addAttribute("teacherId",teacherId);
		model.addAttribute("lectureNo",lectureNo);
		return "teacher/msgToFrom";
	}
}
