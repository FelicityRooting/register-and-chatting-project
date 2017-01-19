import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ChatStore extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		try {
			response.setContentType("text/html");
			String username = request.getParameter("username");
			String message = request.getParameter("message");
			System.out.println("currenttime2");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Daimos07s");
			Statement stmt = con.createStatement();
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm:ss");
			Date date = new Date();
			
			String currentData = sdf.format(date);
			String currentTime = sdf1.format(date);
			
			String str = "insert into chatting_data values('"+username+"','"+message+"','"+currentData+"','"+currentTime+"',12);";
			//String str = "insert into chatting_data values('aa','bb','"+currentData+"','"+currentTime+"',12);";
			stmt.execute(str);
			System.out.println("currenttime1");	
			ResultSet rs = stmt.executeQuery(str);
			rs.next();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("invalid user");
		}
		
	}
	
	//public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	//	doGet(request, response);
	//}
	
}
