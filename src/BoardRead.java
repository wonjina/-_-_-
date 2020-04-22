

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

/**
 * Servlet implementation class BoardRead
 */
@WebServlet("/BoardRead")
public class BoardRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		
		String page = request.getParameter("PAGE");
		
		if(page == null)
			page ="0";

		String search = request.getParameter("SEARCH");
		String word = request.getParameter("WORD");
		
		int num = Integer.parseInt(page);
		Board list = readDB(page, search, word);
		
		request.setAttribute("BOARD_LIST", list);
		request.setAttribute("WORD", word);
		request.setAttribute("SEARCH", search);
		request.setAttribute("PAGE", num);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=BoardView.jsp");
		dispatcher.forward(request, response);
	}
	private Board readDB(String page, String search, String word) throws ServletException	{
		//데이터베이스로부터 게시글을 읽음
		Board list = new Board();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs;
		int ct, mp;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
			
			if(conn == null)
				throw new Exception("데이터베이스에 연결할 수 없음");
			stmt = conn.createStatement();
			if(word == null || word.length()<1)	{
				rs = stmt.executeQuery("select count(*) " +
						"from board;");
				rs.next();
				ct = rs.getInt("count(*)");
				mp = ct/5;
				if(ct%5==0)
					mp-=1;	
				list.setMaxPage(mp);
				rs = stmt.executeQuery("select * from board order by num desc;");
			}
			else	{
				rs = stmt.executeQuery("select count(*) " +
						"from board where "+search+" LIKE '%"+word+"%';");
				rs.next();
				ct = rs.getInt("count(*)");
				mp = ct/5;
				if(ct%5==0)
					mp-=1;				
				list.setMaxPage(mp);
				rs = stmt.executeQuery("select *" +
						"from board where "+search+" LIKE '%"+word+"%' order by num desc;");
			}
			int pos = (Integer.parseInt(page))*5;
			for (int i = 0; i<pos; i++) {
				rs.next();
			}
			for(int cnt = 0; cnt<5; cnt++)	{
				if(!rs.next())
					break;
				list.setNum(cnt, rs.getInt("num"));
				list.setName(cnt, rs.getString("name"));
				list.setContent(cnt, rs.getString("content"));
				list.setOpen(cnt, rs.getString("open"));
				list.setWriter(cnt, rs.getString("writer"));
				list.setAnswer(cnt, rs.getString("answer"));
				list.setDate(cnt, rs.getString("wdate"));
			}
			if(!rs.next())
				list.setLastPage(true);
		}
		catch (Exception e)	{
			throw new ServletException(e);
		}
		finally	{
			try	{
				stmt.close();
			}
			catch(Exception ignored)	{	
			}
			try	{
				conn.close();
			}
			catch(Exception ignored)	{
				
			}
		}
		return list;
	}

}