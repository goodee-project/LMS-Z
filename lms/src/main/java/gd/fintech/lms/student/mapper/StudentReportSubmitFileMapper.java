package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ReportSubmitFile;

@Mapper
public interface StudentReportSubmitFileMapper {
	
	// 해당 과제에 대한 파일 첨부
	int insertReportSubmitFile(ReportSubmitFile ReportSubmitFile);
	
	// 제출 과제 수정시 첨부파일을 하나씩 삭제
	int deleteReportSubmitFile(String reportSubmitFileUuid);
	
	// 제출 과제를 한번에 삭제할때 과제에 해당하는 첨부파일 모두 삭제
	int deleteReportSubmitAllFile(int reportSubmitNo);
	
	// 제출 과제를 한번에 삭제할때 경로에 저장된 첨부파일을 삭제하기 위해 사용
	List<String> selectReportSubmitFileUuid(int reportSubmitNo);
}
