package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface TeacherLoginMapper {
	String selectAccountToTeacherLogin(Account account);
}
