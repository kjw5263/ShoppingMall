package com.notice.db;

public class noticeDTO {
	private int noticeNum;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFile;
	private int noticeType;
	private String noticeRealFileName;
	private String noticeImg;
	private String noticeRealImgName;
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeFile() {
		return noticeFile;
	}
	public void setNoticeFile(String noticeFile) {
		this.noticeFile = noticeFile;
	}
	public int getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}

	
	public String getNoticeRealFileName() {
		return noticeRealFileName;
	}
	public void setNoticeRealFileName(String noticeRealFileName) {
		this.noticeRealFileName = noticeRealFileName;
	}
	@Override
	public String toString() {
		return "noticeDTO [noticeNum=" + noticeNum + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeFile=" + noticeFile + ", noticeType=" + noticeType + ", noticeRealFileName="
				+ noticeRealFileName + ", noticeImg=" + noticeImg + ", noticeRealImgName=" + noticeRealImgName + "]";
	}
	public String getNoticeImg() {
		return noticeImg;
	}
	public void setNoticeImg(String noticeImg) {
		this.noticeImg = noticeImg;
	}
	public String getNoticeRealImgName() {
		return noticeRealImgName;
	}
	public void setNoticeRealImgName(String noticeRealImgName) {
		this.noticeRealImgName = noticeRealImgName;
	}
	
}
