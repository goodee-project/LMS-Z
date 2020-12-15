package gd.fintech.lms.manager.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface ManagerLoginMapper {
	String selectAccountToManagerLogin(Account account);
}
