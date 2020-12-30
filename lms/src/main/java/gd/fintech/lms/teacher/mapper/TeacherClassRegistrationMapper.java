package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ClassRegistration;

@Mapper
public interface TeacherClassRegistrationMapper {
	List<ClassRegistration> selectClassRegistrationList(Map<String, Object> map);
}
