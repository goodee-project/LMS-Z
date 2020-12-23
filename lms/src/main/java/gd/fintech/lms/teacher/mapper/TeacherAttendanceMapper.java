package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Attendance;

@Mapper
public interface TeacherAttendanceMapper {
	Attendance selectAttendanceList(Map<String, Object> map);
}
