package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;

@Mapper
public interface TeacherInfoMapper {
	Teacher selectTeacherInfo(String teacherId);
	
	// 패스워드 변경
	int updateAccountPw(Account account);
	
	// 패스워드 변경 시 현재 패스워드 확인
	int selectAccountByPw(String accountId, String accountPw);
	
	// 마이 페이지 정보 수정
	int updateTeacherByName(String teacherId, String teacherName);
	int updateTeacherByEmail(String teacherId, String teacherEmail);
	int updateTeacherByGender(String teacherId, String teacherGender);
	int updateTeacherByBirth(String teacherId, String teacherBirth);
	int updateTeacherByImage(String teacherId, String teacherImage);
	int updateTeacherByPhone(String teacherId, String teacherPhone);
	
	// 마이 페이지 이메일 중복 검사
	int selectTeacherAndTeacherQueueByOverlapEmail(String teacherEmail);
	
	// 프로젝트에서 이미지 삭제
	String selectTeacherByImageTodelete(String teacherId);
	
	// 회원탈퇴
	int updateAccountTodelete(Account account);
	int deleteTeacher(String teacherId);
}
