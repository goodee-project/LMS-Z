package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.TeacherForm;

@Mapper
public interface TeacherLoginMapper {
	String selectAccountToTeacherLogin(Account account);
	
	// 회원가입 할 때 추가해야하는 테이블 2개
	int insertAccountToSignup(TeacherForm teacherForm);
	int insertTeacherQueueToSignup(TeacherForm teacherForm);
	
	// 회원가입 중복검사
	int selectAccountToSignupByOverlapId(String accountId);
	int selectTeacherToSignupByOverLapEmail(String managerEmail);
	
	// 회원가입 주소검색
	List<Address> selectAddressToSearch(String doro);
	int selectAddressToSearchCount(String doro);
}
