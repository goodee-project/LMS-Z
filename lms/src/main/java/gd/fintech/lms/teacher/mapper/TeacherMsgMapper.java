package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Msg;
import gd.fintech.lms.vo.Student;

@Mapper
public interface TeacherMsgMapper {
	
	//강의를 듣고 있는 학생 리스트 출력 map=>teacherId,lectureNo
	public List<Student> selectLectureInStudentList(Map<String,Object> map);
	//메세지 리스트 가져오기 (map = [studentId, teacherId]
	public List<Msg> selectTeacherMsgList(Map<String, Object> map);
	//메세지 보내기
	public int insertToStudentMsg(Msg msg);
	//메세지 읽음 
	public int updateTeacherReadMsg(Msg msg);
	//메세지 읽음 표시
	public List<Msg> selectMsgReadCheck(Map<String,Object> map);
}
