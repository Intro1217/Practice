<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%			
request.setCharacterEncoding("utf-8");
out.print(request.getParameter("text"));
%>
 		
         <form action = "NewFile.jsp" method = "post">  
             <p>Username : <input type = "text" name = "stu_name" size = "10"></p>  
             <p>Password : <input type = "password" name = "stu_passwd" size = "10"></p>  
             <p>Email : <input type = "text" name = "stu_email" size = "10"></p>  
             <input type = "submit" name = "insert" value = "Insert">  
         </form>  
         <a href="index.jsp">回首頁</a>  
</body>
</html>