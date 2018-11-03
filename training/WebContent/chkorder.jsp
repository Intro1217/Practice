<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "database_ini.jsp"%>  
<%@ page import="java.util.*,com.abc.model.*" %>
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
<style>
.fb{
  color:black;
}
</style>
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
<div style="width:80%;height:440px;margin:auto;padding:10px;background:#DDD;border:3px solid #AAA;">
<H3 style="width:98%;margin:0 auto;padding:5px;text-align:center;background:#999;display:inline-block;">訂票查詢</H3>
<table  style="width:99%;margin:3px 0px auto;color:black;">
  <tr style="background:#ccc;" class="ct">
    <td width="19%">訂單編號</td>
    <td width="15%">電影名稱</td>
    <td width="17%">日期</td>
    <td width="17%">場次時間</td>
    <td width="10%">訂購數量</td>
    <td width="10%">訂購位置</td>
    <td width="12%">操作</td>
  </tr>
</table>
<div style="height:340px;overflow:auto;width:99%;">
<%
	String[] sess = { "14:00~16:00", "16:00~18:00", "18:00~20:00", "20:00~22:00", "22:00~24:00" };
	String tsql="SELECT * FROM ord where cus_name = '"+session.getAttribute("login") +"' ;";
	//System.out.print(tsql);
	PreparedStatement stmt2 = conn.prepareStatement(tsql);
	ResultSet rs2= stmt2.executeQuery();
	while(rs2.next()){
%>
<table  style="width:100%;margin:3px 0px auto;color:black;background:#EEE;" id="row<%=rs2.getInt("seq")%>">
  <tr  class="ct">
    <td width="18%"><%=rs2.getString("no") %></td>
    <td width="18%"><%=rs2.getString("movie") %></td>
    <td width="17%"><%=rs2.getString("odate") %></td>
    <td width="17%"><%=sess[rs2.getInt("osess")] %></td>
    <td width="10%"><%=rs2.getInt("qt") %></td>
    <td width="10%">
<%
	String tseats = rs2.getString("seats");
	//System.out.print(tseats);
		String[] tokens = tseats.split(",");
	int s =0;
	int[] seats = new int[tokens.length];
	for (String token:tokens) {
		   seats[s]= Integer.parseInt(token);
		   s++;
		 }
	Arrays.sort(seats);
     for(int i=0; i < seats.length; i++){
      out.print(((int)Math.ceil(((float)seats[i]+1)/5))+"排"+((seats[i]%5)+1)+"號<br>");
	 }
%>
    </td>
    <td width="10%">
      <input type="button" name="del<%=rs2.getInt("seq")%>" value="刪除" onclick="del('ord',<%=rs2.getInt("seq")%>)";/>
    </td>
  </tr>
</table>
<%
}
%>
</div>
</div>
<script>
  function del(table,seq){
    $.post("api.jsp?do=del",{table:table,seq:seq},function(){
      $("#row"+seq).remove();
    });
  }
</script>
</div>
<div id="bo"> ©Copyright 2018 <%=title%> 版權所有 </div>
</div>
</body>
</html>