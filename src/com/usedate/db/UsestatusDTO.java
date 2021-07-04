package com.usedate.db;

import java.sql.Date;

public class UsestatusDTO {
	
	private int status_Num;
	private int o_Num;
	private int s_cosNum;
	private String s_userId;
	private int first_open;
	private int open_status;
	private int remain_amount;
	private Date first_date;
	
	
	
	public int getO_Num() {
		return o_Num;
	}
	public void setO_Num(int o_Num) {
		this.o_Num = o_Num;
	}
	public int getStatus_Num() {
		return status_Num;
	}
	public void setStatus_Num(int status_Num) {
		this.status_Num = status_Num;
	}
	public int getS_cosNum() {
		return s_cosNum;
	}
	public void setS_cosNum(int s_cosNum) {
		this.s_cosNum = s_cosNum;
	}
	public String getS_userId() {
		return s_userId;
	}
	public void setS_userId(String s_userId) {
		this.s_userId = s_userId;
	}
	public int getFirst_open() {
		return first_open;
	}
	public void setFirst_open(int first_open) {
		this.first_open = first_open;
	}
	public int getOpen_status() {
		return open_status;
	}
	public void setOpen_status(int open_status) {
		this.open_status = open_status;
	}
	public int getRemain_amount() {
		return remain_amount;
	}
	public void setRemain_amount(int remain_amount) {
		this.remain_amount = remain_amount;
	}
	public Date getFirst_date() {
		return first_date;
	}
	public void setFirst_date(Date first_date) {
		this.first_date = first_date;
	}
	@Override
	public String toString() {
		return "UsestatusDTO [status_Num=" + status_Num + ", s_cosNum=" + s_cosNum + ", s_userId=" + s_userId
				+ ", first_open=" + first_open + ", open_status=" + open_status + ", remain_amount=" + remain_amount
				+ ", first_date=" + first_date + "]";
	}
	
	
	
	
}
