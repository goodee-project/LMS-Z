package gd.fintech.lms.manager.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LmsStatsRestMapper {
	List<Map<String, Object>> selectTeacherInOutCount(int year);
}
