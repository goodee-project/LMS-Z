package gd.fintech.lms.student.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.restmapper.StudentReportSubmitRestMapper;

@Service
@Transactional
public class StudentReportSubmitRestService {
	@Autowired StudentReportSubmitRestMapper studentReportSubmitRestMapper;
	
	//수강중인 강의 리스트
	public List<String> getMyLectureList(String studentId){
		return studentReportSubmitRestMapper.selectMyLectureList(studentId);
	}
	//나의 과제 점수
	public List<String> getMyReportScore(String studentId){
		return studentReportSubmitRestMapper.selectMyReportScore(studentId);
	}
	//강의 과제 평균 점수
	public List<String> getAvgReportScore(String studentId){
		return studentReportSubmitRestMapper.selectAvgReportScore(studentId);
	}
}
