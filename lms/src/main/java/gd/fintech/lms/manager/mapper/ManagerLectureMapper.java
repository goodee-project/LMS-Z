package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Teacher;

@Mapper
public interface ManagerLectureMapper {
	//강좌 목록을 불러오기 위해 연결해주는 메퍼
	List<Lecture> selectLectureList();
	//강사 리스트를 불러오기 위해 연결해주는 메퍼
	List<Teacher> selectTeacherList();
}
