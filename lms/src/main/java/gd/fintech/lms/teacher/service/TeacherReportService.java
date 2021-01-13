package gd.fintech.lms.teacher.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import gd.fintech.lms.teacher.mapper.TeacherReportMapper;
import gd.fintech.lms.teacher.mapper.TeacherReportSubmitMapper;
import gd.fintech.lms.vo.Report;

@Service
@Transactional
public class TeacherReportService {
	@Autowired TeacherReportMapper teacherReportMapper;
	@Autowired TeacherReportSubmitMapper teacherReportSubmitMapper;
	
	//과제목록
	public List<Report> getReportList(int lectureNo, int beginRow, int rowPerPage){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		return teacherReportMapper.selectReportList(map);
	}
	
	//과제등록
	public int addReport(Report report) {
		return teacherReportMapper.insertReport(report);
	}
	//과제삭제
	public void removeReport(int reportNo) {
		
		List<String> reportSubmitFileUuid = teacherReportSubmitMapper.selectReportSubmitFileUuid(reportNo);
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		String attachPath = "uploadfile\\reportfile\\";
		
		for(String s : reportSubmitFileUuid) {
			File file = new File(rootPath+attachPath+s);
			if(file.exists()) {
				file.delete();
			}
		}
		
		teacherReportMapper.deleteReportSubmitFile(reportNo);
		teacherReportMapper.deleteReportSubmit(reportNo);
		teacherReportMapper.deleteReport(reportNo);
		
	}
	
	//과제 상세보기
	public Report getReportOne(int reportNo) {
		return teacherReportMapper.selectReportOne(reportNo);
	}
	
	//과제수정
	public int modifyReport(Report report) {
		return teacherReportMapper.updateReport(report);
	}
	//페이징을 위한 카운트
	public int getReportCount(int lectureNo) {
		return teacherReportMapper.selectReoprtCount(lectureNo);
	}
}
