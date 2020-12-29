package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class Attendance {
	private int lectureNo;
	private String accountId;
	private String attendanceDay;
	private String attendanceCreatedate;
	private String attendanceUpdatedate;
	private String attendanceState;
	private String attendanceRemark;
	private List<Student> studentList;
	private List<Lecture> lectureList;
	private List<ClassRegistration> classRegistrationList;
}
