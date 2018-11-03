package com.mucfc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.mucfc.vo.User;

public class UserDAOImpI implements IUserDAO{
	private Connection conn=null;//定義資料庫連接對象
	private PreparedStatement pstmt=null;//定義資料庫操作對象
	public UserDAOImpI(Connection conn){ //設置資料庫連接
		this.conn=conn;
	}
	@Override
	public boolean findLogin(User user) throws Exception {
		boolean bool=false;
		try {
			String sql="select name from user where name=? and password=?";
			pstmt=conn.prepareStatement(sql);//實例化操作
			pstmt.setString(1,user.getName());
		    pstmt.setString(2,user.getPassword());
		    ResultSet rSet=pstmt.executeQuery();//取得结果 
		    if(rSet.next()){
		    	user.setName(rSet.getString(1));//取得用戶名
		    	bool=true;   	
		    }
		    
		} catch (Exception e) {
			throw e;
			
		}finally{	//關閉操作
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (Exception e) {
					throw e;				
			}		
		}
			
		}
		return bool;
	}

}
