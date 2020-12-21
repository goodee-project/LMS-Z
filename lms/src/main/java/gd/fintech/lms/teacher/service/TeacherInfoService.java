package gd.fintech.lms.teacher.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherInfoMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class TeacherInfoService {
	@Autowired TeacherInfoMapper teacherInfoMapper;
	
	// 패스워드 변경 시 현재 패스워드 확인
	public int getAccountByPw(String accountId, String accountPw) {
		return teacherInfoMapper.selectAccountByPw(accountId, accountPw);
	}
	
	// 강사 마이페이지 정보
	public Teacher getTeacherInfo(String teacherId) {
		// mapper의 강사 마이페이지 정보 메소드 return
		return teacherInfoMapper.selectTeacherInfo(teacherId);
	}
	
	// 패스워드 변경
	public void modifyAccountPw(Account account) {
		teacherInfoMapper.updateAccountPw(account);
	}
}
