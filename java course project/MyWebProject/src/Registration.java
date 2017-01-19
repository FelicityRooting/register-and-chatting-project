

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Registration extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		try{
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String username = request.getParameter("username");
			String bday = request.getParameter("bday");
			String bmonth = request.getParameter("bmonth");
			String byear = request.getParameter("byear");
			String gender = request.getParameter("gender");
			String password = request.getParameter("password");
		
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Daimos07s");
			System.out.println("connection");
			String query = "insert into user_data values('"+firstname+"','"+lastname+"','"+username+"','"+password+"','"+bday+"','"+bmonth+"','"+byear+"','"+gender+"');";

			Statement stmt = con.createStatement();
			stmt.execute(query);
			response.sendRedirect("http://localhost:8080/MyWebProject/AccountCreated.jsp");
		}catch(SQLException e) {
			System.out.println("SQL ERROR");
			response.sendRedirect("http://localhost:8080/MyWebProject/index.jsp?username=exist");
		}catch(Exception e) {
			System.out.println("You get some error");
			e.printStackTrace();
		}
		
	}
}
