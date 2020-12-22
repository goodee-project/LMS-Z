package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Test;

@Mapper
public interface TeacherTestMapper {
	// 시험목록 출력
	List<Test> selectTestList(int lectureNo);
}
