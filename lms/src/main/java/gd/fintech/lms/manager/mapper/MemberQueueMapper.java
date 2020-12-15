package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;

@Mapper
public interface MemberQueueMapper {
	List<StudentQueue> selectStudentMemberQueue();
	List<TeacherQueue> selectTeacherMemberQueue();
	int deleteStudentQueue(String studentId);
	int updateAccountState(String studentId);
}
