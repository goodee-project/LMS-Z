package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Classroom;

@Mapper
public interface ManagerClassroomMapper {
	//강의실 리스트를 출력해주기 위한 메퍼 호출
	List<Classroom> selectClassroomList(Map<String, Object> map);
	//강의실을 추가하기 위한 메퍼 호출
	int insertClassroom(Classroom classroom);
	// 강의실 중복검사를 위한 메퍼 호출
	int selectClassroomOverlap(int classroomNumber);
	//강의실 삭제를 위한 메퍼 호출
	int deleteClassroom(int classroomNo);
	//페이징을 위한 메퍼 호출
	int selectClassroomTotalCount();
}
