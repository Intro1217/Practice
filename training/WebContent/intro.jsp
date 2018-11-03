<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "database_ini.jsp"%>  
<%@page import="java.util.*" %>
<%		//DataSource dataSource = (DataSource)application.getAttribute("dataSource");
		//Connection conn = dataSource.getConnection();
		String tsql = "SELECT * FROM movie WHERE seq='"+request.getParameter("seq")+"'";
		PreparedStatement stmt = conn.prepareStatement(tsql);
       	ResultSet rs = stmt.executeQuery();
       	rs.next();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ABC影城</title>
<link href="css/css2.css" rel="stylesheet" type="text/css">
<link href="css/s2.css" rel="stylesheet" type="text/css">
<script src="scripts/jquery-1.9.1.min.js"></script>
<script src="scripts/js.js"></script>
</head>

<body>
<div id="main">
  <div id="top" class="ct" style=" background:#999 center; background-size:cover; " title="ABC影城">
    <h1 style="margin:0;padding:0;">ABC影城</h1>
  </div>
  <div id="top2"> <a href="index.jsp">首頁</a> <a href="order.jsp">線上訂票</a> <a href="member2.jsp">會員系統</a> <a href="admin.jsp">管理系統</a> </div>
  <div id="text"> <span class="ct">最新活動</span>
    <marquee direction="right">
    ${applicationScope.Dynamicmsg}
    </marquee>
  </div>
  <div id="mm">
    <div class="tab rb" style="width:87%;">
      <div style="background:#FFF; width:100%; color:#333; text-align:left">
        <video src="./movie/<%=rs.getString("trailer")%>" width="300px" height="250px" controls="" style="float:right;"></video>
        <font style="font-size:24px"> <img src="./poster/<%=rs.getString("poster")%>" width="200px" height="250px" style="margin:10px; float:left">
        <p style="margin:3px">影片名稱 ：<%=rs.getString("name")%>
          <input type="button" value="線上訂票" onclick="javascript:location.href='order.jsp?seq=<%=rs.getInt("seq")%>'" style="margin-left:50px; padding:2px 4px" class="b2_btu">
        </p>
        <p style="margin:3px">影片分級 ：<img src="./icon/<%=rs.getInt("level")%>.png" style="display:inline-block;"><?=$lstr[$row['level']-1];?> </p>
        <% String len = rs.getInt("length")/60 + "時"+ rs.getInt("length")%60 + "分"; %>
        <p style="margin:3px">影片片長 ： <%=len%></p>
        <p style="margin:3px">上映日期 <%=rs.getString("ondate")%></p>
        <p style="margin:3px">發行商 ： <%=rs.getString("publish")%></p>
        <p style="margin:3px">導演 ：<%=rs.getString("director")%></p>
        <br>
        <br>
        <p style="margin:10px 3px 3px 3px; word-break:break-all"> 劇情簡介：<%=rs.getString("intro")%><br>
        </p>
        </font>
        <table width="100%" border="0">
          <tbody>
            <tr>
              <td align="center"><input type="button" value="院線片清單" onclick="lof('index.jsp')"></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <div id="bo"> ©Copyright 2018 ABC影城 版權所有 </div>
</div>
</body>
</html>