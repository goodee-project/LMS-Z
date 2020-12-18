package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Classroom;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Subject;
import gd.fintech.lms.vo.Syllabus;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.Textbook;

@Mapper
public interface ManagerLectureMapper {
	//강좌 목록을 불러오기 위해 연결해주는 메퍼
	List<Lecture> selectLectureList();
	//강사 리스트를 불러오기 위해 연결해주는 메퍼
	List<Teacher> selectTeacherList();
	//과목 리스트를 불러오기 위해 연결해주는 메퍼
	List<Subject> selectSubjectList();
	//교재 리스트를 불러오기 위해 연결해주는 메퍼
	List<Textbook> selectTextbookList();
	//강의계획서 리스트를 불러오기 위해 연결해주는 메퍼
	List<Syllabus> selectSyllabusList();
	//강의실 리스트를 불러오기 위해 연결해주는 메퍼
	List<Classroom> selectClassroomList();
	//강좌 등록정보를 강좌목록에 추가하기위해 연결하는 메퍼
	int insertLecture(Lecture lecture);
	//강좌 추가하기 위해 필요한 선생님 아이디 가져오는 메퍼
	String selectTeacherId(Teacher teacher);
	//강의실의 상태를 변경하기 위해 필요한 메퍼
	int updateClassroomState(int classroomNo);
	//강좌를 삭제하기 위해 필요한 메퍼
	int deleteLecture(int lectureNo);
	//강좌에 해당하는 레포트를 삭제하기 위해 필요한 메퍼
	int deleteReport(int lectureNo);
	//강좌에 수강하는 학생들을 삭제하기 위해 필요한 메퍼
	int deleteClassRegistration(int lectureNo);
}
