package gd.fintech.lms.student.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.manager.service.ManagerConnectService;
import gd.fintech.lms.student.service.StudentInfoService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Student;

@Controller
public class StudentInfoController {
	@Autowired StudentInfoService studentInfoService;
	@Autowired ManagerConnectService managerConnectService;
	
	// 주소변경 페이지 이동
	@GetMapping("/student/myInfoAddress/{studentId}")
	public String myInfoAddress(Model model,
			@PathVariable(value="studentId") String studentId) {
		Student student = studentInfoService.getstudentByAddress(studentId);
		
		model.addAttribute("student", student);
		
		return "student/modifyAddressMyInfo";
	}
	
	// 회원 탈퇴
	@GetMapping("/student/deleteMyInfoById/{studentId}")
	public String deleteMyInfoById(
			@PathVariable(value="studentId") String studentId) {
		studentInfoService.deleteStudent(studentId);
		
		return "redirect:/studentLogin";
	}
	
	// 회원 탈퇴 페이지 이동
	@GetMapping("/student/deleteMyInfo")
	public String deleteMyInfo() {
		return "student/deleteMyInfo";
	}
	
	// 마이페이지 이미지 수정
	@PostMapping("/student/modifyImageMyInfo")
	public String modifyStudentByImage(String studentId,
			@RequestPart(value="studentImage") MultipartFile multipartFile) {
		
		//System.out.println(multipartFile.getOriginalFilename());
		//System.out.println(multipartFile.getSize());
		
		studentInfoService.modifyStudentByImage(multipartFile, studentId);
		
		return "redirect:/student/myInfo/" + studentId;
	}
	
	// 마이페이지 핸드폰 번호 수정
	@PostMapping("/student/modifyAddressMyInfo")
	public String modifyStudentByPhone(Student student) {
		
		studentInfoService.modifyStudentByAddress(student);
		
		return "redirect:/student/myInfo/" + student.getStudentId();
	}
	
	// 마이페이지 핸드폰 번호 수정
	@GetMapping("/student/modifyPhoneMyInfo/{studentId}/{studentPhone}")
	public String modifyStudentByPhone(
			@PathVariable(value="studentId") String studentId,
			@PathVariable(value="studentPhone") String studentPhone) {
		
		studentInfoService.modifyStudentByPhone(studentId, studentPhone);
		
		return "redirect:/student/myInfo/" + studentId;
	}
	
	// 마이페이지 생일 수정
	@GetMapping("/student/modifyBirthMyInfo/{studentId}/{studentBirth}")
	public String modifyStudentByBirth(
			@PathVariable(value="studentId") String studentId,
			@PathVariable(value="studentBirth") String studentBirth) {
		
		studentInfoService.modifyStudentByBirth(studentId, studentBirth);
			
		return "redirect:/student/myInfo/" + studentId;
	}
	
	// 마이페이지 성별 수정
	@GetMapping("/student/modifyGenderMyInfo/{studentId}/{studentGender}")
	public String modifyStudentByGender(
			@PathVariable(value="studentId") String studentId,
			@PathVariable(value="studentGender") String studentGender) {
		
		studentInfoService.modifyStudentByGender(studentId, studentGender);
			
		return "redirect:/student/myInfo/" + studentId;
	}
	
	// 마이페이지 이메일 수정
	@GetMapping("/student/modifyEmailMyInfo/{studentId}/{studentEmail}")
	public String modifyStudentByEmail(
			@PathVariable(value="studentId") String studentId,
			@PathVariable(value="studentEmail") String studentEmail) {
		studentInfoService.modifyStudentByEmail(studentId, studentEmail);
		
		return "redirect:/student/myInfo/" + studentId;
	}
	
	// 마이페이지 이름 수정
	@GetMapping("/student/modifyNameMyInfo/{studentId}/{studentName}")
	public String modifyStudentByName(
			@PathVariable(value="studentId") String studentId,
			@PathVariable(value="studentName") String studentName) {
		studentInfoService.modifyStudentByName(studentId, studentName);
		
		return "redirect:/student/myInfo/" + studentId;
	}
	
	// 패스워드 변경사이트 이동
	@GetMapping("/student/myInfoPw")
	public String modifyPw() {
		return "student/modifyPwMyInfo";
	}
	
	// 비밀번호가 변경 된 후에 로그아웃되고 로그인 페이지로 이동
	@PostMapping("/student/modifyPwMyInfo")
	public String modifyAccountPw(HttpSession session, Account account) {
		studentInfoService.modifyAccountPw(account);
		session.invalidate();
		
		return "redirect:/studentLogin";
	}
	
	// 강사 마이페이지 출력(강사 정보를 가져오기 위해 studentId를 받아옴)
	@GetMapping("/student/modifyMyInfo/{studentId}")
	public String modifyMyInfo(Model model,
						@PathVariable(value="studentId") String studentId) {
		// student 객체 선언하여 service의 메소드 호출 및 입력
		Student studentOne = studentInfoService.getStudentInfo(studentId);
		
		String studentPhone1 = studentOne.getStudentPhone().substring(0,3);
		String studentPhone2 = studentOne.getStudentPhone().substring(3,7);
		String studentPhone3 = studentOne.getStudentPhone().substring(7,11);			
		
		model.addAttribute("studentOne", studentOne);
		model.addAttribute("studentPhone1", studentPhone1);
		model.addAttribute("studentPhone2", studentPhone2);
		model.addAttribute("studentPhone3", studentPhone3);
		
		return "student/modifyMyInfo";
	}
	
	// 학생 마이페이지 출력(강사 정보를 가져오기 위해 studentId를 받아옴)
	@GetMapping("/student/myInfo/{studentId}")
	public String myInfo(Model model,
			@PathVariable(value="studentId") String studentId) {
		
		Student studentOne = studentInfoService.getStudentInfo(studentId);
		int connectCount = managerConnectService.getConnectCountToNo(studentId);
		model.addAttribute("studentOne", studentOne);
		model.addAttribute("connectCount", connectCount);
		
		return "student/myInfo";
	}
}
