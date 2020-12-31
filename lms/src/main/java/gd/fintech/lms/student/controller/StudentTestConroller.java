package gd.fintech.lms.student.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentTestService;
import gd.fintech.lms.teacher.service.TeacherTestService;
import gd.fintech.lms.vo.AnswerSheet;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.Test;

@Controller
public class StudentTestConroller {
	@Autowired TeacherTestService teacherTestService;
	@Autowired StudentTestService studentTestService;
	
	// 시험목록 출력
	// 각 강의당 시험이 하나이므로 페이징은 추가안함
	@GetMapping("/student/testList/{lectureNo}")
	public String testList(Model model,
							@PathVariable(name="lectureNo") int lectureNo) {
		Test test = teacherTestService.getTestList(lectureNo);
		model.addAttribute("test", test);
		
		return "student/testList";
	}
	
	// 시험문제목록 출력
	@GetMapping("/student/testQuestionList/{lectureNo}/{studentId}/{currentPage}")
	public String teacherQuestionList(Model model,
										@PathVariable(name="lectureNo") int lectureNo,
										@PathVariable(name="studentId") String studentId,
										@PathVariable(name="currentPage") int currentPage) {
		List<Multiplechoice> multiplechoice = teacherTestService.getTestQuestionList(lectureNo);
		
		// 채점 점수
		String testScore = "";
		if(studentTestService.getTestScore(lectureNo, studentId) != null) {
			testScore = studentTestService.getTestScore(lectureNo, studentId);
		}
		//시험 전부 제출했는지 않했는지 체크
		int AllTestAnswer = studentTestService.getAllTestAnswer(lectureNo, studentId);
		boolean allTestAnswerCk=false;
		if(multiplechoice.size() == AllTestAnswer) {
			allTestAnswerCk = true;
		}else {
			allTestAnswerCk=false;
		}
		
		// 시험 문제 제출 유무 체크 => true 시험제출 , false 시험 미제출
		List<AnswerSheet> testAnswer = studentTestService.getTestAnswer(studentId);
		
		//System.out.println(testScore);
		model.addAttribute("multiplechoice", multiplechoice);
		// 페이지 뒤로 이동 기능을 위해 model로 view에 뿌려준다
		model.addAttribute("lectureNo",lectureNo);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("testScore",testScore);
		model.addAttribute("testAnswer",testAnswer);
		model.addAttribute("allTestAnswerCk",allTestAnswerCk);
		return "student/testQuestionList";
	}

	// 시험문제 상세보기
	@GetMapping("/student/testQuestionOne/{multiplechoiceNo}/{lectureNo}/{currentPage}")
	public String teacherQuestionOne(Model model,
									@PathVariable(name="multiplechoiceNo") int multiplechoiceNo,
									@PathVariable(name="lectureNo") int lectureNo,
									@PathVariable(name="currentPage") int currentPage) {
		Multiplechoice testOne = teacherTestService.getTestQuestionOne(multiplechoiceNo);
		model.addAttribute("testOne", testOne);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lectureNo",lectureNo);
		return "student/testQuestionOne";
	}
	
	// 객관식 문제 제출
	@PostMapping("/student/answerMultiplechoice/{lectureNo}/{studentId}/{currentPage}")
	public String answerMultichoic(AnswerSheet answerSheet,
								@PathVariable(name="lectureNo") int lectureNo,
								@PathVariable(name="studentId") String studentId,
								@PathVariable(name="currentPage") int currentPage) {
		
		// 문제 답이 틀렸다면 db- answerSheet테이블에 score 0점 처리
		// 해당 문제의 답
		String questionAnswer = teacherTestService.getTestQuestionOne(answerSheet.getMultiplechoiceNo()).getMultiplechoiceAnswer();
		// 학생이 제출한 해당 문제의 답
		String studentAnswer = answerSheet.getAnswerSelect();
		// 문제의 답과 학생의 답을 비교 => 맞지 않는다면 score=0으로 변경
		if(!questionAnswer.equals(studentAnswer)) {
			answerSheet.setScore(0);
		}
		
		studentTestService.addAnswerMultiplechoice(answerSheet);
		return "redirect:/student/testQuestionList/"+lectureNo+"/"+studentId+"/"+currentPage;
	}
}
