package gd.fintech.lms.manager.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.restmapper.LmsStatsRestMapper;

@Service
@Transactional
public class LmsStatsRestService {
	@Autowired LmsStatsRestMapper lmsStatsRestMapper;
	
	public List<Map<String, Object>> getTeacherInOutCount(int year){
		return lmsStatsRestMapper.selectTeacherInOutCount(year);
	}
}
