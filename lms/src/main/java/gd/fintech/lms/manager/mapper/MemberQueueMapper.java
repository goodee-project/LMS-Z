package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface MemberQueueMapper {
	List<Account> selectStudentMemberQueue();
	List<Account> selectTeacherMemberQueue();
}
