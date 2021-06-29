package com.member.db;

import java.sql.Date;


public class MemberDTO {

	 // 회원 번호 회원별 고유 번호
	 private int userNum;
	
	 // 회원 아이디 회원별 고유 아이디(user01-user08)
	 private String userId;
	
	 // 회원 비밀번호 회원 비밀번호
	 private String userPass;
	
	 // 회원 이름 회원 이름
	 private String userName;
	
	 // 회원 이메일 회원 이메일
	 private String userEmail;
	
	 // 회원 주소 회원 주소
	 private String userAddr;
	
	 // 회원 전화번호 휴대폰 번호(010-0000-0000)
	 private String userTel;
	
	 // 회원 생년월일 생년월일
	 private String userBirth;
	
	 // 회원 성별 성별(남/여)
	 private String userGender;
	
	 // 회원 피부타입 건성/중성/지성/복합성
	 private String userSkinType;
	
	 // 회원 피부고민 민감성/아토피/여드름/해당없음
	 private String userTrouble;
	
	 // 회원 포인트 회원의 적립된 포인트
	 private int userPoint;
	
	 // 누적 사용금액 회원의 누적 사용 금액
	 private int userTotal;
	
	 // 회원 등급 누적금액에 대한 회원 등급(1-4)
	 private int userLevel;

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserSkinType() {
		return userSkinType;
	}

	public void setUserSkinType(String userSkinType) {
		this.userSkinType = userSkinType;
	}

	public String getUserTrouble() {
		return userTrouble;
	}

	public void setUserTrouble(String userTrouble) {
		this.userTrouble = userTrouble;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public int getUserTotal() {
		return userTotal;
	}

	public void setUserTotal(int userTotal) {
		this.userTotal = userTotal;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	@Override
	public String toString() {
		return "MemberDTO [userNum=" + userNum + ", userId=" + userId + ", userPass=" + userPass + ", userName="
				+ userName + ", userEmail=" + userEmail + ", userAddr=" + userAddr + ", userTel=" + userTel
				+ ", userBirth=" + userBirth + ", userGender=" + userGender + ", userSkinType=" + userSkinType
				+ ", userTrouble=" + userTrouble + ", userPoint=" + userPoint + ", userTotal=" + userTotal
				+ ", userLevel=" + userLevel + "]";
	}
	 

}
