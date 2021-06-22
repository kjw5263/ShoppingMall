package com.like.db;

public class LikeDTO {

	private String likeUserId;
	private int likeCosNum;
	
	
	public String getLikeUserId() {
		return likeUserId;
	}
	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
	}
	public int getLikeCosNum() {
		return likeCosNum;
	}
	public void setLikeCosNum(int likeCosNum) {
		this.likeCosNum = likeCosNum;
	}
	@Override
	public String toString() {
		return "LikeDTO [likeUserId=" + likeUserId + ", likeCosNum=" + likeCosNum + "]";
	}
	
	
}
