package com.abc.model;

import java.util.*;
import java.sql.*;

public class MessageDAO {
	private String title, marquee;
	private String jdbcUrl = "jdbc:mysql://localhost:3306/abc";
	private String username = "root";
	private String password = "1234";
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private SQLException ex = null;

	public MessageDAO() {
		String str = "SELECT * FROM message;";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, username, password);
			stmt = conn.prepareStatement(str, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(str);
			rs.next();
			title = rs.getString(1);
			marquee = rs.getString(2);
			rs.close();
		} catch (ClassNotFoundException | SQLException e) {
			title = "message not found.";
			marquee = "message not found.";
		}
	}

	public String getTitle() {
		return title;
	}

	public String getMarquee() {
		return marquee;
	}

	public void setTitle(String s) {
		title = s;
		String sql = "update message set title='" + s + "';";
		try {
			// System.out.println(sql);
			int result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("update title failed.");
		}
	}

	public void setMarquee(String s) {
		marquee = s;
		String sql = "update message set marquee='" + s + "';";
		try {
			// System.out.println(sql);
			int result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("update marquee failed.");
		}
	}

}
