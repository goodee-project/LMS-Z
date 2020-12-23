package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Textbook;

@Mapper
public interface ManagerTextbookMapper {
	//교재 리스트를 출력해주는 메퍼 호출
	List<Textbook> selectTextbookList(Map<String, Object> map);
	//페이징을 위한 메퍼 호출
	int selectTextbookTotalCount();
	//교재를 등록하기 위한 메퍼 호출
	int insertTextbook(Textbook textbook);
	//교재의 상세정보를 보기 위한 메퍼 호출
	Textbook selectTextbookOne(String textbookIsbn);
	//교재를 수정하기 위한 메퍼 호출
	int updateTextbookOne(Textbook textbook);
	//교재를 삭제하기 위한 메퍼 호출
	int deleteTextbookOne(String textbookIsbn);
	
}
