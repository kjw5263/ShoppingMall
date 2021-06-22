package com.coupon.db;

public class CouponDTO {
	private int mcNum;
	private int mcCouponNum;
	private String mcUserID;
	private int mcAmount;
	
	private int couponNum;
	private String couponName;
	private String couponNote;
	private int couponDc;
	
	
	
	
	public int getMcNum() {
		return mcNum;
	}
	public void setMcNum(int mcNum) {
		this.mcNum = mcNum;
	}
	public int getMcCouponNum() {
		return mcCouponNum;
	}
	public void setMcCouponNum(int mcCouponNum) {
		this.mcCouponNum = mcCouponNum;
	}
	public String getMcUserID() {
		return mcUserID;
	}
	public void setMcUserID(String mcUserID) {
		this.mcUserID = mcUserID;
	}
	public int getMcAmount() {
		return mcAmount;
	}
	public void setMcAmount(int mcAmount) {
		this.mcAmount = mcAmount;
	}
	public int getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(int couponNum) {
		this.couponNum = couponNum;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getCouponNote() {
		return couponNote;
	}
	public void setCouponNote(String couponNote) {
		this.couponNote = couponNote;
	}
	public int getCouponDc() {
		return couponDc;
	}
	public void setCouponDc(int couponDc) {
		this.couponDc = couponDc;
	}
	
	@Override
	public String toString() {
		return "CouponDTO [mcNum=" + mcNum + ", mcCouponNum=" + mcCouponNum + ", mcUserID=" + mcUserID + ", mcAmount="
				+ mcAmount + ", couponNum=" + couponNum + ", couponName=" + couponName + ", couponNote=" + couponNote
				+ ", couponDc=" + couponDc + "]";
	}
	
	
	
	
	
}
