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

public class Review_likeDAO {
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

    public void insertLike(Review_likeDTO likeDTO){
        int likeNum = 0;


        try {
            conn = getConnection();
            sql = "select max(likeNum) from review_like";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                likeNum = rs.getInt(1) + 1;

            }
            sql = "insert into review_like values(?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,likeNum);
            pstmt.setString(2,likeDTO.getUserId());
            pstmt.setInt(3,likeDTO.getCosNum());
            pstmt.setInt(4,likeDTO.getReviewNum());

            pstmt.executeUpdate();
            System.out.println("글 등록 완료");


        } catch (SQLException throwables) {
            System.out.println("디비 연결 실패!!");
            throwables.printStackTrace();
        } finally {
            closeDB();
        }

    }

    public List getLikeList(String userId){
        List likeList = new ArrayList();


        try {
            conn = getConnection();
            sql ="select * from review_like where userId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userId);
            rs = pstmt.executeQuery();

            if (rs.next()){
                Review_likeDTO likeDTO = new Review_likeDTO();
                likeDTO.setLikeNum(rs.getInt("likeNum"));
                likeDTO.setUserId(rs.getString("userId"));
                likeDTO.setCosNum(rs.getInt("cosNum"));
                likeDTO.setReviewNum(rs.getInt("reviewNum"));
                likeList.add(likeDTO);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
        return likeList;
    }

    // id cosNum 체크

    public int checkLike(String userId,int reviewNum){
        int checkDB = 0;

        try {
            conn = getConnection();
            sql = "select * from review_like where reviewNum=? and userId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,reviewNum);
            pstmt.setString(2,userId);
            rs = pstmt.executeQuery();
            if (rs.next()){
                    checkDB =1;

            }else {
                checkDB =2;
            }
            System.out.println("checkDB값 조회" +checkDB);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
        return checkDB;
    }



}
