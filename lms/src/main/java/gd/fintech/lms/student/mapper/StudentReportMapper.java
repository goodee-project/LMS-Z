package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;

@Mapper
public interface StudentReportMapper {
	
	//과제목록 리스트
	List<Report> selectReportListPage(Map<String, Object>map);
}
