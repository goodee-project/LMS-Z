package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class TeacherForm {
	private String teacherId; 
	private String teacherPw;
	private String teacherEmail;
	private String teacherPhone;
	private String teacherPhone1;
	private String teacherPhone2;
	private String teacherPhone3;
	private String teacherName;
	private String teacherGender;
	private String teacherBirth;
	private String teacherPosition;
	private String teacherAddressMain;
	private String teacherAddressSub;
    private String accountState;
    private String accountLevel;
}
