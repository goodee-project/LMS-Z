package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeacherClassRegistrationMapper {
	// 수강상태 수강중으로 변경
	int updateClassRegistrationStateStart();
	// 수강상태 수료로 변경
	int updateClassRegistrationStateEnd();
}
