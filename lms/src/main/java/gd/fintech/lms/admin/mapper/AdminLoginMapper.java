package gd.fintech.lms.admin.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Connect;

@Mapper
public interface AdminLoginMapper {
	// 로그인 액션
	public String selectAdminAccount(Account account);
	
	// 중복 로그인 방지
	int selectConnectByOverlapLogin(Connect connect);
}
