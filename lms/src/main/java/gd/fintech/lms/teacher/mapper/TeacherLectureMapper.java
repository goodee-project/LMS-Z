package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Student;

@Mapper
public interface TeacherLectureMapper {
	// 강사별 강의목록 출력(accountId, beginRow, rowPerPage를 받아와야하기 때문에 map으로 받아옴)
	List<Lecture> selectLectureList(Map<String, Object> map);
	
	// 강의목록 페이징을 위한 로그인한 강사의 강의목록 전체개수
	int selectLectureCount(String accountId);
	
	// 강의 상세보기(강의계획서)(강의번호 -> lectureNo)
	Lecture selectLectureOne(int lectureNo);
}
