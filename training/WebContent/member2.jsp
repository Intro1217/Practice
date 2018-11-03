<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,com.abc.model.*" %>
<% 
	MessageDAO msg = (MessageDAO) application.getAttribute("message");
	String title = msg.getTitle();
	String marquee = msg.getMarquee();
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
		<div id="top" class="ct"
			style="background: #999 center; background-size: cover;"
			title="<%=title%>">
			<h1 style="margin: 0; padding: 0;"><%=title%></h1>
		</div>
		<div id="top2">
			<a href="index.jsp">首頁</a> <a href="order.jsp">線上訂票</a> <a
				href="member2.jsp">會員系統</a> <a href="admin.jsp">管理系統</a>
		</div>
		<div id="text">
			<span class="ct">最新活動</span>
			<marquee direction="right"> <%=marquee%> </marquee>
		</div>
  <div id="mm">
    <div class="tab rb" style="width:87%;">
      <div style="width:100%; color:#333; text-align:left">
      <% if (session.getAttribute("login") == null) {%>
      <jsp:include page="login.jsp" />
      <%}else{%>
      <jsp:include page="user.jsp" />
      <%} %>
      </div>
    </div>
  </div>
<div id="bo"> ©Copyright 2018 <%=title%> 版權所有 </div>
</div>
</body>
</html>