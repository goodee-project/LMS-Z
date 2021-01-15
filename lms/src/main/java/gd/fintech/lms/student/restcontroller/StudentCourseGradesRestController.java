package gd.fintech.lms.student.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentCourseGradesRestService;
import gd.fintech.lms.vo.ClassRegistration;

@RestController
public class StudentCourseGradesRestController {
	@Autowired StudentCourseGradesRestService studentCourseGradesRestService;
	
	//강의별 성적 및 평균 성적 view에 전달
	@GetMapping("/chart/studentCourseGrades/{studentId}")
	public Map<String, Object> studentCouresGrades(@PathVariable(name="studentId") String studentId) {
		return studentCourseGradesRestService.getCouresGrades(studentId);
	}
	//현재 수강중인 강의 목록
	@GetMapping("/chart/allMyLectureList/{studentId}")
	public List<ClassRegistration> AllMyLectureList(@PathVariable(name="studentId") String studentId) {
		List<ClassRegistration> myLectureList = studentCourseGradesRestService.getAllMyLectureList(studentId);
		System.out.println(myLectureList);
		return myLectureList;
	}
}
