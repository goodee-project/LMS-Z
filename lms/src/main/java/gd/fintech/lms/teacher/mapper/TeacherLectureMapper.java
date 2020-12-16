package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Syllabus;

@Mapper
public interface TeacherLectureMapper {
	// 강사별 강의목록 출력(accountId를 받아옴)
	List<Lecture> selectLectureList(String accountId);
	
	// 강의 상세보기(강의계획서)(강의번호 -> lectureNo)
	Lecture selectLectoreOne(int lectureNo);
}
