package com.abc.controller;

import java.io.*;
import com.jspsmart.upload.File;
import com.jspsmart.upload.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet("/upload.do")
public class UploadFile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String dirUpload = "/poster";
        int intNo = 0, i;
        File file;
        //--- new SmartUpload 類別 ---
        SmartUpload su = new SmartUpload();
        //--- 初始化, 傳入 pageContext 隱含物件 ---
        su.initialize(this.getServletConfig(), req,resp);
        try {
          su.upload();
          intNo = su.save(dirUpload);   //Save uploaded files
          intNo = su.getFiles().getCount();
          for (i = 0; i < intNo; i++) {
             file = su.getFiles().getFile(i);
             if (!file.isMissing()) {   //若檔案存在
/*                out.println(file.getFileName() + " = <font color=0000ff><b>");
*/             }
          }
//          Request request = su.getRequest();
          resp.sendRedirect("admin.jsp?do=poster");
        } catch (Exception e) { 
          System.out.println(e.toString());
        }
    }

}
