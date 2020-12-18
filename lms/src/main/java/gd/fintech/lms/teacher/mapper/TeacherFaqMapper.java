package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Mapper
public interface TeacherFaqMapper {
	// 전체FAQ 목록 출력
	List<Faq> selectFaqList();
	
	// FAQ 카테고리별 FAQ목록 출력
	List<Faq> selectFaqListByCategory(String faqCategory);
	
	// FAQ 카테고리 목록
	List<FaqCategory> selectFaqCategoryList();
}
