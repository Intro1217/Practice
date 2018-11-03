package com.mucfc.dbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	//定義資料庫驅動程序
		private static final String DBDRIVER="com.mysql.jdbc.Driver";
		//資料庫連接地址
		private static final String DBURL="jdbc:mysql://localhost:3306/example";//example為資料庫名稱
		private static final String DBUSER="root";
		private static final String DBPASS="1234";
	    private Connection connection=null;
	    public DatabaseConnection() throws Exception{
	    	try{
	    		//資料庫操作可能出現異常
	    		Class.forName(DBDRIVER);
	    		connection=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
	    		
	    	}catch(Exception exception ){
	    		throw exception;
	    	} finally {
			}	
	    }
	    public Connection getConnection(){
	    	return connection;
	    }
	    public void close() throws Exception{
	    	if(connection!=null){
	    		try {
	    			connection.close();			
				} catch (Exception e) {
					throw e;
				}
	    	}
	    	
	    }
}
