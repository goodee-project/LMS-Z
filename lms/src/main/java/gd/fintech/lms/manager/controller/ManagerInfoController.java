package gd.fintech.lms.manager.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import gd.fintech.lms.manager.service.ManagerConnectService;
import gd.fintech.lms.manager.service.ManagerInfoService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import jdk.internal.org.jline.utils.Log;

@Controller
public class ManagerInfoController {
	@Autowired ManagerInfoService managerInfoService;
	@Autowired ManagerConnectService managerConnectService;
	
	// 주소변경 페이지 이동
	@GetMapping("/manager/myInfoAddress/{managerId}")
	public String myInfoAddress(Model model,
			@PathVariable(value="managerId") String managerId) {
		Manager manager = managerInfoService.getManagerByAddress(managerId);
		
		model.addAttribute("manager", manager);
		
		return "manager/modifyAddressMyInfo";
	}
	
	// 회원 탈퇴
	@GetMapping("/manager/deleteMyInfoById/{managerId}")
	public String deleteMyInfoById(
			@PathVariable(value="managerId") String managerId) {
		managerInfoService.deleteManager(managerId);
		
		return "redirect:/managerLogin";
	}
	
	// 회원 탈퇴 페이지 이동
	@GetMapping("/manager/deleteMyInfo")
	public String deleteMyInfo() {
		return "manager/deleteMyInfo";
	}
	
	// 마이페이지 이미지 수정
	@PostMapping("/manager/modifyImageMyInfo")
	public String modifyManagerByImage(String managerId,
			@RequestPart(value="managerImage") MultipartFile multipartFile) {
		
		//System.out.println(multipartFile.getOriginalFilename());
		//System.out.println(multipartFile.getSize());
		
		managerInfoService.modifyManagerByImage(multipartFile, managerId);
		
		return "redirect:/manager/myInfo/" + managerId;
	}
	
	// 마이페이지 직책 수정
	@GetMapping("/manager/modifyPositionMyInfo/{managerId}/{managerPosition}")
	public String modifyManagerByPosition(
			@PathVariable(value="managerId") String managerId,
			@PathVariable(value="managerPosition") String managerPosition) {
		
		managerInfoService.modifyManagerByPosition(managerId, managerPosition);
		
		return "redirect:/manager/myInfo/" + managerId;
	}
	
	// 마이페이지 핸드폰 번호 수정
	@PostMapping("/manager/modifyAddressMyInfo")
	public String modifyManagerByPhone(Manager manager) {
		
		managerInfoService.modifyManagerByAddress(manager);
		
		return "redirect:/manager/myInfo/" + manager.getManagerId();
	}
	
	// 마이페이지 핸드폰 번호 수정
	@GetMapping("/manager/modifyPhoneMyInfo/{managerId}/{managerPhone}")
	public String modifyManagerByPhone(
			@PathVariable(value="managerId") String managerId,
			@PathVariable(value="managerPhone") String managerPhone) {
		
		managerInfoService.modifyManagerByPhone(managerId, managerPhone);
		
		return "redirect:/manager/myInfo/" + managerId;
	}
	
	// 마이페이지 생일 수정
	@GetMapping("/manager/modifyBirthMyInfo/{managerId}/{managerBirth}")
	public String modifyManagerByBirth(
			@PathVariable(value="managerId") String managerId,
			@PathVariable(value="managerBirth") String managerBirth) {
		
		managerInfoService.modifyManagerByBirth(managerId, managerBirth);
			
		return "redirect:/manager/myInfo/" + managerId;
	}
	
	// 마이페이지 성별 수정
	@GetMapping("/manager/modifyGenderMyInfo/{managerId}/{managerGender}")
	public String modifyManagerByGender(
			@PathVariable(value="managerId") String managerId,
			@PathVariable(value="managerGender") String managerGender) {
		
		managerInfoService.modifyManagerByGender(managerId, managerGender);
			
		return "redirect:/manager/myInfo/" + managerId;
	}
	
	// 마이페이지 이메일 수정
	@GetMapping("/manager/modifyEmailMyInfo/{managerId}/{managerEmail}")
	public String modifyManagerByEmail(
			@PathVariable(value="managerId") String managerId,
			@PathVariable(value="managerEmail") String managerEmail) {
		managerInfoService.modifyManagerByEmail(managerId, managerEmail);
		
		return "redirect:/manager/myInfo/" + managerId;
	}
	
	// 마이페이지 이름 수정
	@GetMapping("/manager/modifyNameMyInfo/{managerId}/{managerName}")
	public String modifyManagerByName(
			@PathVariable(value="managerId") String managerId,
			@PathVariable(value="managerName") String managerName) {
		managerInfoService.modifyManagerByName(managerId, managerName);
		
		return "redirect:/manager/myInfo/" + managerId;
	}
	
	// 패스워드 변경사이트 이동
	@GetMapping("/manager/myInfoPw")
	public String modifyPw() {
		return "manager/modifyPwMyInfo";
	}
	
	// 비밀번호가 변경 된 후에 로그아웃되고 로그인 페이지로 이동
	@PostMapping("/manager/modifyPwMyInfo")
	public String modifyAccountPw(HttpSession session, Account account) {
		managerInfoService.modifyAccountPw(account);
		session.invalidate();
		
		return "redirect:/managerLogin";
	}
	
	// 운용자 마이페이지 출력(강사 정보를 가져오기 위해 managerId를 받아옴)
	@GetMapping("/manager/modifyMyInfo/{managerId}")
	public String modifyMyInfo(Model model,
						@PathVariable(value="managerId") String managerId) {
		// manager 객체 선언하여 service의 메소드 호출 및 입력
		Manager managerOne = managerInfoService.getManagerInfo(managerId);
		
		String managerPhone1 = managerOne.getManagerPhone().substring(0,3);
		String managerPhone2 = managerOne.getManagerPhone().substring(3,7);
		String managerPhone3 = managerOne.getManagerPhone().substring(7,11);			
		
		model.addAttribute("managerOne", managerOne);
		model.addAttribute("managerPhone1", managerPhone1);
		model.addAttribute("managerPhone2", managerPhone2);
		model.addAttribute("managerPhone3", managerPhone3);
		
		return "manager/modifyMyInfo";
	}
	
	// 운용자 마이페이지 출력(강사 정보를 가져오기 위해 managerId를 받아옴)
	@GetMapping("/manager/myInfo/{managerId}")
	public String myInfo(Model model,
			@PathVariable(value="managerId") String managerId) {
		
		Manager managerOne = managerInfoService.getManagerInfo(managerId);
		int connectCount = managerConnectService.getConnectCountToNo(managerId);
		model.addAttribute("managerOne", managerOne);
		model.addAttribute("connectCount", connectCount);
		
		return "manager/myInfo";
	}
}
