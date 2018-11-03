<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*,javax.sql.DataSource,com.abc.model.*" %>
<% 
	MessageDAO msg = (MessageDAO) application.getAttribute("message");
	String title = msg.getTitle();
	String marquee = msg.getMarquee();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=title%></title>
<link href="css/css2.css" rel="stylesheet" type="text/css">
<link href="css/s2.css" rel="stylesheet" type="text/css">
<script src="scripts/jquery-1.9.1.min.js"></script>
<script src="scripts/js.js"></script>
</head>

<body>
<div id="main">
  <div id="top" class="ct" style=" background:#999 center; background-size:cover; " title="<%=title%>">
    <h1 style="margin:0;padding:0;"><%=title%></h1>
  </div>
  <div id="top2"> <a href="index.jsp">首頁</a> <a href="order.jsp">線上訂票</a> <a href="member2.jsp">會員系統</a> <a href="admin.jsp">管理系統</a> </div>
  <div id="text"> <span class="ct">最新活動</span>
	<marquee direction="right"> <%=marquee%> </marquee>
  </div>
  <div id="mm">
    <div class="tab rb" style="width:87%;">
      <div style="width:100%; color:#333; text-align:left">
            <div style="width:400px;margin:10px auto;padding:10px;">
    <% if (request.getAttribute("errors") != null) {%>
        <h1>新增會員失敗</h1>
        <ul style='color: rgb(255, 0, 0);'>
        <% List<String> err = new ArrayList<String>();  
    	   err = (List<String>) request.getAttribute("errors");
    	 	for (String str : err){%>
                <li><%=str%></li>
        </ul><br>
    <%	}
      } 
    %>
        <h1 class="ct whi">會員註冊</h1>
        <form method='post' action='register.do'>
            <table bgcolor=#cccccc>
                <tr>
                    <td>名稱（最大16字元）：</td>
                    <td><input type='text' name='username' value='${param.username}' size='25' maxlength='16'></td>
                </tr>
                <tr>
                    <td>密碼（6到16字元）：</td>
                    <td><input type='password' name='password' size='25' maxlength='16'>
                    </td>
                </tr>
                <tr>
                    <td>確認密碼：</td>
                    <td><input type='password' name='confirmedPasswd' size='25' maxlength='16'></td>
                </tr>
                <tr>
                    <td>郵件位址：</td>
                    <td><input type='text' name='email' value='${param.email}' size='25' maxlength='100'>
                    </td>
                </tr>
                <tr>
                    <td colspan='2' align='center'><input type='submit' value='註冊'></td>
                </tr>
            </table>
        </form>
      </div>
    </div>
            </div>
  </div>
<div id="bo"> ©Copyright 2018 <%=title%> 版權所有 </div>
</div>
<script>
</script>
</body>
</html>