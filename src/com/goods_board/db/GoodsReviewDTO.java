package com.goods_board.db;

import java.util.ArrayList;

public class GoodsReviewDTO extends ArrayList<GoodsReviewDTO> {
    // 리뷰 게시판 화장품 각각에 대한 리뷰. 화장품 상세 페이지 하단에 리뷰가 존재함

        // 리뷰 번호 리뷰 글 번호
        private int reviewNum;

        // 상품 번호 리뷰를 작성하는 상품 번호
        private int cosNum;

        // 회원 아이디 리뷰 작성자
        private String userid;

        // 리뷰 이미지 이미지 첨부파일
        private String reviewImage;

        // 별점 나중에 AVG() 매겨야함
        private int rating;

        // 댓글 내용 댓글 내용
        private String reviewContent;
        // 추천수
        private int reviewUp;

    public int getReviewNum() {
        return reviewNum;
    }

    public void setReviewNum(int reviewNum) {
        this.reviewNum = reviewNum;
    }

    public int getCosNum() {
        return cosNum;
    }

    public void setCosNum(int cosNum) {
        this.cosNum = cosNum;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getReviewImage() {
        return reviewImage;
    }

    public void setReviewImage(String reviewImage) {
        this.reviewImage = reviewImage;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewContent() {
        return reviewContent;
    }

    public void setReviewContent(String reviewContent) {
        this.reviewContent = reviewContent;
    }

    public int getReviewUp() {
        return reviewUp;
    }

    public void setReviewUp(int reviewUp) {
        this.reviewUp = reviewUp;
    }

    @Override
    public String toString() {
        return "GoodsReviewDTO{" +
                "reviewNum=" + reviewNum +
                ", cosNum=" + cosNum +
                ", userid='" + userid + '\'' +
                ", reviewImage='" + reviewImage + '\'' +
                ", rating=" + rating +
                ", reviewContent='" + reviewContent + '\'' +
                ", reviewUp=" + reviewUp +
                '}';
    }

}
