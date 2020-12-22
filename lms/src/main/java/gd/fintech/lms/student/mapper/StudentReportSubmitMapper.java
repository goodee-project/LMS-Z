package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;

@Mapper
public interface StudentReportSubmitMapper {
	ReportSubmit selectReportSubmitOne(Map<String, Object>map);
	
	Report selectReportOne(int reportNo);
	
	int insertReport(ReportSubmit reportSubmit);
	
	int updateReportSubmit(ReportSubmit reportSubmit);
	
	int deleteReportSubmit(int reportSubmitNo);
	
	int totalCountReport(String accountId);
	
	//과제목록 리스트
	List<Report> selectReportListPage(Map<String, Object>map);
}
