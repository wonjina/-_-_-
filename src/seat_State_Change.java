


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

import myfilter.Myseat;

/**
 * Servlet implementation class seat_State_Change
 */
@WebServlet("/seat_State_Change")
public class seat_State_Change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public seat_State_Change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String seatNum = (String)session.getAttribute("seatNum");
		String id = request.getParameter("id");
		Connection conn = null;
		Statement stmt = null;
		int seatS = 0;
		Myseat ms = new Myseat();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");

			if( conn == null)
				throw new Exception("db not connect.");
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user where id='"+id+"';");
			
			if( rs.next() ) //id가 유효한지
			{
				rs = stmt.executeQuery("select * from seat where id='"+id+"';");
				if(rs.next())
					seatS = rs.getInt("seatState");
				if( seatS == 0 )  //id가 사용중인 자리가 없으면
				{
					int rowNum = stmt.executeUpdate("update seat set id='"+id+"', seatState='1' where seatNum ='"+seatNum+"';");
					if(rowNum < 1)
						throw new Exception("no query.");
				}
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
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=seat/seating.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
