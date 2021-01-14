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
	//교재 등록을 위한 메퍼 호출
	public void insertTextbook(Textbook textbook) {
		managerTextbookMapper.insertTextbook(textbook);
	}
	//교재의 상세정보를 보기 위한 메퍼 호출
	public Textbook getTextbookOne(String textbookIsbn) {
		return managerTextbookMapper.selectTextbookOne(textbookIsbn);
	}
	//교재 수정을 위한 메퍼 호출
	public void updateTextbookOne(Textbook textbook) {
		managerTextbookMapper.updateTextbookOne(textbook);
	}
	//교재 삭제를 위한 메퍼 호출
	public void deleteTextbookOne(String textbookIsbn) {
		managerTextbookMapper.deleteTextbookOne(textbookIsbn);
	}
	//교재 등록시 중복검사를 위한 메퍼 호출
	public int getTextbookCk(String textbookIsbn) {
		return managerTextbookMapper.selectTextbookCk(textbookIsbn);
	}
}
