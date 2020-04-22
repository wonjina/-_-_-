

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class user_Check
 */
@WebServlet("/user_Check")
public class user_Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_Check() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession hs = request.getSession();
		String id = (String) hs.getAttribute("LOGIN_ID");
		Connection conn = null;
		Statement stmt = null;
		String seatNum = request.getParameter("1");
		int seatS=0;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");

			if( conn == null)
				throw new Exception("db not connect.");
			
			stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from seat where seatNum='"+seatNum+"';");
			
			if( rs.next()) 
				seatS = rs.getInt("seatState");
			if( seatS==0 ) //좌석이 사용중이지 않으면
			{
				if( id!=null && id.equals("admin"))	
				{
					hs.setAttribute("seatNum", seatNum);
					RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=seat/seating_Change_State.jsp");
					dispatcher.forward(request, response);
				}
				else 
				{
					RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=seat/seating.jsp");
					dispatcher.forward(request, response);
				}
			}
			else 
			{
				if( id!=null && id.equals("admin"))	
				{
					int rowNum = stmt.executeUpdate("update seat set id=null, seatState=0 where seatNum ='"+seatNum+"';");
					if(rowNum < 1)
						throw new Exception("no read.");
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=seat/seating.jsp");
				dispatcher.forward(request, response);
			}
			
		}
		catch(Exception e)
		{
			throw new ServletException(e);
		}
		finally
		{
			try {
				stmt.close();
				conn.close();
				
		//		RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=seating.jsp");
		//		dispatcher.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
	}

}
