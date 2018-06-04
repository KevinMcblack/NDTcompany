package DAO;

import java.sql.*;

public class DBUtil {
	String dateBaseName;
	private Connection connect;
	private Statement stmt;
	public DBUtil(String DBName) {
		super();
		this.dateBaseName = DBName;
		try {
			Class.forName("com.mysql.jdbc.Driver"); //加载MYSQL JDBC驱动程序     
			System.out.println("Success loading Mysql Driver!");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DBName+"?useSSL=false&characterEncoding=utf-8",
					"root", "1234");
			//连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码  
			System.out.println("Success connect Mysql server!");
			stmt = connect.createStatement();
		} catch (Exception e) {
			System.out.print("Error loading Mysql Driver!");
			e.printStackTrace();
		}
	}
	public void update(String sql){
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ResultSet query(String sql){
		ResultSet rs=null;
		try {
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public void close(){
		try {
			stmt.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
