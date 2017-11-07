package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcUtil {
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {

		String dbUrl = "jdbc:mysql://localhost:3306/housingDb?useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPassword = "123";

		return DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	}

	public static void close(PreparedStatement ps, Connection conn)
			throws SQLException {
		ps.close();
		conn.close();
	}
	
    public static void closeAll(ResultSet rs,PreparedStatement ps,Connection conn){
        try {
            if(rs!=null)
                rs.close();
            if(ps!=null)
                ps.close();
            if(conn!=null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
