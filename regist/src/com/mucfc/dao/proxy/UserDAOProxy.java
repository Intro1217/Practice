package com.mucfc.dao.proxy;
import com.mucfc.dao.IUserDAO;
import com.mucfc.dao.UserDAOImpI;
import com.mucfc.dbc.DatabaseConnection;
import com.mucfc.vo.User;
public class UserDAOProxy implements IUserDAO{
    private DatabaseConnection dbc=null;//定義資料庫连接
    private IUserDAO dao=null;//定義DAO接口
    public UserDAOProxy(){
    	try {
			dbc=new DatabaseConnection();//實例化資料庫连接
		} catch (Exception e) {
			e.printStackTrace();
		}
    	dao=new UserDAOImpI(dbc.getConnection());
    	
    }
	@Override
	public boolean findLogin(User user) throws Exception {
		boolean bool=false;
		try {
			bool=dao.findLogin(user);//調用真實表單
		} catch (Exception e) {
			throw e;
		}finally{
			dbc.close();
		}
		return bool;
	}
 
}