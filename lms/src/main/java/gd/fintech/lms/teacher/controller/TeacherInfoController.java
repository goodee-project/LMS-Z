package gd.fintech.lms.teacher.controller;

import javax.servlet.http.HttpServletRequest;
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
import gd.fintech.lms.teacher.service.TeacherInfoService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;

@Controller
public class TeacherInfoController {
	@Autowired TeacherInfoService teacherInfoService;
	@Autowired ManagerConnectService managerConnectService;
	
	// 주소변경 페이지 이동
	@GetMapping("/teacher/myInfoAddress/{teacherId}")
	public String myInfoAddress(Model model,
			@PathVariable(value="teacherId") String teacherId) {
		Teacher teacher = teacherInfoService.getTeacherByAddress(teacherId);
		
		model.addAttribute("teacher", teacher);
		
		return "teacher/modifyAddressMyInfo";
	}
	
	// 회원 탈퇴
	@GetMapping("/teacher/deleteMyInfoById/{teacherId}")
	public String deleteMyInfoById(HttpSession session,
			@PathVariable(value="teacherId") String teacherId) {
		teacherInfoService.deleteTeacher(teacherId);
		
		session.invalidate();
		
		return "redirect:/teacherLogin";
	}
	
	// 회원 탈퇴 페이지 이동
	@GetMapping("/teacher/deleteMyInfo")
	public String deleteMyInfo() {
		return "teacher/deleteMyInfo";
	}
	
	// 마이페이지 이미지 수정
	@PostMapping("/teacher/modifyImageMyInfo")
	public String modifyTeacherByImage(String teacherId,
			@RequestPart(value="teacherImage") MultipartFile multipartFile) {
		
		//System.out.println(multipartFile.getOriginalFilename());
		//System.out.println(multipartFile.getSize());
		
		teacherInfoService.modifyTeacherByImage(multipartFile, teacherId);
		
		return "redirect:/teacher/myInfo/" + teacherId;
	}
	
	// 마이페이지 핸드폰 번호 수정
	@PostMapping("/teacher/modifyAddressMyInfo")
	public String modifyTeacherByPhone(Teacher teacher) {
		
		teacherInfoService.modifyTeacherByAddress(teacher);
		
		return "redirect:/teacher/myInfo/" + teacher.getTeacherId();
	}
	
	// 마이페이지 핸드폰 번호 수정
	@GetMapping("/teacher/modifyInfoMyInfo/{teacherId}/{teacherInfo}")
	public String modifyTeacherByInfo(
			@PathVariable(value="teacherId") String teacherId,
			@PathVariable(value="teacherInfo") String teacherInfo) {
		
		teacherInfoService.modifyTeacherByInfo(teacherId, teacherInfo);
		
		return "redirect:/teacher/myInfo/" + teacherId;
	}
	
	// 마이페이지 핸드폰 번호 수정
	@GetMapping("/teacher/modifyPhoneMyInfo/{teacherId}/{teacherPhone}")
	public String modifyTeacherByPhone(
			@PathVariable(value="teacherId") String teacherId,
			@PathVariable(value="teacherPhone") String teacherPhone) {
		
		teacherInfoService.modifyTeacherByPhone(teacherId, teacherPhone);
		
		return "redirect:/teacher/myInfo/" + teacherId;
	}
	
	// 마이페이지 생일 수정
	@GetMapping("/teacher/modifyBirthMyInfo/{teacherId}/{teacherBirth}")
	public String modifyTeacherByBirth(
			@PathVariable(value="teacherId") String teacherId,
			@PathVariable(value="teacherBirth") String teacherBirth) {
		
		teacherInfoService.modifyTeacherByBirth(teacherId, teacherBirth);
			
		return "redirect:/teacher/myInfo/" + teacherId;
	}
	
	// 마이페이지 성별 수정
	@GetMapping("/teacher/modifyGenderMyInfo/{teacherId}/{teacherGender}")
	public String modifyTeacherByGender(
			@PathVariable(value="teacherId") String teacherId,
			@PathVariable(value="teacherGender") String teacherGender) {
		
		teacherInfoService.modifyTeacherByGender(teacherId, teacherGender);
			
		return "redirect:/teacher/myInfo/" + teacherId;
	}
	
	// 마이페이지 이메일 수정
	@GetMapping("/teacher/modifyEmailMyInfo/{teacherId}/{teacherEmail}")
	public String modifyTeacherByEmail(
			@PathVariable(value="teacherId") String teacherId,
			@PathVariable(value="teacherEmail") String teacherEmail) {
		teacherInfoService.modifyTeacherByEmail(teacherId, teacherEmail);
		
		return "redirect:/teacher/myInfo/" + teacherId;
	}
	
	// 마이페이지 이름 수정
	@GetMapping("/teacher/modifyNameMyInfo/{teacherId}/{teacherName}")
	public String modifyTeacherByName(
			@PathVariable(value="teacherId") String teacherId,
			@PathVariable(value="teacherName") String teacherName) {
		teacherInfoService.modifyTeacherByName(teacherId, teacherName);
		
		return "redirect:/teacher/myInfo/" + teacherId;
	}
	
	// 패스워드 변경사이트 이동
	@GetMapping("/teacher/myInfoPw")
	public String modifyPw() {
		return "teacher/modifyPwMyInfo";
	}
	
	// 비밀번호가 변경 된 후에 로그아웃되고 로그인 페이지로 이동
	@PostMapping("/teacher/modifyPwMyInfo")
	public String modifyAccountPw(HttpSession session, Account account) {
		teacherInfoService.modifyAccountPw(account);
		session.invalidate();
		
		return "redirect:/teacherLogin";
	}
	
	// 강사 마이페이지 출력(강사 정보를 가져오기 위해 teacherId를 받아옴)
	@GetMapping("/teacher/modifyMyInfo/{teacherId}")
	public String modifyMyInfo(Model model,
						@PathVariable(value="teacherId") String teacherId) {
		// teacher 객체 선언하여 service의 메소드 호출 및 입력
		Teacher teacherOne = teacherInfoService.getTeacherInfo(teacherId);
		
		String teacherPhone1 = teacherOne.getTeacherPhone().substring(0,3);
		String teacherPhone2 = teacherOne.getTeacherPhone().substring(3,7);
		String teacherPhone3 = teacherOne.getTeacherPhone().substring(7,11);			
		
		model.addAttribute("teacherOne", teacherOne);
		model.addAttribute("teacherPhone1", teacherPhone1);
		model.addAttribute("teacherPhone2", teacherPhone2);
		model.addAttribute("teacherPhone3", teacherPhone3);
		
		return "teacher/modifyMyInfo";
	}
	
	// 강사 마이페이지 출력(강사 정보를 가져오기 위해 teacherId를 받아옴)
	@GetMapping("/teacher/myInfo/{teacherId}")
	public String myInfo(Model model,
			@PathVariable(value="teacherId") String teacherId) {
		
		Teacher teacherOne = teacherInfoService.getTeacherInfo(teacherId);
		int connectCount = managerConnectService.getConnectCountToNo(teacherId);
		model.addAttribute("teacherOne", teacherOne);
		model.addAttribute("connectCount", connectCount);
		
		return "teacher/myInfo";
	}
}
