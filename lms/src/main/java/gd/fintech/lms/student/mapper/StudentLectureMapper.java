package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Classroom;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Subject;
import gd.fintech.lms.vo.Syllabus;
import gd.fintech.lms.vo.Textbook;

@Mapper
public interface StudentLectureMapper {
	// 페이징 처리한 전체 강의 목록 map => beginRow, rowPerPage
	public List<Lecture> selectLectureList(Map<String, Object> map);
	// 페이징처리) 전체 강의목록 갯수
	public int selectLectureListTotal();
	
	//**** 강의 목록 상세보기 ******
	// 1. 강의실 정보
	public Lecture selectLectureListOne(int lectureNo);
	// 2. 과목 정보
	public Subject selectSubjectOne(int subjectNo);
	// 3. 교재 정보
	public Textbook selectTextbookOne(int textbookIsbn);
	// 4. 강의계획서
	public Syllabus selectSyllabusOne(int syllabusNo);
	// 5. 강의실 정보
	public Classroom selectClassroomOne(int classroomNo);
	
	//===== 강의 수강 신청 ====
	public int insertClassRegistration(Map<String,Object> map);
	
	//==== 수강중/신청한 전체 강의 목록 =========
	
}