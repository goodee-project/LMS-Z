package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerMemberMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class ManagerMemberService {
	@Autowired ManagerMemberMapper managerMemberMapper;
	
	//활성화 되어있는 학생,강사 리스트 출력하기 위한 메퍼 호출
	public List<Account> getTeacherAndStudentList(int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return managerMemberMapper.selectTeacherAndStudent(map);
	}
	//전체 목록 페이징을 위한 카운트를 위한 메퍼 호출
	public int getTeacherAndStudentCount() {
		return managerMemberMapper.selectTeacherAndStudentCount();
	}
	//직책 선택시 검색된 결과를 출력하기 위한 메퍼 호출
	public List<Account> getTeacherOrStudentList(String searchLevel, int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("searchLevel", searchLevel);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return managerMemberMapper.selectTeacherOrStudent(map);
	}
	//직책 선택에 따른 페이징을 위한 메퍼 호출
	public int getTeacherOrStudentCount(String searchLevel) {
		return managerMemberMapper.selectTeacherOrStudentCount(searchLevel);
	}
	//강사 이름 선택시 해당 강사의 상세정보를 보기 위한 메퍼 호출
	public Teacher getTeacherOne(String teacherId) {
		return managerMemberMapper.selectTeacherOne(teacherId);
	}
}
