package com.goods.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GoodsDAO {
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


    // 상세페이지 시작
    public GoodsDTO getGoods(int cosNum){
        GoodsDTO goods = null;
        try {
            conn = getConnection();
            sql= "select * from cos_List where cosNum=? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cosNum);
            rs = pstmt.executeQuery();

            if (rs.next()){
                goods = new GoodsDTO();

                goods.setCosNum(rs.getInt("cosNum"));
                goods.setCosName(rs.getString("cosName"));
                goods.setCosPrice(rs.getInt("cosPrice"));
                goods.setCosBrand(rs.getString("cosBrand"));
                goods.setCosCategory(rs.getString("cosCategory"));
                goods.setCosSkinType(rs.getString("cosSkinType"));
                goods.setCosTrouble(rs.getString("cosTrouble"));
                goods.setCosAmount(rs.getInt("cosAmount"));
                goods.setCosVolumn(rs.getInt("cosVolumn"));
                goods.setMadeCompany(rs.getString("madeCompany"));
                goods.setIngredient(rs.getString("ingredient"));
                goods.setCosMethod(rs.getString("cosMethod"));
                goods.setCosWarning(rs.getString("cosWarning"));
                goods.setCosImage(rs.getString("cosImage"));
                goods.setOrderCount(rs.getInt("orderCount"));
                goods.setUseDate(rs.getInt("useDate"));



            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            closeDB();
        }
            return goods;
    }


}
