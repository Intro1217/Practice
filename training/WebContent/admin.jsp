<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "database_ini.jsp"%>  
<%@page import="java.util.*,com.abc.model.*" %>
<% 
	MessageDAO msg = (MessageDAO) application.getAttribute("message");
	String title = msg.getTitle();
	String marquee = msg.getMarquee();
%>
<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
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
    <marquee direction="right"><%=marquee%></marquee>
  </div>
  <div id="mm">
  <% String admin = request.getParameter("acc");
  	 String pass = request.getParameter("pw");
  	 String logon;
  	 if("admin".equals("admin") && "1234".equals(pass))
  		 session.setAttribute("adminlogon", "ok");
  	 
  	 if (session.getAttribute("adminlogon")== null){
  	 
  %>
  	  <div style="width:300px;margin:20px auto;padding:20px;">
	  <form action="admin.jsp" method="post">
	    <p>帳號：<input type="text" name="acc" value=""></p>
	    <p>密碼：<input type="password" name="pw" value=""></p>
	    <p class="ct">
	      <input type="submit" name="send" value="送出">
	      <input type="reset" name="res" value="清除">
	    </p>
	  </div>
	  </form>
<% } else {%>
      <div class="ct a rb" style="position:relative; width:101.5%; left:-1%; padding:3px; top:-9px;">
      <a href="?do=title">網站標題管理</a>| 
      <a href="?do=marquee">動態文字管理</a>| 
      <a href="?do=poster">預告片海報管理</a>| 
      <a href="?do=movie">院線片管理</a>| 
      <a href="?do=order">電影訂票管理</a>| 
      <a href="?do=alogout">管理登出</a> 
    </div>
    
    <div class="rb tab" id="content">
    <%
      String ndo="";
      if(request.getParameter("do")!=null){
    	  ndo=request.getParameter("do");
      }
      switch(ndo){
        case "poster": %>
	    <jsp:include page="ad-poster.jsp" />
    	<% 
    	break;
        case "movie": %>
        <jsp:include page="ad-movie.jsp" />
        <%
        break;
        case "order": %>
	    <jsp:include page="ad-order.jsp" />
    	<% 
        break;
        case "title": %>
	    <jsp:include page="ad-title.jsp" />
    	<% 
        break;
        case "marquee": %>
	    <jsp:include page="ad-marquee.jsp" />
    	<% 
        break;
        case "alogout": 
       	session.setAttribute("adminlogon",null);
    	response.sendRedirect("admin.jsp"); 
        break;
        default:
          out.print("<h2 class='ct'>請選擇所需功能</h2>");
        break;
      }    
    %>
      
    </div>
<%} %>
  </div>
<div id="bo"> ©Copyright 2018 <%=title%> 版權所有 </div>
</div>
</body>
</html>