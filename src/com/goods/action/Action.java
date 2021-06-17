package com.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 변수 사용 X, 상수 사용 O
	// 메소드 사용 X, 추상 메소드 사용 O
	// => 동일한 동작을 수행하는 객체는 반드시 해당 메소드 (추상)를 구현해야함 (오버라이딩)
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		
		
}
