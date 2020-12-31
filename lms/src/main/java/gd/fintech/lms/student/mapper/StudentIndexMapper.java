package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Report;

@Mapper
public interface StudentIndexMapper {
	// 해당 아이디가 듣고 있는 강좌
	List<Lecture> selectLecture(String studentId);
	
	// 해당 아이디가 듣고 있는 강좌의 과제
	List<Report> selectReport(String studentId);
	
	// 해당 아이디가 듣고 있는 강좌의 과제를 제출했는지 체크
	int selectReportCheck(int reportCheck, String studentId);
}
