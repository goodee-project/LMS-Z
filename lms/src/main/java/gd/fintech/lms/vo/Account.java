package gd.fintech.lms.vo;

import java.util.List;

import lombok.Data;

@Data
public class Account {
	private String accountId;
    private String accountPw;
    private String accountState;
    private int accountLevel;
    private String accountCreateDate;
    private String accountUpdatedate;
    private List<StudentQueue> studentQueue;
    private List<TeacherQueue> teacherQueue;
}
