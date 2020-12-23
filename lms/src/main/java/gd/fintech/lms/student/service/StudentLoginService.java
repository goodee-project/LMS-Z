package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentLoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.ManagerForm;
import gd.fintech.lms.vo.StudentForm;

@Service
@Transactional
public class StudentLoginService {
	@Autowired StudentLoginMapper studentLoginMapper;
	
	// 로그인 시 이미지 가져오기
	public String getStudentImage(String studentId) {
		return studentLoginMapper.selectStudentImage(studentId);
	}
	
	// 회원가입 주소 찾기 service
	public Map<String, Object> getAddressToSearch(String doro){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Address> addressList = studentLoginMapper.selectAddressToSearch(doro);
		map.put("addressList", addressList);
		
		return map;
	}
	
	// 회원가입하는 사람의 이메일 중복검사 service
	public int getStudentToSignupByOverLapEmail(String studentEmail) {
		return studentLoginMapper.selectStudentToSignupByOverLapEmail(studentEmail);
	}
	
	// 회원가입하는 사람의 아이디 중복검사 service
	public int getAccountToSignupByOverlapId(String accountId) {
		return studentLoginMapper.selectAccountToSignupByOverlapId(accountId);
	}
	
	// 로그인 액션
	public String getAccountToStudentLogin(Account account) {
		
		account.setAccountLevel("학생");
		account.setAccountState("활성화");
		
		return studentLoginMapper.selectAccountToStudentLogin(account);
	}
	
	// 회원가입하는 mapper2개를 가져와 manager_queue와 account 순서로 insert실행
	public void addSignup(StudentForm studentForm) {
		studentForm.setAccountLevel("학생");
		studentForm.setAccountState("대기");
		
		studentForm.setStudentPhone(studentForm.getStudentPhone1()+studentForm.getStudentPhone2()+studentForm.getStudentPhone3());
			
		studentLoginMapper.insertstudentQueueToSignup(studentForm);
		studentLoginMapper.insertAccountToSignup(studentForm);
	}
}
