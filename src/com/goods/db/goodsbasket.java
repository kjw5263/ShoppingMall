package com.goods.db;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;

public class goodsbasket extends DBconnection{

	
	
	public void doit(BasketDTO bkDTO){
	 
		BasketDAO basd = new BasketDAO();
		
		int result = basd.checkGoods(bkDTO);
		//				" 없을경우 상품을 장바구니에 추가
		if(result != 1){
			basd.basketAdd(bkDTO);
		}
	}
}
