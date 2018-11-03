<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "database_ini.jsp"%>  
<%@ page import="java.util.*" %>
<%
	String tsql="SELECT * FROM ord WHERE movie='"+session.getAttribute("moviename")+"' && odate='"+session.getAttribute("seldate")+"' && osess='"+session.getAttribute("selsession")+"'";
	PreparedStatement stmt = conn.prepareStatement(tsql);
	ResultSet rs= stmt.executeQuery();
	int[] seats = new int[20];
	while (rs.next()) {
		int qty = rs.getInt("qt");
		String[] tokens = rs.getString("seats").split(",");
		int s =0;
		for (String token:tokens) {
			   s= Integer.parseInt(token);
			   //System.out.print(s);
			   seats[s] = 1;
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ABC影城</title>
<link href="css/css2.css" rel="stylesheet" type="text/css">
<link href="css/s2.css" rel="stylesheet" type="text/css">
<script src="scripts/jquery-1.9.1.min.js"></script>
<script src="scripts/js.js"></script>

<style>
.ss{
  position:relative;
  width:64px;
  height:86px;
  /*background:rgba(0,0,0,0.2);*/
  float:left;
  text-align:center;
  font-weight:500;
  font-size:14px;

}
.a{
  background:url("./icon/03D02.png") no-repeat center;
}
.b{
  background:url("./icon/03D03.png") no-repeat center;
}
.seat{
  display:block;
  position:absolute;
  right:5px;
  bottom:5px;
}
</style>
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
 
      <div style="width:100%; color:#333; text-align:left">
      <div style="width:540px;height:370px;background:url('./icon/03D04.png') no-repeat;margin:auto;padding-top:17px;box-sizing:border-box;">
        <div style="width:320px;height:344px;margin:auto;box-sizing:border-box;">
        <%
          for(int i=0;i<20;i++){
            if(seats[i]==0){
              out.print("<div class='ss a' id='"+i+"'><span style='paddint-top:5px;'>"+(int)Math.ceil(((float)i+1)/5)+"排-"+(i%5+1)+"號"+"</span>");
              out.print("<input type='checkbox' name='seat[]' class='seat' value='"+i+"' onchange='selSeat(this)'/></div>");              
            }else{
             out.print("<div class='ss b' id='"+i+"'><span style='paddint-top:5px;'>"+(int)Math.ceil(((float)i+1)/5)+"排-"+((i%5)+1)+"號"+"</span></div>");              
            }
          }
          String[] sess = { "14:00~16:00", "16:00~18:00", "18:00~20:00", "20:00~22:00", "22:00~24:00" };
          String index = (String)session.getAttribute("selsession");
        %>
        </div>
      </div>
      <div style="width:540px;height:120px;background:#AAA;margin:auto;padding-left:100px;box-sizing:border-box;">
      你選擇的電影是：<%=session.getAttribute("moviename")%><br>
      你選擇的時刻是：<%=session.getAttribute("seldate")%> <%=sess[Integer.parseInt(index)]%><br>
      你己經勾選<span id="ticket"></span>張票最多可以購買四張票<br>
      <p class="ct"><input type="button" value="訂購" onclick="orderIt()"/></p>
      </div>
      </div>
    </div>
  </div>
  <div id="bo"> ©Copyright 2018 ABC影城 版權所有 </div>
</div>
<script>
var count=0;
var seats=new Array();
function selSeat(x){
  switch($(x).prop("checked")){
    case true:
      count++;
      if(count>4){
        alert("最多只能選四張票哦");
        $(x).prop("checked",false);
        count--;
      }else{
        seats.push($(x).val());
        $("#ticket").html(count);
      }
    break;
    case false:
      count--;
      seats.splice(seats.indexOf($(x).val()),1);
      $("#ticket").html(count);
    break;
  }
}

function orderIt(){
  var test=seats.toString();
  $.post("api.jsp?do=orderIt",{seats:test},function(back){
    $("#mm").html(back);
  })
}

</script>
</body>
</html>