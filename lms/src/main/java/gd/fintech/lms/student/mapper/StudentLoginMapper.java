package gd.fintech.lms.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.StudentForm;

@Mapper
public interface StudentLoginMapper {
	String selectAccountToStudentLogin(Account account);
	
	// 학생 회원가입 mapper
	int insertAccountToSignup(StudentForm studentForm);
	int insertstudentQueueToSignup(StudentForm studentForm);
	
}
