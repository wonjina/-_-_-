
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReadMember")
public class ReadMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		String page = request.getParameter("PAGE");
		if (page == null)
			page = "0";
		int num = Integer.parseInt(page);
		MembersInfo membersInfo = readDB(page);
		
		request.setAttribute("MEMBERS_INFO", membersInfo);
		request.setAttribute("PAGE", num);
		RequestDispatcher dispatcher = request.getRequestDispatcher(
				"Main.jsp?BODY_PATH=MembersManage.jsp");
		dispatcher.forward(request, response);
	}
	private MembersInfo readDB(String page) throws ServletException {
		MembersInfo membersInfo = new MembersInfo();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs;
		int ct, mp;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
			if (conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) " +
					"from user;");
			rs.next();
			ct = rs.getInt("count(*)");
			mp = ct/5;
			if(ct%5==0)
				mp-=1;	
			membersInfo.setMaxPage(mp);			
			
			rs = stmt.executeQuery("select * " +
						"from user order by id asc;");
			int pos = (Integer.parseInt(page))*5;
			for (int i = 0; i<pos; i++) {
				rs.next();
			}
			for (int cnt = 0; cnt < 5; cnt++) {
				if (!rs.next())
					break;
				membersInfo.setId(cnt, rs.getString("id"));
				membersInfo.setName(cnt, rs.getString("name"));
				membersInfo.setPhone(cnt, rs.getString("phone"));
			}
			if (!rs.next())
				membersInfo.setLastPage(true);
		}
		catch (Exception e) {
			throw new ServletException(e);
		}
		finally {
			try {
				stmt.close();
			}
			catch (Exception ignored) {
			}
			try {
				conn.close();
			}
			catch (Exception ignored) {
			} 
		}
		return membersInfo;
	}

}
