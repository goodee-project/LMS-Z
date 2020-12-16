package gd.fintech.lms.teacher.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLmsNoticeMapper;
import gd.fintech.lms.vo.LmsNotice;

@Service
@Transactional
public class TeacherLmsNoticeService {
	@Autowired TeacherLmsNoticeMapper teacherLmsNoticeMapper;
	
	//공지사항 목록
	public List<LmsNotice> getLmsNoticeList(){
		return teacherLmsNoticeMapper.selectLmsNoticeList();
	}
}
