import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReloadData extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		try {
			response.setContentType("text/html");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Daimos07s");

			String str11 = "select * from chatting_data";
			
			PreparedStatement pstmt = con.prepareStatement(str11);
			ResultSet rs11 = pstmt.executeQuery();
			while(rs11.next()) {
				String username = rs11.getString(1);
				String message = rs11.getString(2);
				String currentdate = rs11.getString(3);
				String currenttime = rs11.getString(4);
				PrintWriter out = response.getWriter();
				out.println("<p>"+username+": <g>"+message+"</g><br><small>"+currentdate+" <g>"+currenttime+"</small> </g></p>");
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print("wrong things");
		}
	}
}
