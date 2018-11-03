<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.abc.model.*"%>
<%@ include file="database_ini.jsp"%>
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
<link href="css/s2.css" rel="stylesheet" type="text/css">
<link href="css/css2.css" rel="stylesheet" type="text/css">
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
		<%
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM poster", ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery();
		%>
		<div id="mm">
			<div class="half" style="vertical-align: top;">
				<h1 style="margin: 0; padding: 0;">預告片介紹</h1>
				<div class="rb tab" style="width: 95%;">
					<div id="abgne-block-20111227">
						<ul class="lists" style="width: 250px; margin: auto;">
							<%
								while (rs.next()) {
									out.println("<li class=\"poster\" id=\"p" + rs.getInt(1) + "\" ani=\"" + rs.getInt(5)
											+ "\" style=\"position:relative;width:250px;height:300px;\">");
									out.println("<img src=\"./poster/" + rs.getString(2) + "\" style=\"height:270px;\">");
									out.println("<div style=\"width:100%;text-align:center;height:30px;\">" + rs.getString(3) + "</div>");
								}
								rs.beforeFirst();
							%>
						</ul>
						<div style="position: relative; bottom: -20px;">
							<div class="la"
								style="position: absolute; top: -60px; left: 10px;"
								onclick="shiftIcon(1)"></div>
							<div class="controls">
								<ul style="width: 480px;">
									<%
										while (rs.next()) {
											out.println("<li class=\"icon\" id=\"i" + rs.getInt(1) + "\" onclick=\"showPoster(" + rs.getInt(1) + ","
													+ rs.getInt(5) + ")\" style=\"position:relative;\"><img src=\"./poster/" + rs.getString(2)
													+ "\" style=\"width:70px;box-sizing:border-box;margin:0 5px;\"></li>");
										}
										rs.close();
									%>
								</ul>
							</div>
							<div class="ra"
								style="position: absolute; top: -60px; right: 10px;"
								onclick="shiftIcon(2)"></div>
						</div>
					</div>
				</div>
				<script>
					var s = 0;
					function autoSlide() {
						var pid = $(".poster").eq(s).attr("id")
								.replace("p", "");
						var pani = parseInt($("#p" + pid).attr("ani"));
						showPoster(pid, pani);
						if (s < ($(".poster").size() - 1)) {
							s++;
						} else {
							s = 0;
						}
						tt = setTimeout(autoSlide, 3000);
					}

					function showPoster(seq, ani) {
						var ponow = $(".poster:visible").attr("id");
						$(".poster").hide();
						switch (ani) {
						case 1:
							$("#" + ponow).show();
							$("#" + ponow).fadeOut(1000, function() {
								$("#p" + seq).fadeIn(1000);
							})
							break;
						case 2:
							$("#" + ponow).show();
							$("#" + ponow).css({
								left : "0px",
								top : "0px"
							});
							$("#" + ponow).animate({
								left : "-250px",
								top : "0"
							}, function() {
								$("#" + ponow).hide();
								$("#" + ponow).css({
									left : "0px",
									top : "0px"
								});
								$("#p" + seq).css({
									left : "250px",
									top : "0px"
								});
								$("#p" + seq).show();
								$("#p" + seq).animate({
									left : "0px",
									top : "0px"
								});
							})

							break;
						case 3:
							$("#" + ponow).show();

							$("#" + ponow).animate({
								left : "125px",
								top : "150px",
								width : "0",
								height : "0"
							}, function() {
								$("#" + ponow).hide();
								$("#" + ponow).css({
									left : "0",
									top : "0",
									width : "250px",
									height : "300px"
								});
								$("#p" + seq).css({
									left : "125px",
									top : "150px",
									width : "0",
									height : "0"
								});
								$("#p" + seq).show();
								$("#p" + seq).animate({
									left : "0",
									top : "0",
									width : "250px",
									height : "300px"
								});
							})
							break;
						}
						;
					}

					var isize = $(".icon").size();
					var now = 0;
					function shiftIcon(x) {
						switch (x) {
						case 1:
							if ((now - 1) >= 0) {
								now--;
								$(".icon").animate({
									right : now * 80
								});
							}
							break;
						case 2:
							if ((now + 1) <= (isize - 4)) {
								now++;
								$(".icon").animate({
									right : now * 80
								});
							}
							break;
						}
					}
					$(".poster").hide();
					$(".poster").first().show();
					autoSlide();
					$(".controls")
							.hover(function() {
								clearTimeout(tt);
							}, function() {
								tt = setTimeout(autoSlide, 3000);
							})
				</script>
			</div>
			<div class="half">
				<h1 style="margin: 0; padding: 0;">院線片清單</h1>
				<div class="rb tab" style="width: 95%; overflow: hidden;">
					<%
						PreparedStatement stmt2 = conn.prepareStatement(
								"SELECT count(*) FROM movie WHERE up='1' && ondate >= DATE_SUB(current_date(),INTERVAL 2 DAY) && ondate <= current_date();");
						ResultSet rs2 = stmt2.executeQuery();
						rs2.next();
						int count = rs2.getInt(1);
						int all = (int) Math.ceil(((float) count / 4)), now = 1;
						if (request.getParameter("page") != null) {
							now = Integer.parseInt(request.getParameter("page"));
						}
						int start = (now - 1) * 4;
						String sql = String.format(
								"SELECT * FROM movie WHERE up='1' && ondate >= DATE_SUB(current_date(),INTERVAL 2 DAY) && ondate <= current_date() ORDER BY rank,seq LIMIT "
										+ start + ",4;");
						rs2.close();
						stmt2 = conn.prepareStatement(sql);
						rs2 = stmt2.executeQuery();
						while (rs2.next()) {
					%>
					<table width="48%" height="50%"
						style="float: left; border: 1px solid #eee; border-radius: 5px; margin: 2px;">
						<tr>
							<td rowspan="3" width="30%"><img
								src="./poster/<%=rs2.getString(9)%>" style="width: 100%;"></td>
							<td><%=rs2.getString(2)%></td>
						</tr>
						<tr>
							<td>分級：<img src="./icon/<%=rs2.getInt(3)%>.png"
								style="width: 25px;"></td>
						</tr>
						<tr>
							<td style="font-size: 11px;">上映日期：<%=rs2.getString(5)%></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" name="intro"
								value="劇情簡介"
								onclick="javascript:location.href='intro.jsp?seq=<%=rs2.getInt(1)%>'" />
								<input type="button" name="order" value="線上訂票"
								onclick="javascript:location.href='order.jsp?seq=<%=rs2.getInt(1)%>'" />
							</td>
						</tr>
					</table>
					<%
						}
						rs2.close();
					%>
					<div class="ct" style="clear: both;">
						<%
							for (int i = 1; i <= all; i++) {
								out.print("<a href=\"index.jsp?page=" + i + "\">" + i + "</a>");
							}
						%>
					</div>
				</div>
			</div>
		</div>
		<div id="bo">©Copyright 2018 <%=title%> 版權所有</div>
	</div>
</body>
</html>