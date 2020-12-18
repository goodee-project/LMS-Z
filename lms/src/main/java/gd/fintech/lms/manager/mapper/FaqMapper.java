package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import gd.fintech.lms.vo.Faq;

public interface FaqMapper {
	
	//FAQ 리스트
	List<Faq> selectFaqList(Map<String, Integer> map);
	
	//FAQ 상세내용 
	Faq selectFaqOne(int faqNo);
	
	//FAQ 추가 
	int insertFaqCategory(Faq faq);
	
	//FAQ 수정
	int updateFaqCategory(Faq faq);
	
	//FAQ 삭제 
	int deleteFaq (int faqNo);
	
	
}
