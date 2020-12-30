package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class ClassRegistration {
	private int classRegistrationNo;
	private int lectureNo;
	private String accountId;
	private String classRegistrationState;
	private String classRegistrationPoint;
	private String classRegistrationReview;
	private String classRegistrationCreateDate;
	private Lecture lecture;
	private List<Student> studentList;
	private List<Lecture> lectureList;
	private List<Attendance> attendanceList;
}
