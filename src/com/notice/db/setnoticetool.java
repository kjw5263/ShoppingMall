package com.notice.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.goods.db.GoodsDTO;

public class setnoticetool {
	public GoodsDTO setdata(GoodsDTO goods, ResultSet rs) {

		try {
			goods.setCosNum(rs.getInt("cosNum"));
			goods.setCosName(rs.getString("cosName"));
			goods.setCosPrice(rs.getInt("cosPrice"));
			goods.setCosBrand(rs.getString("cosBrand"));
			goods.setCosCategory(rs.getString("cosCategory"));
			goods.setCosSkinType(rs.getString("cosSkinType"));
			goods.setCosTrouble(rs.getString("cosTrouble"));
			goods.setCosAmount(rs.getInt("cosAmount"));
			goods.setCosVolumn(rs.getInt("cosVolumn"));
			goods.setIngredient(rs.getString("ingredient"));
			goods.setMadeCompany(rs.getString("madeCompany"));
			goods.setIngredient(rs.getString("ingredient"));
			goods.setCosMethod(rs.getString("cosMethod"));
			goods.setCosWarning(rs.getString("cosWarning"));
			goods.setCosImage(rs.getString("cosImage"));
			goods.setOrderCount(rs.getInt("orderCount"));
			goods.setUseDate(rs.getInt("useDate"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 리스트 한칸에 상품 1개를 저장

		return goods;
	}
}
