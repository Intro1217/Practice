<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "database_ini.jsp"%>  
<%@page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String[] sess = { "14:00~16:00", "16:00~18:00", "18:00~20:00", "20:00~22:00", "22:00~24:00" };
	PreparedStatement stmt2;
	ResultSet rs2;
  	String date,movie,tsql;
	if(request.getParameter("qdel") != null){
	  	switch(request.getParameter("type")){
	    case "1":
	      	date=request.getParameter("date");
	      	tsql = "DELETE FROM ord WHERE odate='"+date+"';";
	 	 	stmt2 = conn.prepareStatement(tsql);
	 	 	int a = stmt2.executeUpdate(); 
	    break;
	    case "2":
	      movie=request.getParameter("movie");
	      System.out.print(movie);
	      tsql = "DELETE FROM ord WHERE movie='"+movie+"';";
		 	stmt2 = conn.prepareStatement(tsql);
	 	 	a = stmt2.executeUpdate(); 
	    break;
	  	}
		response.sendRedirect("admin.jsp?do=order");
	}
%>

<style>
.fb{
  color:black;
}
</style>
<div style="width:80%;height:440px;margin:auto;padding:10px;background:#DDD;border:3px solid #AAA;">
<H3 style="width:98%;margin:0 auto;padding:5px;text-align:center;background:#999;display:inline-block;">訂單清單</H3>
<form action="ad-order.jsp" method="post">
<div class="fb">
快速刪除：
<span>
<input type="radio" name="type" value="1"/>依日期
<input type="text" name="date" value=""/>
</span>
<span>
<input type="radio" name="type" value="2" checked />依電影
<select name="movie">

<%
	tsql="SELECT movie FROM ord GROUP BY movie;";
	stmt2 = conn.prepareStatement(tsql);
	rs2= stmt2.executeQuery();
	while(rs2.next()){
		out.print("<option value='"+rs2.getString("movie")+"'>"+rs2.getString("movie")+"</option>");
	}
%>
</select>
</span>
<input type="submit" name="qdel" value="刪除"/>
</div>
</form>

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
tsql="SELECT * FROM ord;";
stmt2 = conn.prepareStatement(tsql);
rs2= stmt2.executeQuery();
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
      <input type="button" name="del<%=rs2.getInt("seq")%>" value="刪除" onclick="del('ord',<%=rs2.getInt("seq")%>)"/>
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