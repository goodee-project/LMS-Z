package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Faq {
	private int faqNo;
	private String accountId;
	private String faqWriter;
	private String faqTitle;
	private String faqContent;
	private String faqCreatedate;
	private String faqUpdatedate;
	private int faqCount;
	private String faqCategory;
}
