<%@page pageEncoding="UTF-8" %>
             <div style="width:350px;margin:20px auto;padding:20px;">
             
<%  if (request.getParameter("res")!=null){
  	  out.print("<H1 class=\"ct whi\" style=\"color:white\">註冊成功</H1>");
    }
else {%>      
                <a style="color:#6ba5ff" href='register.jsp'>還不是會員？</a><p>
<% }%>
                <div style='color: rgb(255, 0, 0);'>${ requestScope.error }</div>
                <form method='post' action='login.do'>
                    <table bgcolor='#cccccc'>
                         <tr>
                            <td colspan='2'>會員登入</td>
                        </tr>
                        <tr>
                            <td>名稱：</td>
                            <td><input type='text' name='username' value="${ param.username }"></td>
                        </tr>
                        <tr>
                            <td>密碼：</td>
                            <td><input type='password' name='password'></td>
                        </tr>
                        <tr>
                            <td colspan='2' align='center'><input type='submit' value='登入'></td>
                        </tr>
                        <tr>
                            <td colspan='2'><a href='forgot.jsp'>忘記密碼？</a></td>
                        </tr>
                    </table>
                </form>
             </div>

            