<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("EUC-KR");
	String image = null;
	String name = null;
	String writer = null;
	String publisher = null;
	String location = null;
	String info = null;
	
	String realFolder = "";
	String saveFolder = "/image";
	String encType = "euc-kr";
	int maxSize = 500*1024;
	
	String type = "";
	
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	//realFolder = request.getRealPath(saveFolder);
	System.out.println(realFolder);
	try {
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
		
		name = multi.getParameter("NAME");
		writer = multi.getParameter("WRITER");
		publisher = multi.getParameter("PUBLISHER");
		location = multi.getParameter("LOCATION");
		info = multi.getParameter("INFO");
		if (name.length()<1 || writer.length()<1 || publisher.length()<1 || location.length()<1) {
			%>
			<script>
				alert("정보를 모두 입력해주세요.");
				history.go(-1);
			</script>
			<%
		}
		else {
			Enumeration files = multi.getFileNames();
	
			while(files.hasMoreElements()) {
				String param = (String)files.nextElement();
				image = multi.getFilesystemName(param);
				type = multi.getContentType(param);
			}
			if(type == null || type.contains("image")==false) {
				%>
				<script>
					alert("이미지 파일을 선택해주세요.");
					history.go(-1);
				</script>
				<%
			}
			else {
				String code;
				int b_code;
				Connection conn = null;
				Statement stmt = null;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","1234");
					if (conn == null)
						throw new Exception("데이터베이스에 연결할 수 없습니다.");
					stmt = conn.createStatement();
					
					ResultSet rs = stmt.executeQuery("select max(code) from bookinfo;");
					if (!rs.next())
			            throw new Exception("잘못된 접근");
					b_code = rs.getInt("max(code)")+1;
					code = Integer.toString(b_code);
					
					String command = String.format
							("insert into bookinfo (code, name, writer, publisher, location, info, image, rent) values('%s','%s','%s','%s','%s','%s','%s', true);"
							,code, name, writer, publisher, location, info, image);
					int rowNum = stmt.executeUpdate(command);
					if (rowNum < 1)
						throw new Exception("데이터를 DB에 입력할 수 없습니다.");
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
				%>
				<script>
					alert("도서가 추가되었습니다.");
					location.replace("ReadBooksInfo");
					
				</script>
				<%
			}
		}
	} catch(IOException ioe) {
		System.out.println(ioe);
		throw ioe;
	} catch (Exception ex) {
		System.out.println(ex);
		throw ex;
	}
%>