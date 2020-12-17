package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;

@Mapper
public interface TeacherReportMapper {
	//과제목록
	List<Report> selectReportList();
	//과제등록
	int insertReport(Report report);
}
