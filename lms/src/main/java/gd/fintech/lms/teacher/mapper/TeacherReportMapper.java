package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;

@Mapper
public interface TeacherReportMapper {
	//과제목록
	List<Report> selectReportList(Map<String, Object> map);
	//과제등록
	int insertReport(Report report);
	//과제삭제
	int deleteReport(int reportNo);
	//과제 상세보기
	Report selectReportOne(int reportNo);
	//과제수정
	int updateReport(Report report);
	//페이징을 위한 카운트
	int selectReoprtCount(int lectureNo);
	
	int deleteReportSubmit(int reportNo);
	
	int deleteReportSubmitFile(int reportNo);
}
