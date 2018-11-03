<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.*,javax.sql.DataSource,com.abc.model.*" %>
<%!    private boolean isInvalidPassword(String password, String NewPasswd,String confirmedPasswd) {
    	return NewPasswd == null || NewPasswd.length() < 6 || password.equals(NewPasswd)
            || NewPasswd.length() > 16 || !NewPasswd.equals(confirmedPasswd);
}
 %>
<%  String message="";
	MessageDAO msg = (MessageDAO) application.getAttribute("message");
	String title = msg.getTitle();
	String marquee = msg.getMarquee();
	if (!("".equals(request.getParameter("newpass"))) && 
		((request.getParameter("newpass")) != null)){
		if (isInvalidPassword(request.getParameter("password"),request.getParameter("newpass"),request.getParameter("confirmedPasswd"))){
		message = "請確認密碼符合格式並再度確認密碼";
		}
		else{
		Account account = new Account();
		account.setPassword(request.getParameter("newpass"));
		account.setName((String)session.getAttribute("login"));
		UserService usc = (UserService) application.getAttribute("userService");
		usc.changePass(account);
		message = "密碼修改成功";
		response.sendRedirect("member2.jsp");
		}
	}	
%>
<!DOCTYPE html>
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
        <p class="ct" style='color: rgb(255, 0, 0);'><%=message %></p>
        <h1 class="ct whi"><%=session.getAttribute("login") %>&nbsp;&nbsp;修改密碼</h1>
        <form method='post' action='chgpass.jsp'>
            <table style="margin:0px auto;" bgcolor=#cccccc>
                <tr>
                    <td>原密碼：</td>
                    <td><input type='password' name='password' size='25' maxlength='16'>
                    </td>
                </tr>
                <tr>
                    <td>新密碼：</td>
                    <td><input type='password' name='newpass' size='25' maxlength='16'>
                    </td>
                </tr>
                <tr>
                    <td>確認密碼：</td>
                    <td><input type='password' name='confirmedPasswd' size='25' maxlength='16'></td>
                </tr>
                <tr>
                    <td colspan='2' align='center'><input type='submit' value='修改確認'></td>
                </tr>
            </table>
        </form>
      </div>
      </div>
    </div>
  </div>
<div id="bo"> ©Copyright 2018 <%=title%> 版權所有 </div>
</div>

</body>
</html>