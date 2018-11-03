package com.abc.web;


import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.*;
import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import com.abc.model.*;

@WebListener
public class CinemaListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context)initContext.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) envContext.lookup("jdbc/abc");
            ServletContext context = sce.getServletContext();
            context.setAttribute("dataSource", dataSource);            
            context.setAttribute("userService", new UserService(
	        new AccountDAOJdbcImpl(dataSource)));
            context.setAttribute("message", new MessageDAO());            
        } catch (NamingException ex) {
            throw new RuntimeException(ex);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {}
}
