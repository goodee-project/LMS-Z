package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;

@Mapper
public interface MemberQueueMapper {
	//승인 대기상태의 학생리스트를 연결하는 메퍼
	List<StudentQueue> selectStudentMemberQueue(); 
	//승인 대기상태의 강사리스트를 연결하는 메퍼
	List<TeacherQueue> selectTeacherMemberQueue();
	//승인 거부한 학생을 대기리스트에서 삭제하기위해 연결하는 메퍼
	int deleteStudentQueue(String studentId);
	//승인에 의해 강사,학생의 상태 변경을 위해 연결하는 메퍼
	int updateAccountState(Map<String, Object> map);
	//승인 거부한 강사를 대기리스트에서 삭제하기 위해 연결하는 메퍼
	int deleteTeacherQueue(String teacherId);
	//승인한 학생의 정보를 불러오기위해 연결하는 메퍼
	StudentQueue selectStudentOne(String studentId);
	//승인된 학생을 학생테이블에 추가하기 위해 연결하는 메퍼
	int insertStudent(StudentQueue studentQueue);
	//승인한 강사의 정보를 불러오기위해 연결하는 메퍼
	TeacherQueue selectTeacherOne(String teacherId);
	//승인된 강사을 강사테이블에 추가하기 위해 연결하는 메퍼
	int insertTeacher(TeacherQueue teacherQueue);
}
