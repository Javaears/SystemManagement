package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDAO {
	public BaseDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	//Mysql connection state  --------------------------
	private Connection conn;
	private Statement stm;
	private PreparedStatement pstm;
	private ResultSet rs;

	//Mysql connection start--------------------------
	public Connection getConn() {
		try {
			if (conn == null || conn.isClosed()) {
				conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/systemmanagement?useUnicode=true&characterEncoding=gbk",
						"root", "password123");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getConnection sucessful");
		}
		return conn;
	}

	// MySql Connection Successful--------------------
	public int executeUpdate(String sql) throws SQLException {
		if (getConn() == null) {
			System.out.println("excute update Sucessful!");
			return -1;
		}
		stm = conn.createStatement();
		return stm.executeUpdate(sql);
	}

	// Mysql connection Failed --------------------
	public int executeUpdate(String sql, Object[] obj) throws SQLException {
		if (getConn() == null) {
			System.out.println("getConnectio failed !");
			return -1;
		}
		pstm = conn.prepareStatement(sql);
		if (obj != null) {
			for (int i = 0; i < obj.length; i++) {
				pstm.setObject(i + 1, obj[i]);
			}
		}
		return pstm.executeUpdate();
	}

	// 	Mysql Query----------------------------
	public ResultSet executeQuery(String sql) throws SQLException {
		if (getConn() == null) {
			System.out.println("Mysql Query sucessful!");
			return null;
		}
		stm = conn.createStatement();
		rs = stm.executeQuery(sql);
		return rs;
	}

	// Query----------------------------
	public ResultSet executeQuery(String sql, Object[] obj) throws SQLException {
		if (getConn() == null) {
			System.out.println("Mysql Query sucessful!");
			return null;
		}
		pstm = conn.prepareStatement(sql);
		if (obj != null) {
			for (int i = 0; i < obj.length; i++) {
				pstm.setObject(i + 1, obj[i]);
			}
		}
		rs = pstm.executeQuery();
		return rs;
	}

	//ResultSet
	public void closeResultSet() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// Connection
	public void closeConnection() {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// PreparedStatement
	public void closeStatement() {
		if (stm != null) {
			try {
				stm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (pstm != null) {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
