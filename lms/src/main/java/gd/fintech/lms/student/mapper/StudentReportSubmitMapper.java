package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;
import gd.fintech.lms.vo.Student;

@Mapper
public interface StudentReportSubmitMapper {
	
	Student selectStudentName(String accountId);
	
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
	
	int totalCountLectureSearch(Map<String, Object>map);
	
	int totalCountOverdueLectureSearch(Map<String, Object>map);
	
	//제출기한이 지난 수강중인 강의 과제목록 행의 갯수
	int totalCountOverdueReport(String accountId);
	
	//제출기한이 지난 수강중인 강의 과제를 검색한 목록의 행의 갯수
	int totalCountOverdueSearch(String accountId, String reportTitle);
	
	//제출기한이 남아있는 수강중인 강의 과제목록 리스트
	List<Report> selectReportListPage(Map<String, Object>map);
	
	//제출기한이 지난 수강중인 강의 과제목록 리스트
	List<Report> selectOverdueReportListPage(Map<String, Object>map);
	
	//제출기한이 지난 수강중인 강의 과제목록 제목으로 검색
	List<Report> selectOverdueReportSearch(Map<String, Object>map);
	
	List<Report> selectLectureReportSearch(Map<String, Object>map);
	
	List<Report> selectLectureOverdueReportSearch(Map<String, Object>map);
	
	List<Lecture> selectLectureList(String accountId);
}
