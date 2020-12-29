package gd.fintech.lms.student.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.Student;

@Mapper
public interface StudentInfoMapper {
	Student selectStudentInfo(String studentId);
	
	// 패스워드 변경
	int updateAccountPw(Account account);
	
	// 패스워드 변경 시 현재 패스워드 확인
	int selectAccountByPw(String accountId, String accountPw);
	
	// 마이 페이지 정보 수정
	int updateStudentByName(String studentId, String studentName);
	int updateStudentByEmail(String studentId, String studentEmail);
	int updateStudentByGender(String studentId, String studentGender);
	int updateStudentByBirth(String studentId, String studentBirth);
	int updateStudentByImage(String studentId, String studentImage);
	int updateStudentByPhone(String studentId, String studentPhone);
	int updateStudentByAddress(Student student);
	
	// 마이 페이지 이메일 중복 검사
	int selectStudentAndStudentQueueByOverlapEmail(String studentEmail);
	
	// 프로젝트에서 이미지 삭제
	String selectStudentByImageTodelete(String studentId);
	
	// 회원탈퇴
	int updateAccountTodelete(Account account);
	int deleteStudent(String studentId);
	
	// 주소변경 사이트 주소 가져오기
	Student selectStudentByAddress(String studentId);
	
	// 마이 마이페이지 경력 추가/수정
	int selectCareerToCheck(String accountId);
	int updateCareer(Career career);
	int insertCareer(Career career);
}
