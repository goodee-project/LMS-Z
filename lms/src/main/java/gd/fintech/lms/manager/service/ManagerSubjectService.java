package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerSubjectMapper;
import gd.fintech.lms.vo.Subject;

@Service
@Transactional
public class ManagerSubjectService {
	@Autowired ManagerSubjectMapper managerSubjectMapper;
	
	//과목 리스트를 불러오는 메퍼 호출
	public List<Subject> getSubjectList(int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return managerSubjectMapper.selectSubjectList(map);
	}
	//전체 과목 수를 구하기 위한 메퍼 호출
	public int getSubjectTotalCount() {
		return managerSubjectMapper.selectSubjectTotalCount();
	}
	//과목 추가를 위한 메퍼 호출
	public void insertSubject(Subject subject) {
		managerSubjectMapper.insertSubject(subject);
	}
	//과목 상세보기를 위한 메퍼 호출
	public Subject getSubjectOne(int subjectNo) {
		return managerSubjectMapper.selectSubjectOne(subjectNo);
	}
	//과목 수정을 위한 메퍼 호출
	public void updateSubjectOne(Subject subject) {
		managerSubjectMapper.updateSubjectOne(subject);
	}
	//과목을 강좌에서 사용하고 있는지 확인하기 위한 메퍼 호출
	public int getSubjectCk(int subjectNo) {
		return managerSubjectMapper.selectSubjectCk(subjectNo);
	}
	//과목 삭제를 위한 메퍼 호출
	public void deleteSubjectOne(int subjectNo) {
		managerSubjectMapper.deleteSubjectOne(subjectNo);
	}
}
