package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Address;
import gd.fintech.lms.vo.Connect;
import gd.fintech.lms.vo.Student;
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
	
	// 아이디 패스워드 찾기
	int updateAccountToPw(String accountId, String accountPw);
	Student selectStudentToNameAndEmail(Student student);
	int selectStudentToNameAndEmailByCheck(Student student);
	
	// 휴면상태일 경우 휴면해제 인증 폼으로 이동하기 위한 조건
	String selectAccountStateCk(String accountId);
	
	// 인증메일을 보낼 학생 메일 가져오기
	String selectStudentEmail(String studentId);
	
	// 휴면계정 인증 성공시 업데이드
	int updateChangeActivity(String studentId);
}
