package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Syllabus;

@Mapper
public interface TeacherSyllabusMapper {
	// 강의계획서 추가(syllabus_teachersign 수정 예정)
	int insertSyllabus(Syllabus syllabus);
}
