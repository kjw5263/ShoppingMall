package com.usedate.db;

import java.sql.Date;

public class UsedateDTO {

	private int openNum;
	private int o_Num;
	private String openUserId;
	private int openCosNum;
	private Date openDate;
	private Date CalDate;
	
	
	public int getO_Num() {
		return o_Num;
	}
	public void setO_Num(int o_Num) {
		this.o_Num = o_Num;
	}
	public Date getCalDate() {
		return CalDate;
	}
	public void setCalDate(Date calDate) {
		CalDate = calDate;
	}
	public int getOpenNum() {
		return openNum;
	}
	public void setOpenNum(int openNum) {
		this.openNum = openNum;
	}
	public String getOpenUserId() {
		return openUserId;
	}
	public void setOpenUserId(String openUserId) {
		this.openUserId = openUserId;
	}
	public int getOpenCosNum() {
		return openCosNum;
	}
	public void setOpenCosNum(int openCosNum) {
		this.openCosNum = openCosNum;
	}
	public Date getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
	@Override
	public String toString() {
		return "UsedateDTO [openNum=" + openNum + ", openUserId=" + openUserId + ", openCosNum=" + openCosNum
				+ ", openDate=" + openDate + "]";
	}
	
	
}
