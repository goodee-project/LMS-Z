package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class TeacherQueue {
	private String teacherId;
	private String teacherEmail;
	private String teacherName;
	private String teacherPhone;
	private String teacherGender;
	private String teacherBirth;
	private String teacherAddressMain;
	private String teacherAddressSub;
	private Account account;
}
