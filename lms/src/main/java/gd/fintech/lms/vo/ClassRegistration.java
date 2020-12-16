package gd.fintech.lms.vo;

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
}
