package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ReportSubmitFile;

@Mapper
public interface StudentReportSubmitFileMapper {	
	int insertReportSubmitFile(ReportSubmitFile ReportSubmitFile);
	
	int deleteReportSubmitFile(String reportSubmitFileUuid);
	
	int deleteReportSubmitAllFile(int reportSubmitNo);
	
	List<String> selectReportSubmitFileUuid(int reportSubmitNo);
}
