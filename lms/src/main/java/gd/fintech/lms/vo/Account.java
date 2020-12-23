package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Account {
	private String accountId;
    private String accountPw;
    private String accountState;
    private String accountLevel;
    private String accountCreateDate;
    private String accountUpdateDate;
}
