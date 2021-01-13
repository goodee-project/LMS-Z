package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Subject;

@Mapper
public interface ManagerSubjectMapper {
	//과목 리스트를 출력하기 위한 메퍼 호출
	List<Subject> selectSubjectList(Map<String, Object> map);
	//페이징을 위한 전체 갯수를 출력하는 메퍼 호출
	int selectSubjectTotalCount();
	//과목 추가를 위한 메퍼 호출
	int insertSubject(Subject subject);
	//과목 상세보기를 위한 메퍼 호출
	Subject selectSubjectOne(int subjectNo);
	//과목 수정을 위한 메퍼 호출
	int updateSubjectOne(Subject subject);
	//강좌에서 과목을 사용중인지 확인하기 위한 메퍼 호출
	int selectSubjectCk(int subjectNo);
	//과목 삭제를 위한 메퍼 호출
	int deleteSubjectOne(int subjectNo);
}
