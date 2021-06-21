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
            sql = "insert into review_board (reviewNum,cosNum,userId,reviewImage,rating,reviewContent,reviewUp)" +
                    "values(?,?,?,?,?,?,?)";
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

        public ArrayList<GoodsReviewDTO> getReview(int cosNum){
            ArrayList<GoodsReviewDTO> getReview = new ArrayList<GoodsReviewDTO>();
            GoodsReviewDTO grdto = new GoodsReviewDTO();
            try {
                conn = getConnection();
                sql= "select * from review_board where cosNum=?";

                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,cosNum);

                rs = pstmt.executeQuery();
                if (rs.next()){
                    grdto = new GoodsReviewDTO();
                    grdto.setCosNum(rs.getInt("cosNum"));
                    grdto.setRating(rs.getInt("rating"));
                    grdto.setReviewContent(rs.getString("reviewContent"));
                    grdto.setReviewNum(rs.getInt("reviewNum"));
                    grdto.setUserid(rs.getString("userId"));
                    grdto.setReviewUp(rs.getInt("reviewUp"));
                    grdto.setReviewImage(rs.getString("reviewImage"));
                }
                System.out.println("DAO : 회원 정보 저장");

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                closeDB();
            }
            return grdto;
        }
// 글 개수 구하기
    public int getReviewCount(){
        int cnt = 0;
        try {
            conn = getConnection();
            sql="select count(*) from review_board";
            pstmt = conn.prepareStatement(sql);
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
    // 글 목록 보기

    public ArrayList<GoodsReviewDTO> selectReviewList(int startRow, int pageSize,int cosNum){
            ArrayList<GoodsReviewDTO> reviewList = new ArrayList<GoodsReviewDTO>();
            GoodsReviewDTO grdto = null;
            int startrow = (startRow - 1) *10;
        try {
            conn = getConnection();
            sql = "select * from review_board where cosNum=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cosNum);


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

                reviewList.add(grdto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
            return reviewList;
    }


    public int deleteReview(GoodsReviewDTO grdto){
        int check = -1;

        try {
            conn = getConnection();
            sql = "select userId from review_board where cosNum=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,grdto.getCosNum());

            rs = pstmt.executeQuery();

            if (rs.next()){
                if (grdto.getUserid().equals(rs.getString("userId"))){
                    sql = "delete from review_board where cosNum=?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1,grdto.getCosNum());

                    check = pstmt.executeUpdate();
                }else {
                    check = 0;
                }
            }else {
                check = -1;
            }
            System.out.println("글 삭제 완료!" + check);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
        return check;
    }





}




