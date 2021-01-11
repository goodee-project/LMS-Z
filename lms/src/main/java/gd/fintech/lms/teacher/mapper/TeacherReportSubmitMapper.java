package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ReportSubmit;

@Mapper
public interface TeacherReportSubmitMapper {
	List<ReportSubmit> selectReportSubmit(int reportNo);
	ReportSubmit selectReportSubmitOne(int reportSubmitNo);
	int updateReportSubmit(ReportSubmit reportSubmit);
}
