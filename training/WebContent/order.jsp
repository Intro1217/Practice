<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "database_ini.jsp"%>  
<%@page import="java.util.*,com.abc.model.*" %>
<% 
	MessageDAO msg = (MessageDAO) application.getAttribute("message");
	String title = msg.getTitle();
	String marquee = msg.getMarquee();
	int ordmovie =0;
	if (request.getParameter("seq") != null) {
		ordmovie = Integer.parseInt(request.getParameter("seq"));
	}
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
<script>
function getDate(){
	  var selmovie=document.getElementById("selmovie").value;
	  var moviename=document.getElementById("selmovie").options[document.getElementById("selmovie").selectedIndex].text;
	  var ondate=document.getElementById("m"+selmovie).getAttribute("date");
	  
	  $.post("api.jsp?do=getDate",{selmovie:selmovie,ondate:ondate,moviename:moviename},function(back){
		    $("#seldate").html(back)
		    getSession();
		    });
  
}
function getSession(){
	  	var seldate=document.getElementById("seldate").value;
	  	$.post("api.jsp?do=getSession",{seldate:seldate},function(back){
	    $("#selsession").html(back)
	    });
}
getDate();
function goBooking(){
  var selsession=document.getElementById("selsession").value;
  $.post("api.jsp?do=goBooking",{selsession:selsession},function(){
    lof("booking.jsp");
  })
}
</script>
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
    <div class="tab rb" style="width:87%;">
    
<%
if ((session.getAttribute("login") == null) || ("".equals(session.getAttribute("login"))) ){
 %>
<H1 class="ct mc">尚未登入,請先登入<a href="member2.jsp">會員</a></H1>

<%
} else {
%>    
    <H1 class="ct mc">線上訂票</H1>
      <div style="width:100%; color:#333; text-align:left">
         <table width="50%" style="padding:20px;background:#EEE;margin:auto;">
          <tr>
            <td  style="border:1px solid #555;" class="ct" width="20%">電影：</td>
            <td  style="border:1px solid #555;">
              <select name="selmovie" id="selmovie" style="width:100%;" onchange="getDate()">
<%
	PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM movie WHERE up='1' && ondate >= DATE_SUB(current_date(),INTERVAL 2 DAY) && ondate <= current_date();");
	ResultSet rs2= stmt2.executeQuery();
	while (rs2.next()){
%>                 
		 <option value="<%=rs2.getInt(1) %>" date=<%=rs2.getString(5) %> id="m<%=rs2.getInt(1) %>" <%=(ordmovie==rs2.getInt("seq"))?"selected":""%>><%=rs2.getString("name") %></option>
<%	} rs2.close(); %>
     	        </select></td></tr>
          <tr >
            <td  style="border:1px solid #555;" class="ct" width="20%">日期：</td>
            <td  style="border:1px solid #555;">
              <select name="seldate" id="seldate"  style="width:100%;" onchange="getSession()"><option value="">
                </option>
              </select>
            </td>
          </tr>
          <tr >
            <td class="ct"  width="20%"  style="border:1px solid #555;">場次：</td>
            <td  style="border:1px solid #555;">
              <select name="selsesstion" id="selsession" style="width:100%;">
                <option value=""></option>
              </select>
            </td>
          </tr>
          <tr>
            <td colspan="2"  style="text-align:center;">
              <input type="button" name="sel" value="確定" onclick="goBooking()"/>
              <input type="reset" name="res" value="重置"/>
            </td>
          </tr>
         </table> 
      </div>
<%} %>
    </div>
  </div>
  <div id="bo"> ©Copyright 2018 <%=title%> 版權所有 </div>
</div>

</body>
</html>