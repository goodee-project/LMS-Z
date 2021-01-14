package gd.fintech.lms.student.controller;

import java.util.ArrayList;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentAttendanceService;
import gd.fintech.lms.student.service.StudentLectureService;
import gd.fintech.lms.student.service.StudentMsgService;
import gd.fintech.lms.student.service.StudentTestService;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.ClassRegistrationCancel;
import gd.fintech.lms.vo.ClassRegistrationForm;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Msg;

@Controller
public class StudentLectureController {
	@Autowired StudentLectureService studentLectureService;
	@Autowired StudentMsgService studentMsgService;
	@Autowired StudentAttendanceService studentAttendanceService;
	@Autowired StudentTestService studentTestService;
	
	//페이징 처리한 전체 강의 목록 리스트
	@GetMapping("/student/lectureList/{currentPage}")
	public String lectureList(Model model,
							@PathVariable(name="currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 5;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage;
		// 페이징) 1~10 한묶음 중 첫번째 페이지
		int startPage = ((currentPage / 11) * rowPerPage) + 1;
		// 페이징 처리한 전체 강의 리스트
		List<Lecture> lectureList = studentLectureService.getLectureList(beginRow, rowPerPage); 
		// 전체 강의 목록 갯수
		int listTotal = studentLectureService.getLectureListTotal(); 
		// 마지막 페이지
		int lastPage = 0;
		// 나누어 떨어지지 않는다면 페이지 + 1
		if(listTotal%rowPerPage!=0) { 
			lastPage = (listTotal/rowPerPage)+1;
		}else{ // 나누어 떨어진다면 
			lastPage = listTotal/rowPerPage;
		}
		// 해당 강의를 신청한 학생 인원
		List<Integer> numberOfApplicants = new ArrayList<Integer>();
		for(Lecture l : lectureList) {
			numberOfApplicants.add(studentLectureService.getNumberOfApplicants(l.getLectureNo()));
		}
		model.addAttribute("numberOfApplicants",numberOfApplicants);
		model.addAttribute("lectureList",lectureList);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		return "student/lectureList";
	}
	
	// 강의목록 상세보기
	@GetMapping("/student/lectureListOne/{studentId}/{lectureNo}/{lectureTotal}/{currentPage}/{applicants}")
	public String lectureListOne(Model model,
								@PathVariable(name="studentId") String studentId,
								@PathVariable(name="lectureNo") int lectureNo,
								@PathVariable(name="lectureTotal") int lectureTotal,
								@PathVariable(name="currentPage") int currentPage,
								@PathVariable(name="applicants") int applicants){
		// 강의 정보
		Lecture lectureOne = studentLectureService.getLectureListOne(lectureNo);
		// ==== 강의 신청 여부 체크 ====
		boolean classRegistrationCk = false;
		if(studentLectureService.getClassRegistrationCk(studentId, lectureNo) != 0) {
			classRegistrationCk = true;
		}
		//=====강의 정원 체크 (값이 있다면 true,없다면 false줄 예정) 중복신청방지  ======
		boolean classPersonalCheck = false;
		if(studentLectureService.getCanIApplicant(lectureNo, lectureTotal) != 0) {
			classPersonalCheck = true;
		}
		//===== 강의 신청 정원이 강의 수강 인원과 같다면 true => 신청하는 것을 막기 위해
		boolean numberOfApplicants = false;
		if(lectureOne.getLectureTotal() == applicants) {
			numberOfApplicants = true;
		}
		model.addAttribute("classRegistrationCk",classRegistrationCk);
		model.addAttribute("lectureOne",lectureOne);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("classPersonalCheck",classPersonalCheck);
		model.addAttribute("lectureTotal",lectureTotal);
		model.addAttribute("numberOfApplicants",numberOfApplicants);
		model.addAttribute("applicants",applicants);
		return "student/lectureListOne";
	}
	// 수강 신청
	@GetMapping("/student/classRegistration/{studentId}/{lectureNo}/{lectureTotal}/{currentPage}/{applicants}")
	public String classRegistration(@PathVariable(name="studentId") String studentId,
									@PathVariable(name="lectureNo") int lectureNo,
									@PathVariable(name="lectureTotal") int lectureTotal,
									@PathVariable(name="currentPage") int currentPage,
									@PathVariable(name="applicants") int applicants) {
		// 나의 강의목록에 추가
		studentLectureService.addClassRegistration(studentId,lectureNo);
		return "redirect:/student/lectureListOne/"+studentId+"/"+lectureNo+"/"+lectureTotal+"/"+currentPage+"/"+applicants;
	}
	
	//나의 강의목록 리스트 출력
	@GetMapping("/student/myLectureList/{studentId}/{currentPage}")
	public String myLectureList(Model model,
							@PathVariable(name="studentId") String studentId,
							@PathVariable(name="currentPage") int currentPage) {
		// page당 목록 갯수
		int rowPerPage = 5;
		// 시작 목록
		int beginRow = (currentPage-1)*rowPerPage; 
		// 페이징) 1~10 한묶음 중 첫번째 페이지
		int startPage = ((currentPage / 11) * rowPerPage) + 1;
		// 페이징 처리한 나의 강의 현황 리스트
		List<ClassRegistration> myLectureList = studentLectureService.getMyLectureList(studentId, beginRow, rowPerPage); 
		// 전체 나의 강의 목록 갯수
		int listTotal = studentLectureService.getMyLectureListTotal(studentId); 
		// 마지막 페이지
		int lastPage = 0;
		if(listTotal%rowPerPage!=0) { // 나누어 떨어지지 않는다면 페이지 + 1
			lastPage = (listTotal/rowPerPage)+1;
		}else { // 나누어 떨어진다면 
			lastPage = listTotal/rowPerPage;
		}
		
		//강의 종료일이 되면 과락 수료 처리 (취소한 강의는 제외)
		for(ClassRegistration c : myLectureList) {
			if(c.getClassRegistrationState().equals("수강중") && studentLectureService.getLectureEnddate(c.getLecture().getLectureNo())<=0) {
				// 해당 강의에 출석한 횟수
				int attendance = studentAttendanceService.getAttendanceTotal(studentId, c.getLecture().getLectureNo());
				float attendancePer = 0;
				int totalLectureDays = studentAttendanceService.getTotalLectureDays(
						c.getLecture().getLectureStartdate(), 
						c.getLecture().getLectureEnddate(),
						c.getLecture().getLectureNo());
				if(attendance != 0) {
					attendancePer = ((float)attendance/(float)totalLectureDays)*(float)100;
				}else {
					attendancePer=0;
				}
				
				// 해당 강의의 과제 점수
				int myReportScore = 0;
				if(studentLectureService.getReportAvg(c.getLecture().getLectureNo(), studentId) != 0) {
					myReportScore = studentLectureService.getReportAvg(c.getLecture().getLectureNo(), studentId);
				}
				
				// 해당 강의의 시험 점수
				int myTestScore = 0;
				if(studentTestService.getTestScore(c.getLecture().getLectureNo(), studentId) != 0) {
					myTestScore = studentTestService.getTestScore(c.getLecture().getLectureNo(), studentId);
				}
				
				//출석 30%
				int attendanceScore = (int)attendancePer*(3/10);
				//과제 30%
				int reportScore = myReportScore*(3/10);
				//시험 40%
				int testScore = myTestScore*(4/10);
				if(attendanceScore + reportScore + testScore >= 50) {
					c.setClassRegistrationState("수료");
					studentLectureService.modifyMyLectureState(c.getClassRegistrationState(), studentId, c.getLecture().getLectureNo());
				}else {
					c.setClassRegistrationState("과락");
					studentLectureService.modifyMyLectureState(c.getClassRegistrationState(), studentId, c.getLecture().getLectureNo());
				}
			}
		}
		model.addAttribute("myLectureList",myLectureList);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		return "student/myLectureList";
	}
	//==== 나의 수강 현황 상세보기 ====
	@GetMapping("/student/myLectureListOne/{studentId}/{lectureNo}/{currentPage}")
	public String myLectureListOne(Model model,
								@PathVariable(name="studentId") String studentId,
								@PathVariable(name="lectureNo") int lectureNo,
								@PathVariable(name="currentPage") int currentPage) {
		// 강의실 정보
		ClassRegistrationForm myLectureListOne = studentLectureService.getMyLectureListOne(studentId, lectureNo);
		
		// 읽을 메세지가 있는지 없는지 체크하기 위해
		// 리스트 형식으로 가져왔기 때문에 forEach로 jsp에서 불러오면 ㅁ표시가 여러개 출력
		// controller에서 않읽은 메세지가 있는지 없는지 판별 후 jsp에 뿌려주도록 함 
		boolean isConfirm = true;
		List<Msg> isConfirmList = studentMsgService.getMsgReadCheck(myLectureListOne.getLecture().getAccountId(), studentId);
		
		for(Msg s : isConfirmList) {
			if(s.getIsConfirm()==false) {
				isConfirm = false;
			}
		}
		
		System.out.println("-------------"+isConfirm);
		model.addAttribute("myLectureListOne",myLectureListOne);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("isConfirm",isConfirm);
		return "student/myLectureListOne";
	}
	//==== 수료한 수강생들만 사용할 수 있는 수강 후기 작성 =====
	@PostMapping("/student/lectureReview/{currentPage}")
	public String lectureReview(ClassRegistration classRegistration,
								@PathVariable(name="currentPage") int currentPage) {
		//스크립트 방지
		String content = classRegistration.getClassRegistrationReview().replaceAll("(?i)<script", "&lt;script");
		classRegistration.setClassRegistrationReview(content);
		studentLectureService.modifyLectureReview(classRegistration);
		return "redirect://student/myLectureListOne/"+classRegistration.getAccountId()+"/"+classRegistration.getLectureNo()+"/"+currentPage;
	}
	//=== 승인 대기중인 강의 취소 ====
	@GetMapping("/student/WaitingClassCancel/{classRegistrationNo}/{studentId}/{currentPage}")
	public String WaitingClassCancel(@PathVariable(name="classRegistrationNo") int classRegistrationNo,
									@PathVariable(name="studentId") String studentId,
									@PathVariable(name="currentPage") int currentPage){
		studentLectureService.removeWaitingClassCancel(classRegistrationNo);
		return "redirect:/student/myLectureList/"+studentId+"/"+currentPage;
	}
	// ==== 수강 중 취소한 학생의 사유 입력 ====
	@PostMapping("/student/reasonForCancellation/{studentId}/{lectureNo}/{currentPage}")
	public String reasonForCancellation(ClassRegistrationCancel classRegistrationCancel,
										@PathVariable(name="studentId") String studentId,
										@PathVariable(name="lectureNo") int lectureNo,
										@PathVariable(name="currentPage") int currentPage) {
		// 수강 취소 사유 추가
		studentLectureService.addReasonForCancellation(classRegistrationCancel);
		studentLectureService.modifyClassStateChange(classRegistrationCancel.getClassRegistrationNo());
		return "redirect:/student/myLectureListOne/"+studentId+"/"+lectureNo+"/"+currentPage;
	}
}


















