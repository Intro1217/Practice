package com.abc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.model.Account;
import com.abc.model.UserService;

@WebServlet(
    urlPatterns = { "/user/*" }, 
    initParams = {
        @WebInitParam(name = "USER_VIEW", value = "/user.jsp") 
    }
)
public class User extends HttpServlet {	
    private String USER_VIEW;

    @Override
    public void init() throws ServletException {
        USER_VIEW = getServletConfig().getInitParameter("USER_VIEW");
    }
	protected void doGet(HttpServletRequest request, 
	                     HttpServletResponse response) 
	                         throws ServletException, IOException {
	    UserService userService = 
	        (UserService) getServletContext().getAttribute("userService");
	    
	    String username = request.getPathInfo().substring(1);
	    
	    Account account = new Account();
	    account.setName(username);
	    if(userService.isUserExisted(account)) {
	    }
        request.setAttribute("username", username);
        request.getRequestDispatcher(USER_VIEW).forward(request, response);
	}
}
