package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionComment;
import gd.fintech.lms.vo.Student;

@Mapper
public interface StudentQuestionMapper {
	// 질문목록 리스트 (페이징)
	List<Question> selectQuestionListPage(Map<String, Object> map); 
	
	// 질문목록 검색
	List<Question> selectQuestionWriterSearch(Map<String, Object>map);
	
	// 질문목록 검색
	List<Question> selectQuestionTitleSearch(Map<String, Object>map);
	
	// 질문목록 페이징에 사용되는 총 행의 갯수
	int totalCountQuestion(String accountId); 
	
	int totalCountQuestionSearchWriter(String questionWriter, String accountId);
	
	int totalCountQuestionSearchTitle(String questionTitle, String accountId);
	
	int totalCountQuestionComment(int questionNo);
	
	// 질문 등록
	int insertQuestion(Question question); 
	
	// 질문 수정
	int updateQuestion(Question question);
	
	// 질문 삭제
	int deleteQuestion(int questionNo);
	
	// 질문에 대한 댓글 모두 삭제
	int deleteQuestionAllComment(int questionNo);
	
	//질문 자세히 보기
	Question selectQuestionOne(int questionNo); 
	
	//질문 조회수 증가
	int updateQuestionCount(int questionNo);
	
	// 질문 등록에서 강의번호를 선택하기위해 사용(강의 번호 리스트를 가져오기 위해)
	List<Lecture> selectLectureList(String accountId);  
	
	//강좌 삭제를 위한 questionNO를 구하기 위한 메퍼
	List<Integer> selectLectureNo(int lectureNo);
	
	Student selectStudentName(String accountId);
	
	
	List<QuestionComment> selectCommentList(Map<String, Object>map);
}
