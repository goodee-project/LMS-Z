package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class ClassRegistrationForm {
	private int classRegistrationNo;
	private int lectureNo;
	private String accountId;
	private String classRegistrationState;
	private String classRegistrationPoint;
	private String classRegistrationReview;
	private String classRegistrationCreateDate;
	private Lecture lecture;
	private Account account;
	private Classroom classroom;
	private Teacher teacher;
	private Subject subject;
	private Syllabus syllabus;
	private Textbook textbook;
}
