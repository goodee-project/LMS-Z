package gd.fintech.lms.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ReportSubmitFile;

@Mapper
public interface StudentReportSubmitFileMapper {
	
	int insertReportSubmitFile(ReportSubmitFile ReportSubmitFile);
}
