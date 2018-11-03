package com.mucfc.servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mucfc.dao.proxy.UserDAOProxy;
import com.mucfc.vo.User;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	List<String> info=new ArrayList<String>();
	if(name==null||"".equals(name)){ //帳號輸入格式問題
		info.add("帳號格式錯誤");
		System.out.println("帳號格式錯誤");
	}
 
	if(password==null||"".equals(password)){//密碼輸入格式問題
		info.add("密碼格式錯誤");
		System.out.println("密碼格式錯誤");
	}
	if(info.size()==0){
		User user=new User();
		user.setName(name);
		user.setPassword(password);
		UserDAOProxy userDAOProxy=new UserDAOProxy();
		try {
			
			if(userDAOProxy.findLogin(user)){
				info.add("登入成功，歡迎"+user.getName()+"！");				
			}else {
				info.add("登入失敗，錯誤的帳號和密碼");
			}						
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	request.setAttribute("info", info);//保存錯誤訊息
	request.getRequestDispatcher("Login.jsp").forward(request,response);
	
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
	}
 
}