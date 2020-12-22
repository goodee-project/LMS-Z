package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerTextbookMapper;
import gd.fintech.lms.vo.Textbook;

@Service
@Transactional
public class ManagerTextbookService {
	@Autowired ManagerTextbookMapper managerTextbookMapper;
	//교재 리스트를 출력해주는 메퍼 호출
	public List<Textbook> getTextbookList(int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return managerTextbookMapper.selectTextbookList(map);
	}
	//페이징을 위한 전체 카운트를 출력해주는 메퍼 호출
	public int getTextbookTotalCount() {
		return managerTextbookMapper.selectTextbookTotalCount();
	}
}
