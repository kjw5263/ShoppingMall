package com.goods_board.db;

public class Review_likeDTO {

    private int likeNum;
    private String userId;
    private int cosNum;
    private int reviewNum;

    public int getReviewNum() {
        return reviewNum;
    }

    public void setReviewNum(int reviewNum) {
        this.reviewNum = reviewNum;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getCosNum() {
        return cosNum;
    }

    public void setCosNum(int cosNum) {
        this.cosNum = cosNum;
    }

    @Override
    public String toString() {
        return "Review_likeDTO{" +
                "likeNum=" + likeNum +
                ", userId='" + userId + '\'' +
                ", cosNum=" + cosNum +
                ", reviewNum=" + reviewNum +
                '}';
    }
}
