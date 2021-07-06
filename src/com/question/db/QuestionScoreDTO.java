package com.question.db;

public class QuestionScoreDTO {

	private int score1;
	private int score2;
	private int score3;
	private int score4;
	private int score5;
	
	public int getScore1() {
		return score1;
	}
	public void setScore1(int score1) {
		this.score1 = score1;
	}
	public int getScore2() {
		return score2;
	}
	public void setScore2(int score2) {
		this.score2 = score2;
	}
	public int getScore3() {
		return score3;
	}
	public void setScore3(int score3) {
		this.score3 = score3;
	}
	public int getScore4() {
		return score4;
	}
	public void setScore4(int score4) {
		this.score4 = score4;
	}
	public int getScore5() {
		return score5;
	}
	public void setScore5(int score5) {
		this.score5 = score5;
	}
	
	@Override
	public String toString() {
		return "QuestionScoreDTO [score1=" + score1 + ", score2=" + score2 + ", score3=" + score3 + ", score4=" + score4
				+ ", score5=" + score5 + "]";
	}
	
	
	
	
}
