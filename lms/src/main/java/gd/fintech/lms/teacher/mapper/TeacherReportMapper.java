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
	//과제삭제
	int deleteReport(int reportNo);
	//과제 상세보기
	Report selectReportOne(int reportNo);

}
