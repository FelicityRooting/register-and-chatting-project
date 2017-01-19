import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		//PrintWriter out = response.getWriter();
		
		try {
			response.setContentType("text/html");
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Daimos07s");
			String query = "Select * from user_data where username='"+username+"'and password='"+password+"';";
			Statement stmt = con.createStatement();
			
			System.out.println(username);
			System.out.println(password);
			
			
			ResultSet rs=stmt.executeQuery(query);
			
			if (rs.next()) {
				String firstname =rs.getString("firstname");
				String bday = rs.getString("Birth_day");
				String bmonth = rs.getString("Birth_month");
				String byear = rs.getString("Birth_year");
				String gender = rs.getString("Gender");
				
				HttpSession hs = request.getSession();
				hs.setAttribute("firstname", firstname);
				hs.setAttribute("username", username);
				hs.setAttribute("bday", bday);
				hs.setAttribute("bmonth", bmonth);
				hs.setAttribute("byear", byear);
				hs.setAttribute("gender", gender);
				
				System.out.println("connection");
				response.sendRedirect("http://localhost:8080/MyWebProject/UserHome.jsp");
			}else{
				response.sendRedirect("http://localhost:8080/MyWebProject/index.jsp?result=Failure");
			}
			
		}catch(Exception e) {
			System.out.println("We have Got error");
			e.printStackTrace();
			response.sendRedirect("SessionExpire.jsp");
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}
}
