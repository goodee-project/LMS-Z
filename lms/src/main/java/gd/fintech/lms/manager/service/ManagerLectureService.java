package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLectureMapper;
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
	//강좌 리스트를 리턴시키기 위한 메퍼 호출
	public List<Lecture> getLectureList(){
		return managerLectureMapper.selectLectureList();
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
}
