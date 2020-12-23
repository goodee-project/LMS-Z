package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Mapper
public interface ManagerFaqMapper {
	
	//FAQ 리스트
	List<Faq> selectFaqList(Map<String, Object> map);
	
	//Category 리스트
	List<FaqCategory> selectFaqCategoryList();
	
	//카테고리 별 faq 총 갯수
	int selectFaqTotal(String faqCategory);
	
	//FAQ 상세내용 
	Faq selectFaqOne(int faqNo);
	
	//FAQ 조회수 +1
	int updateFaqCountUp(int faqNo);
	
	//FAQ 추가 
	int insertFaqList(Faq faq);
	
	//FAQ 수정
	int updateFaqList(Faq faq);
	
	//FAQ 삭제 
	int deleteFaqOne (int faqNo);
	
	
}
