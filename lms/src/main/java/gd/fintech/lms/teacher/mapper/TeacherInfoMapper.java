package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Teacher;

@Mapper
public interface TeacherInfoMapper {
	Teacher selectTeacherInfo(String teacherId);
}
