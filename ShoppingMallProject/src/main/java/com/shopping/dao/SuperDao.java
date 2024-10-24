package com.shopping.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class SuperDao {
	protected Connection conn = null ; 
	
	public Connection getConnection() {
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
			String id = "projectV2" ;
			String password = "oracle" ;
			
			this.conn = DriverManager.getConnection(url, id, password) ;
			if(conn == null) {System.out.println("접속 실패");} 			
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return conn ;
	}	
	
	public SuperDao() {
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		try {
			Class.forName(driver) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
