package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.StudentForm;

@Mapper
public interface StudentLoginMapper {
	String selectAccountToStudentLogin(Account account);
	
	// 학생 회원가입 mapper
	int insertAccountToSignup(StudentForm studentForm);
	int insertstudentQueueToSignup(StudentForm studentForm);
	
	// 회원가입 중복검사
	int selectAccountToSignupByOverlapId(String accountId);
	int selectStudentToSignupByOverLapEmail(String studentEmail);
	
	// 회원가입 주소검색
	List<Address> selectAddressToSearch(String doro);
	int selectAddressToSearchCount(String doro);
	
	// 로그인 시 이미지 가져오기
	String selectStudentImage(String studentId);
	
	// 중복 로그인 방지
	int selectConnectByOverlapLogin(Connect connect);
}
