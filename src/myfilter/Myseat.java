package myfilter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;

public class Myseat {
	private String seat_Num = null;	//
	private String id;		//id
	private int seat_State[] = new int[24];	//
	
	public Myseat(){}
	
	public void setSeat_Num(String num)
	{
		this.seat_Num = num;
	}
	public String getSeat_Num()
	{
		return toUnicode(seat_Num);
	}

	public void setId(String id)
	{
		this.id = id;
	}
	public String getId()
	{
		return toUnicode(id);
	}
	
	public int[] getSeat_State()
	{
		return seat_State;
	}
	public int getSeat_State(int index)
	{
		return seat_State[index];
	}
	
	public void readDB() throws ServletException
	{
		int i=0;
		Connection conn = null;
		Statement stmt = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "1234");
			
			if( conn == null)
				throw new Exception("db not connect.");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from seat;");
			while(rs.next())
			{
				seat_State[i++] = rs.getInt("seatState");
				String aa = rs.getString("id");
				if( aa!= null && aa.equals(id) )
					seat_Num = rs.getString("seatNum");
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
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	private String toUnicode(String str)
	{
		if(str == null)
			return null;
		try
		{
			byte[] b = str.getBytes("ISO-8859-1");
			return new String(b);
		}
		catch(java.io.UnsupportedEncodingException uee)
		{
			System.out.println(uee.getMessage());
			return null;
		}
	}
}
