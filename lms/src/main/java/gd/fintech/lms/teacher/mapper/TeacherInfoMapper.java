package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;

@Mapper
public interface TeacherInfoMapper {
	Teacher selectTeacherInfo(String teacherId);
	
	// 패스워드 변경
	int updateAccountPw(Account account);
	
	// 패스워드 변경 시 현재 패스워드 확인
	int selectAccountByPw(String accountId, String accountPw);
}
