package gd.fintech.lms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import gd.fintech.lms.admin.service.AdminRestictService;
import gd.fintech.lms.teacher.service.TeacherClassRegistrationService;

@Component
public class Scheduler {
	@Autowired AdminRestictService adminRestictService;
	@Autowired TeacherClassRegistrationService teacherClassRegistrationService;
	// 매월 1일 장기미접속자를 구해 상태변경하기 위한 스케줄러
	@Scheduled(cron="0 0 0 1 * *")
	public void restictAccount() {
		adminRestictService.RestictAccount();
	}
	// 강의 시작일이 되었을 때 수강상태 변경
	@Scheduled(cron="0 0 0 * * *")
	public void updateClassRegistrationState() {
		teacherClassRegistrationService.updateClassRegistrationState();
	}
}
