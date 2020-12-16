package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;

@Mapper
public interface TeacherLectureMapper {
	// 강사별 강의목록 출력(accountId를 받아옴)
	List<Lecture> selectLectureList(String accountId);
}
