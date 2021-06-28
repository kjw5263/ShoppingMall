package com.goods_board.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsReviewDAO {

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private String sql = "";

    private Connection getConnection() {
        try {
            // Context 객체를 생성 (프로젝트 정보를 가지고있는객체)
            Context initCTX = new InitialContext();
            // DB연동 정보를 불러오기(context.xml)
            DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/cosShopping");

            conn = ds.getConnection();

            System.out.println(" 드라이버 로드, 디비연결 성공! ");
            System.out.println(conn);

        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }// getConnection() - 디비연결 끝

    // 자원해제코드 - finally 구문에서 사용
    public void closeDB() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // 글 등록

    public void createReview(GoodsReviewDTO grdto) {
        int reviewNum = 0;


        try {
            conn = getConnection();
            sql = "select max(reviewNum) from review_board";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                reviewNum = rs.getInt(1) + 1;

            }
            sql = "insert into review_board values(?,?,?,?,?,?,?,now())";

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, reviewNum);
            pstmt.setInt(2, grdto.getCosNum());
            pstmt.setString(3, grdto.getUserid());
            pstmt.setString(4, grdto.getReviewImage());
            pstmt.setInt(5, grdto.getRating());
            pstmt.setString(6, grdto.getReviewContent());
            pstmt.setInt(7, grdto.getReviewUp());

            pstmt.executeUpdate();
            System.out.println("글 등록 완료");


        } catch (SQLException throwables) {
            System.out.println("디비 연결 실패!!");
            throwables.printStackTrace();
        } finally {
            closeDB();
        }
    }

     // 아이디 글 조회
        public ArrayList<GoodsReviewDTO> getReview(String userId){
            ArrayList<GoodsReviewDTO> reviewUserList = new ArrayList<GoodsReviewDTO>();
            try {
                conn = getConnection();
                sql= "select * from review_board where userId=?";

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,userId);

                rs = pstmt.executeQuery();
                while (rs.next()){
                   GoodsReviewDTO grdto = new GoodsReviewDTO();
                    grdto.setCosNum(rs.getInt("cosNum"));
                    grdto.setRating(rs.getInt("rating"));
                    grdto.setReviewdate(rs.getDate("reviewdate"));
                    grdto.setReviewContent(rs.getString("reviewContent"));
                    grdto.setReviewNum(rs.getInt("reviewNum"));
                    grdto.setUserid(rs.getString("userId"));
                    grdto.setReviewUp(rs.getInt("reviewUp"));
                    grdto.setReviewImage(rs.getString("reviewImage"));

                    reviewUserList.add(grdto);

                }
                System.out.println("DAO : 회원 리뷰 글 저장");

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                closeDB();
            }
            return reviewUserList;
        }
