package gd.fintech.lms.teacher.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherFaqMapper;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Service
@Transactional
public class TeacherFaqService {
	@Autowired TeacherFaqMapper teacherFaqMapper;
	
	// 전체 FAQ 목록 조회
	public List<Faq> getFaqList(){
		return teacherFaqMapper.selectFaqList();
	}
	
	// 카테고리별 FAQ 목록 조회
	public List<Faq> getFaqListByCategory(String faqCategory){
		return teacherFaqMapper.selectFaqListByCategory(faqCategory);
	}
	
	// FAQ 카테고리 목록 조회
	public List<FaqCategory> getFaqCategoryList(){
		return teacherFaqMapper.selectFaqCategoryList();
	}
}
