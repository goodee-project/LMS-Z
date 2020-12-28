package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;

@Mapper
public interface StudentReportSubmitMapper {
	ReportSubmit selectReportSubmitOne(Map<String, Object>map);
	
	//제출과제 자세히 보기
	Report selectReportOne(int reportNo);
	
	//해당 강의에 과제 제출
	int insertReport(ReportSubmit reportSubmit);
	
	//제출과제 수정(첨부파일및 제출과제내용)
	int updateReportSubmit(ReportSubmit reportSubmit);
	
	//제출과제에 해당하는 모든내용 삭제
	int deleteReportSubmit(int reportSubmitNo);
	
	//제출기한이 남아있는 수강중인 강의 과제목록 행의 갯수
	int totalCountReport(String accountId);
	
	//제출기한이 지난 수강중인 강의 과제목록 행의 갯수
	int totalCountOverdueReport(String accountId);
	
	//제출기한이 남아있는 수강중인 강의 과제목록 리스트
	List<Report> selectReportListPage(Map<String, Object>map);
	
	//제출기한이 지난 수강중인 강의 과제목록 리스트
	List<Report> selectOverdueReportListPage(Map<String, Object>map);
}
