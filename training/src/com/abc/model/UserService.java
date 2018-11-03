package com.abc.model;

import java.util.*;
import java.io.*;

public class UserService {
    private AccountDAO accountDAO;
    
    public UserService(String USERS,AccountDAO userDAO) {
        this(userDAO);
    }
    
    public UserService(AccountDAO userDAO) {
        this.accountDAO = userDAO;
    }

    public boolean isUserExisted(Account account) {
        return accountDAO.isUserExisted(account);
    }
    
    public void add(Account account) {
        accountDAO.addAccount(account);
    }

    public boolean checkLogin(Account account) {
        if (account.getName() != null && account.getPassword() != null) {
            Account storedAcct = accountDAO.getAccount(account); 
            return storedAcct != null && 
                   storedAcct.getPassword().equals(account.getPassword()); 
        }
        return false;
    }
    
    public void changePass(Account account) {   	
    	accountDAO.ChangePass(account);
    }

}
