package com.faq.db;

public class FaqDTO {

	private int faqNum;
	private String faqCategory;
	private String faqQuestion;
	private String faqAnswer;
	
	public int getFaqNum() {
		return faqNum;
	}
	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
	}
	public String getFaqCategory() {
		return faqCategory;
	}
	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}
	public String getFaqQuestion() {
		return faqQuestion;
	}
	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}
	public String getFaqAnswer() {
		return faqAnswer;
	}
	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}
	
	@Override
	public String toString() {
		return "FaqDTO [faqNum=" + faqNum + ", faqCategory=" + faqCategory + ", faqQuestion=" + faqQuestion
				+ ", faqAnswer=" + faqAnswer + "]";
	}

	
	
}
