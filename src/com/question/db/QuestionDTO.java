package com.question.db;

public class QuestionDTO {

	
	private int Qnum;
	private String Qsub;
	
	public int getQnum() {
		return Qnum;
	}
	public void setQnum(int qnum) {
		Qnum = qnum;
	}
	public String getQsub() {
		return Qsub;
	}
	public void setQsub(String qsub) {
		Qsub = qsub;
	}
	
	@Override
	public String toString() {
		return "questionDTO [Qnum=" + Qnum + ", Qsub=" + Qsub + "]";
	}
	
	
	
	
}
