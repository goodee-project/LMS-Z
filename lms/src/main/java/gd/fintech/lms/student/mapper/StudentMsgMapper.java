package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Msg;

@Mapper
public interface StudentMsgMapper {
	//메세지 리스트 가져오기 (map = [studentId, teacherId]
	public List<Msg> selectStudentMsgList(Map<String, Object> map);
	//메세지 보내기
	public int insertToTeacherMsg(Msg msg);
	//메세지 읽음 표시
	public int updateStudentReadMsg(Msg msg);
}
