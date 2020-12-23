package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerFaqMapper;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Service
@Transactional
public class ManagerFaqService {
	@Autowired ManagerFaqMapper managerFaqMapper;
	
	//FAQ 목록 가져오기
	public List<Faq> getManagerFaqList(int beginRow, int rowPerPage, String faqCategory){
		Map<String,Object> map = new HashMap<>();
		map.put("beginRow",beginRow);
		map.put("rowPerPage",rowPerPage);
		map.put("faqCategory", faqCategory);
		return managerFaqMapper.selectFaqList(map);
	}
	//카테고리 별 FAQ 총 갯수
	public int getFaqTotal(String faqCategory) {
		return managerFaqMapper.selectFaqTotal(faqCategory);
	}
	// 카테고리 리스트 가져오기
	public List<FaqCategory> getFaqCategoryList(){
		return managerFaqMapper.selectFaqCategoryList();
	}
	// FAQ 추가
	public int addFaqList(Faq faq) {
		return managerFaqMapper.insertFaqList(faq);
	}
}
