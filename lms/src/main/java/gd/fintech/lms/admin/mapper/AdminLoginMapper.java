package gd.fintech.lms.admin.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface AdminLoginMapper {
	public String selectAdminAccount(Account account);
}
