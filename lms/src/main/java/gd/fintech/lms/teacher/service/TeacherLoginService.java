package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.TeacherForm;

@Service
@Transactional
public class TeacherLoginService {
	@Autowired TeacherLoginMapper teacherLoginMapper;
	
	// 로그인 시 이미지 가져오기
	public String getTeacherImage(String teacherId) {
		return teacherLoginMapper.selectTeacherImage(teacherId);
	}
	
	// 회원가입하는 mapper2개를 가져와 manager_queue와 level 순서로 insert실행
	public void addSignup(TeacherForm teacherForm) {
		teacherForm.setAccountLevel(3);
		teacherForm.setAccountState("대기");
		
		teacherForm.setTeacherPhone(teacherForm.getTeacherPhone1()+teacherForm.getTeacherPhone2()+teacherForm.getTeacherPhone3());
			
		teacherLoginMapper.insertTeacherQueueToSignup(teacherForm);
		teacherLoginMapper.insertAccountToSignup(teacherForm);
	}
	
	// 회원가입 주소 찾기 service
	public Map<String, Object> getAddressToSearch(String doro){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Address> addressList = teacherLoginMapper.selectAddressToSearch(doro);
		map.put("addressList", addressList);
		
		return map;
	}
	
	// 회원가입하는 사람의 이메일 중복검사 service
	public int getManagerToSignupByOverLapEmail(String teacherEmail) {
		return teacherLoginMapper.selectTeacherToSignupByOverLapEmail(teacherEmail);
	}
	
	// 회원가입하는 사람의 아이디 중복검사 service
	public int getAccountToSignupByOverlapId(String accountId) {
		return teacherLoginMapper.selectAccountToSignupByOverlapId(accountId);
	}
	
	// 로그인 액션
	public String getAccountToTeacherLogin(Account account) {
		account.setAccountLevel("강사");
		account.setAccountState("활성화");
		
		return teacherLoginMapper.selectAccountToTeacherLogin(account);
	}
}
