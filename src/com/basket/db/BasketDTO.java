package com.basket.db;

public class BasketDTO {
	private int basketNum;
	private String basketUserId;
	private int basketCosNum;
	private int basketCosAmount;
	
	public int getBasketNum() {
		return basketNum;
	}
	public void setBasketNum(int basketNum) {
		this.basketNum = basketNum;
	}
	public String getBasketUserId() {
		return basketUserId;
	}
	public void setBasketUserId(String basketUserId) {
		this.basketUserId = basketUserId;
	}
	public int getBasketCosNum() {
		return basketCosNum;
	}
	public void setBasketCosNum(int basketCosNum) {
		this.basketCosNum = basketCosNum;
	}
	public int getBasketCosAmount() {
		return basketCosAmount;
	}
	public void setBasketCosAmount(int basketCosAmount) {
		this.basketCosAmount = basketCosAmount;
	}
	
	@Override
	public String toString() {
		return "BasketDTO [basketNum=" + basketNum + ", basketUserId=" + basketUserId + ", basketCosNum=" + basketCosNum
				+ ", basketCosAmount=" + basketCosAmount + "]";
	}
	
}
