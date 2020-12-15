package gd.fintech.lms.vo;

import lombok.Data;

@Data
public class Textbook {
	private int textbookIsbn; //String=>int
	private String textbookTitle;
	private String textbookWriter;
	private String textbookPublisher;
	private String textbookPublishdate;
	private String textbookInfo;
	private int textbookPrice;
}
