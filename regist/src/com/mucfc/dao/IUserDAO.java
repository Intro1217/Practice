package com.mucfc.dao;

import com.mucfc.vo.User;

public interface IUserDAO {
	public abstract boolean findLogin(User user) throws Exception;
	

}
