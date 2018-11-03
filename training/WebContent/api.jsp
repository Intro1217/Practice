<%@ include file="database_ini.jsp"%>
<%@ page import="java.util.*,java.text.DateFormat,java.text.SimpleDateFormat,com.abc.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%			
request.setCharacterEncoding("utf-8");
%>
<%
	if (request.getParameter("do") != null) {
		switch (request.getParameter("do")) {
		case "getDate":
			session.setAttribute("selmovie", request.getParameter("selmovie"));
			session.setAttribute("moviename", request.getParameter("moviename"));
			Calendar c = Calendar.getInstance();
			java.util.Date today = new java.util.Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String tstr = format.format(c.getTime());
			String ondate = request.getParameter("ondate");
			c.setTime(format.parse(ondate));
			for (int i = 1; i <= 3; i++) {
				if ((ondate.compareTo(tstr) >= 0)) {
					out.print("<option value=" + ondate + ">" + (c.getTime().getMonth() + 1) + "月"
							+ c.getTime().getDate() + "日" + "</option>");
				}
				c.add(Calendar.DATE, +1);
				ondate = format.format(c.getTime());
			}
			break;
		case "getSession":
			//System.out.print("getSession");
			String[] sess = { "14:00~16:00", "16:00~18:00", "18:00~20:00", "20:00~22:00", "22:00~24:00" };
			String seldate = request.getParameter("seldate");
			session.setAttribute("seldate", seldate);
			format = new SimpleDateFormat("yyyy-MM-dd");
			session.setAttribute("selmovie", format.parse(seldate));
			java.util.Date date = new java.util.Date();
			int time = 24 - date.getHours();
			if (date.before(format.parse(seldate))) {
				for (int i = 0; i < 5; i++) {
					String tsql = "SELECT sum(qt) as 'sum' FROM ord WHERE movie='"
							+ session.getAttribute("moviename") + "' && odate='"
							+ session.getAttribute("seldate") + "' && osess='" + i + "';";
					PreparedStatement stmt2 = conn.prepareStatement(tsql);
					ResultSet rs2= stmt2.executeQuery();
					rs2.next();					
					out.print("<option id=\"se\"" + i + " value=\"" + i + "\">" + sess[i] + " 剩餘座位 "+(20-rs2.getInt(1))+ "</option>");
				}
			} else {
				int i = 6 - (int)Math.ceil((double)time/2);
				if (i <= 0) i=0;
				for (int j=i; j < 5; j++) {
					String tsql = "SELECT sum(qt) as 'sum' FROM ord WHERE movie='"
							+ session.getAttribute("moviename") + "' && odate='"
							+ session.getAttribute("seldate") + "' && osess='" + j + "';";
					PreparedStatement stmt2 = conn.prepareStatement(tsql);
					ResultSet rs2= stmt2.executeQuery();
					rs2.next();					
					out.print("<option id=\"se\"" + j + " value=\"" + j + "\">" + sess[j] + " 剩餘座位 "+(20-rs2.getInt(1))+ "</option>");
				}

			}
			break;
	    case "goBooking":
	    	String selsession = request.getParameter("selsession");
			//System.out.print("goBooking :"+request.getParameter("selsession"));
			session.setAttribute("selsession", selsession);
	      break;
	    case "orderIt":			
			String tseats = request.getParameter("seats");
 			String[] tokens = tseats.split(",");
			int s =0;
	    	int[] seats = new int[tokens.length];
			for (String token:tokens) {
				   seats[s]= Integer.parseInt(token);
				   s++;
				 }
	    	Arrays.sort(seats);
	    	PreparedStatement stmt = conn.prepareStatement("SELECT max(seq) FROM ord;");
	    	ResultSet rs= stmt.executeQuery();
	    	rs.next();
	    	String orderno =  (String) session.getAttribute("seldate");
	    	orderno = orderno.replace("-", "") + String.format("%04d", (rs.getInt(1)+1)); // 需加上日期
	    	session.setAttribute("seats", tseats);
			String tsql = "INSERT INTO ord VALUES (NULL,"+ "'"+orderno+"'"+",'"
					+ session.getAttribute("moviename")+"','" + session.getAttribute("seldate")+"','"
					+ session.getAttribute("selsession")+"','" + seats.length+"','"+tseats+"','"
					+ session.getAttribute("login")+"')";
			//System.out.print(tsql);
			int a = stmt.executeUpdate(tsql);
%>
	        <table style="width:50%;margin:20px auto;padding:20px;background:#ccc;" class='c'>
	          <tr><td style="background:#aaa;" colspan="2">感謝你的訂購，你的訂單編號是：<%=orderno%></td></tr>
	          <tr><td style="background:#777;">電影名稱：</td><td><%=session.getAttribute("moviename")%></td></tr>
	          <tr><td style="background:#aaa;">日期：</td><td><%=session.getAttribute("seldate")%></td></tr>
	          <tr><td style="background:#777;">場次時間：</td><td><%=session.getAttribute("selsession")%></td></tr>
	          <tr><td colspan="2">座位：<br>	            
<%
	            for(int i=0; i < seats.length ; i++){
	              out.print((int)Math.ceil(((float)seats[i]+1)/5)+"排"+((seats[i]%5)+1)+"號<br>");
	            }
	            out.print("共"+seats.length+"張電影票");	            
%>
	            </td></tr>
	          <tr><td colspan="2"class="ct" style="background:#ccc;"><input type="button" value="確認" onclick="lof('index.jsp');"/></td></tr>
	        </table>
<%
	      break;
		case "del":
			//System.out.print("del");
		    int seq =Integer.parseInt(request.getParameter("seq"));
		    String table =request.getParameter("table");
			tsql = "DELETE FROM "+ table +" WHERE seq='"+ seq+ "';";
			//System.out.print(tsql);
			PreparedStatement stmt2 = conn.prepareStatement(tsql);
			a = stmt2.executeUpdate(); 
		break;		
		case "title":
			MessageDAO msg = (MessageDAO) application.getAttribute("message");
			msg.setTitle(request.getParameter("text"));
			//application.setAttribute("message", msg);
			response.sendRedirect("admin.jsp?do=title");
		break;		
		case "marquee":
			msg = (MessageDAO) application.getAttribute("message");
			msg.setMarquee(request.getParameter("text"));
			//application.setAttribute("message", msg);
			response.sendRedirect("admin.jsp?do=marquee");
		break;		
		}
	}
%>