// 글 개수 구하기
    public int getReviewCount(int cosNum){
        int cnt = 0;
        try {
            conn = getConnection();
            sql="select count(*) from review_board where cosNum=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cosNum);
            rs = pstmt.executeQuery();

            if (rs.next()){
                cnt = rs.getInt(1);

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
                return cnt;
    }

    public int getUserReviewCnt(String userId){
        int count = 0;
        try {
            conn = getConnection();
            sql="select count(*) from review_board where userId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userId);
            rs = pstmt.executeQuery();

            if (rs.next()){
                count = rs.getInt(1);

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
        return count;
    }
    public ArrayList<GoodsReviewDTO> userReviewList(int page, int limit,String userId){
        ArrayList<GoodsReviewDTO> userReviewList = new ArrayList<GoodsReviewDTO>();
        GoodsReviewDTO grdto = null;
        int startRow = (page - 1) *3;


        try {
            conn = getConnection();
            sql = "select * from review_board where userId=? limit ?, 3";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userId);
            pstmt.setInt(2,startRow);

            rs = pstmt.executeQuery();

            while (rs.next()){
                grdto = new GoodsReviewDTO();
                grdto.setCosNum(rs.getInt("cosNum"));
                grdto.setRating(rs.getInt("rating"));
                grdto.setReviewContent(rs.getString("reviewContent"));
                grdto.setReviewNum(rs.getInt("reviewNum"));
                grdto.setUserid(rs.getString("userId"));
                grdto.setReviewUp(rs.getInt("reviewUp"));
                grdto.setReviewImage(rs.getString("reviewImage"));
                grdto.setReviewdate(rs.getDate("reviewdate"));

                userReviewList.add(grdto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
        return userReviewList;
    }

    // 글 평점 값
    public int getRating(int cosNum){
        int rating =0;
        try {
            conn = getConnection();
            sql="select avg(rating) from review_board where cosNum=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cosNum);
            rs = pstmt.executeQuery();

            if (rs.next()){
                rating = rs.getInt(1);

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
        return rating;
    }

    // 글 목록 보기

    public ArrayList<GoodsReviewDTO> selectReviewList(int page, int limit,int cosNum){
            ArrayList<GoodsReviewDTO> reviewList = new ArrayList<GoodsReviewDTO>();
            GoodsReviewDTO grdto = null;
            int startrow = (page - 1) *10;


        try {
            conn = getConnection();
            sql = "select * from review_board where cosNum=? limit ?,10";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cosNum);
            pstmt.setInt(2,startrow);

            rs = pstmt.executeQuery();

            while (rs.next()){
                grdto = new GoodsReviewDTO();
                grdto.setCosNum(rs.getInt("cosNum"));
                grdto.setRating(rs.getInt("rating"));
                grdto.setReviewContent(rs.getString("reviewContent"));
                grdto.setReviewNum(rs.getInt("reviewNum"));
                grdto.setUserid(rs.getString("userId"));
                grdto.setReviewUp(rs.getInt("reviewUp"));
                grdto.setReviewImage(rs.getString("reviewImage"));
                grdto.setReviewdate(rs.getDate("reviewdate"));

                reviewList.add(grdto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
            return reviewList;
    }


    public int deleteReview(int reviewNum){
            int deleteCount = 0;

        try {
            conn = getConnection();
            sql = "delete from review_board where reviewNum=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,reviewNum);
            deleteCount = pstmt.executeUpdate();

            System.out.println("글 삭제 완료!" + deleteCount);

        } catch (SQLException throwables) {
            System.out.println("삭제 실패" +throwables);
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
        return deleteCount;
    }


    public int checkUser(String userId , int cosNum){
        int checkId =0;

        try {
            conn = getConnection();
            sql="select * from review_board where userId=? and cosNum=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userId);
            pstmt.setInt(2,cosNum);
            rs = pstmt.executeQuery();
            if (rs.next()){
                checkId =1;
            }else {
                checkId=2;
            }

        } catch (SQLException throwables) {
            System.out.println("아이디 체크 오류" +throwables);
        }finally {
            closeDB();
        }
        return checkId;

    }
    // 좋아요
    public int reviewUp(int reviewNum) {
        int numCount = 0;

        try {
            conn = getConnection();
            sql = "update review_board set reviewUp=" +
                    "reviewUp+1 where reviewNum=" + reviewNum;
            pstmt = conn.prepareStatement(sql);
            numCount = pstmt.executeUpdate();

            System.out.println("numCount값 출력..." + numCount);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }

        return numCount;
    }


    // 글 수정
    public int updateReview(int reviewNum,GoodsReviewDTO grdto){
        int updateCount = 0;
        try {
            conn=getConnection();
            sql="update review_board set rating=? ,reviewContent=? where reviewNum=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,grdto.getRating());
            pstmt.setString(2,grdto.getReviewContent());
            pstmt.setInt(3,reviewNum);
            updateCount =pstmt.executeUpdate();
            System.out.println("글 수정 완료" + updateCount);
        } catch (SQLException throwables) {
            System.out.println("글 수정 에러" + throwables);
        }finally {
            closeDB();
        }
        return updateCount;
    }


}




