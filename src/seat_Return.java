

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class seat_Return
 */
@WebServlet("/seat_Return")
public class seat_Return extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public seat_Return() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String seat_Num = (String) session.getAttribute("seat_Num");
		Connection conn = null;
		Statement stmt = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");
			
			if( conn == null)
				throw new Exception("db not connect.");
			stmt = conn.createStatement();
		
			int rowNum = stmt.executeUpdate("update seat set id=null, seatState=0 where seatNum ='"+seat_Num+"';");
			if(rowNum < 1)
				throw new Exception("no read.");
			
			
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
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=seat/seating.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
