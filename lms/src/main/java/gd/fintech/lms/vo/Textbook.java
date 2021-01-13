package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Textbook {
	private String textbookIsbn;
	private String textbookTitle;
	private String textbookWriter;
	private String textbookPublisher;
	private String textbookPublishdate;
	private String textbookInfo;
	private int textbookPrice;
}
