package com.usedate.action;

// 내가 임의로 만든 클래스!
// 목적? 페이지를 이동할 때, 이동정보를 저장하는 객체
// -> 페이지 이동하려면, ActionForward가 있어야만 한다!
public class ActionForward {
	// 이동할 주소
	private String path;
	
	// 이동하는 방식 - 어떻게 이동할거야? 2가지중 1가지
	private boolean isRedirect;
	// true - sendRedirect 방식 이동
	// false - forward 방식 이동

	
	/******************* Getter / Setter **********************/
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
	
}
