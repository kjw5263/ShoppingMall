package com.goods_board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 상수,추상메서드
	// => 동일한 동작을 수행하는 객체는 반드시 해당 메서드(추상)를 구현 해야함(오버라이딩)
	public ActionForward execute(HttpServletRequest request,
                                 HttpServletResponse response) throws Exception;
}
