package com.goods_board.action;

public class ActionForward {
	// 페이지를 이동시 이동정보를 저장하는 객체
	
	// 이동할 주소
	private String path;
	// 이동하는 방식
	private boolean isRedirect;
	//  true - sendRedirect방식 이동
	//  false - forward방식 이동
	

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
