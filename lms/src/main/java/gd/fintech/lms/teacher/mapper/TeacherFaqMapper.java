package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Mapper
public interface TeacherFaqMapper {
	// 전체FAQ 목록 출력(map -> 페이징)
	List<Faq> selectFaqList(Map<String, Object> map);
	
	// FAQ 카테고리별 FAQ목록 출력(map -> 페이징, 카테고리명)
	List<Faq> selectFaqListByCategory(Map<String, Object> map);
	
	// FAQ 카테고리 목록
	List<FaqCategory> selectFaqCategoryList();
	
	// 전체 FAQ 개수
	int selectFaqCount();
	
	// 카테고리별 FAQ 개수
	int selectFaqCountByCategory(String faqCategory);
	
	// FAQ 상세보기
	Faq selectFaqOne(int faqNo);
	
	// FAQ 상세보기 조회 시 조회수 증가
	int updateFaqCount(int faqNo);
}
