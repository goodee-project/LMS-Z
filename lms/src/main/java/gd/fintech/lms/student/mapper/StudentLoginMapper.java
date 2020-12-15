package gd.fintech.lms.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface StudentLoginMapper {
	String selectAccountToStudentLogin(Account account);
}
