package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;

@Mapper
public interface ManagerMemberMapper {
	//강사와 학생 리스트를 출력하기 위한 메퍼 호출
	List<Account> selectTeacherAndStudent(Map<String, Object> map);
	//페이징을 위한 count 출력
	int selectTeacherAndStudentCount();
}
