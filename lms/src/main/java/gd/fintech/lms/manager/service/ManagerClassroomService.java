package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerClassroomMapper;
import gd.fintech.lms.vo.Classroom;

@Service
@Transactional
public class ManagerClassroomService {
	@Autowired ManagerClassroomMapper managerClassroomMapper;
	// 강의실 리스트를 가져오기 위해 메퍼 호출
	public List<Classroom> getClassroomList(int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return managerClassroomMapper.selectClassroomList(map);
	}
	//강의실을 추가해주기 위해 메퍼 호출
	public void insertClassroom(Classroom classroom) {
		managerClassroomMapper.insertClassroom(classroom);
	}
	//강의실 중복검사를 위해 메퍼 호출
	public int getClassroomNumberOverlap(int classroomNumber) {
		return managerClassroomMapper.selectClassroomOverlap(classroomNumber);
	}
	//강의실을 삭제하기 위해 메퍼 호출
	public void deleteClassroom(int classroomNo) {
		managerClassroomMapper.deleteClassroom(classroomNo);
	}
	//페이징을 위해 메퍼 호출
	public int getClassroomTotalCount() {
		return managerClassroomMapper.selectClassroomTotalCount();
	}
}
