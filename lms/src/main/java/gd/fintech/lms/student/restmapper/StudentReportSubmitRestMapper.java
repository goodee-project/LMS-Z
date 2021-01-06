package gd.fintech.lms.student.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentReportSubmitRestMapper {
	//과제 제출 빈도
	public Map<String, Object> selectReportSubmit(String studentId);
}
