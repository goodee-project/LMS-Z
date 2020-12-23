package gd.fintech.lms.manager.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLectureMapper;
import gd.fintech.lms.student.mapper.StudentQuestionFileMapper;
import gd.fintech.lms.student.mapper.StudentQuestionMapper;
import gd.fintech.lms.teacher.mapper.TeacherLectureNoticeMapper;
import gd.fintech.lms.vo.Classroom;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Subject;
import gd.fintech.lms.vo.Syllabus;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.Textbook;

@Service
@Transactional
public class ManagerLectureService {
	@Autowired ManagerLectureMapper managerLectureMapper;
	@Autowired TeacherLectureNoticeMapper teacherLectureNoticeMapper;
	@Autowired StudentQuestionMapper studentQuestionMapper;
	@Autowired StudentQuestionFileMapper studentQuestionFileMapper;
	private final String PATH = "C:\\Users\\guswn\\OneDrive\\바탕 화면\\git\\maven.1607910829175\\lms\\src\\main\\webapp\\uploadfile\\questionfile";
	//강좌 리스트를 리턴시키기 위한 메퍼 호출
	public List<Lecture> getLectureList(int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return managerLectureMapper.selectLectureList(map);
	}
	//강사목록을 리턴시키기 위한 메퍼 호출
	public List<Teacher> getTeacherList(){
		return managerLectureMapper.selectTeacherList();
	}
	//과목 리스트를 리턴시키기 위한 메퍼 호출
	public List<Subject> getSubjectList(){
		return managerLectureMapper.selectSubjectList();
	}
	//교재 리스트를 리턴시키기 위한 메퍼 호출
	public List<Textbook> getTextbookList(){
		return managerLectureMapper.selectTextbookList();
	}
	//강의계획서 리스트를 리턴시키기 위한 메퍼 호출
	public List<Syllabus> getSyllabusList(){
		return managerLectureMapper.selectSyllabusList();
	}
	//강의실 리스트를 리턴시키기 위한 메퍼 호출
	public List<Classroom> getClassroomList(){
		return managerLectureMapper.selectClassroomList();
	}
	//강좌를 추가하기 위한 메퍼 호출
	public void insertLecture(Lecture lecture) {
		managerLectureMapper.insertLecture(lecture);
	}
	//강좌 추가하기 위해 필요한 선생님 아이디 가져오는 메퍼 호출
	public String getTeacherId(Teacher teacher) {
		return managerLectureMapper.selectTeacherId(teacher);
	}
	//강좌를 추가하면 배정된 강의실의 상태를 변경해주는 메퍼 호출
	public void updateClassroomState(int classroomNo) {
		managerLectureMapper.updateClassroomState(classroomNo);
	}
	//강좌를 삭제하기 위해 필요한 메퍼 호출
	public void deleteLecture(int lectureNo) {
		//삭제할 강좌와 연결된 질문 삭제
		List<Integer> questionNo = studentQuestionMapper.selectLectureNo(lectureNo);
		for(int q : questionNo) {
			List<String> questionFileUuid = studentQuestionFileMapper.selectQuestionFileUuid(q);
			for(String s : questionFileUuid) {
				File file = new File(PATH+s);
				if(file.exists()) {
					file.delete();
				}
			}
			studentQuestionFileMapper.deleteAllQuestionFile(q);
			studentQuestionMapper.deleteQuestionAllComment(q);
			studentQuestionMapper.deleteQuestion(q);
		}
		//삭제할 강좌와 연결된 공지사항 삭제
		teacherLectureNoticeMapper.deleteLecture(lectureNo);
		//삭제할 강좌와 연결된 레포트 삭제
		managerLectureMapper.deleteReport(lectureNo);
		//삭제할 강좌와 연결된 수강학생 삭제
		managerLectureMapper.deleteClassRegistration(lectureNo);
		//강좌 삭제
		managerLectureMapper.deleteLecture(lectureNo);
	}
	//페이징을 위해 카운트를 구해주는 메퍼 호출
	public int getLectureTotalPage() {
		return managerLectureMapper.selectLectureTotalPage();
	}
	//교재를 사용하고 있는 강좌의 카운트를 구해주는 메퍼 호출
	public int getTextbookCk(String textbookIsbn) {
		return managerLectureMapper.selectTextbookCk(textbookIsbn);
	}
}
