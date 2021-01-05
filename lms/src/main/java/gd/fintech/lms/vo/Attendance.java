package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class Attendance {
	private String attendanceDay;
	private int classRegistrationNo;
	private String attendanceCreatedate;
	private String attendanceUpdatedate;
	private String attendanceState;
	private String attendanceRemark;
	private List<Student> studentList;
	private List<Lecture> lectureList;
	private List<ClassRegistration> classRegistrationList;
}
