package goodee.gdj58.online.vo;

import lombok.Data;

@Data
public class Score {
	private int studentNo;
	private int testNo;
	private int question;
	private int score;
	private String createdate;
}
