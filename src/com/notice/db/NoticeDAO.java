package com.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

import com.goods.db.DBconnection;
import com.goods.db.setGoodsTool;
import com.var.list.varlist;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class NoticeDAO {
	
	private ResultSet rs = null;
	private String sql = "";
	varlist vars = new varlist();
	private String databasename = vars.getDatabasename();
	
	DBconnection con = new DBconnection();
	setGoodsTool setTool = new setGoodsTool();
	
	
}
