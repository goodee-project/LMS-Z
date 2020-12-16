package gd.fintech.lms.manager.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerForm;

@Mapper
public interface ManagerLoginMapper {
	String selectAccountToManagerLogin(Account account);
	
	// 회원가입 할 때 추가해야하는 테이블 2개
	int insertAccountToSignup(ManagerForm managerForm);
	int insertManagerQueueToSignup(ManagerForm managerForm);
	
	// 회원가입 중복검사
	int selectAccountToSignupByoverlap(String accountId, String accountEmail);
}
