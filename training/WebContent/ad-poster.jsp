<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file = "database_ini.jsp"%>  

<%   String name1="";
    if(request.getParameter("editPoster") != null){  
    	name1 = request.getParameter("show");
} 
%>
<h1> <%=name1 %></h1>

<div style="text-align:center;width:80%;height:280px;margin:auto;padding:10px;background:#DDD;border:3px solid #AAA;">
<H3 style="width:98%;margin:0 auto;padding:5px;text-align:center;background:#999;display:inline-block;">預告片清單</H3>
<table style="width:100%;margin:0px auto;color:black;">
  <tr class="ct" style="background:#BBB;">
    <td width="20%">預告片海報</td>
    <td width="30%">預告片片名</td>
    <td width="15%">預告片排序</td>
    <td width="35%">操作</td>
  </tr>
</table>
<div style="overflow:auto;height:180px;margn:auto;">
<form action="ad-poster.jsp" method="post">
 <%		//DataSource dataSource = (DataSource)application.getAttribute("dataSource");
 		//Connection conn = dataSource.getConnection();
 		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM poster ORDER BY rank,seq");
 		SQLException ex = null;
        ResultSet rs = stmt.executeQuery();
        while(rs.next()) { 
		String file = rs.getString(2);
		String name = rs.getString(3);
		int seq = rs.getInt(1);
		int rank = rs.getInt(4);
%>
<table style="width:99%;margin:3px 0px auto;color:black;background:#EEE;" id="row<%=rank %>" rank="<%=rank %>">
  <tr class="ct">
    <td width="21%"><img src="./poster/<%=file %>" style="height:80px;"/></td>
    <td width="31%"><input type="text" name="text[]" value="<%=name %>"/></td>
    <td width="18%">
      <input type="button" name="up<%=seq %>" value="往上" onclick="rank('poster',1,<%=seq %>,<%=rank %>)"/><br>
      <input type="button" name="dn<%=seq %>" value="往下" onclick="rank('poster',2,<%=seq %>,<%=rank %>)"/>
    </td>
    <td width="30%">
      <input type="hidden" name="seq[]">
      <input type="checkbox" name="show" >顯示
      <input type="checkbox" name="del" >刪除
      <select name="ani[]">
        <option value="1" >淡入淡出</option>
        <option value="2" >滑入滑出</option>
        <option value="3" >縮放大小</option>
      </select>
    </td>
  </tr>
</table>
<%  } 
%>

</div>
<p class="ct">
    <input type="submit" name="editPoster" value="編輯確定"/>
    <input type="reset" name="res" value="重置"/>
</p>
</div>
</form>
<script>
  function rank(table,type,seq,rank){
      $.post("api.jsp?do=rank",{table:table,seq:seq,rank:rank,type:type},function(back){
        console.log(back);
       location.href="admin.jsp?do=poster";
      });

  }
</script>
<hr>
<div style="width:80%;margin:10px auto 0 auto;padding:10px;background:#DDD;border:3px solid #AAA;">
  <H3 style="width:98%;margin:0 auto;padding:5px;text-align:center;background:#999;display:inline-block;">新增預告片海報</H3>
  <form action="upload.do" name="upload" method="post" enctype="multipart/form-data">
  <table style="width:98%;margin:5px auto;color:black;background:#BBB;padding:5px;">
    <tr>
      <td width="15%">預告片海報：</td>
      <td width="35%">
        <input type="file" name="file" value=""/><br>
        <span style="color:red;">檔案請使用英文檔名</span>
      </td>
      <td width="15%" class="rt">預告片片名：</td>
      <td width="35%">
        <input type="text" name="text" value=""/>
      </td>
    </tr>
    <tr>
      <td class="ct" colspan="4">
        <input type="submit" name="send" value="新增"/>
        <input type="reset" name="res" value="重置"/>
      </td>
    </tr>    
  </table>
  </form>
</div>