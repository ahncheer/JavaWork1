<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%> <%-- JDBC 관련 import --%>    
<%@ page import = "java.text.SimpleDateFormat" %>
<%!
	// JDBC 관련 기본 객체변수
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery() 
	int cnt = 0;   // DML 결과, executeUpdate()
	
	// Connection 에 필요한 값 세팅
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";  // JDBC 드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  // DB 접속 URL
	final String USERID = "scott0316";  // DB 접속 계정 정보
	final String USERPW = "tiger0316";
%>

<%!
	// 쿼리문 준비
	final String SQL_WRITE_SELECT = 
		"SELECT * FROM attraction ORDER BY attr_id DESC"; 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>

<%
	try{
		Class.forName(DRIVER);
		out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공" + "<br>");
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT);
		
		rs = pstmt.executeQuery();
		out.println("쿼리 성공<br>");
%>		

		<hr>
		<h2>리스트</h2>
		<table>
			<tr>
				<th>attr_id</th>
				<th>attr_max</th>
				<th>attr_time</th>
				<th>attr_price</th>
				<th>attr_content</th>
				<th>attr_name</th>
				<th>attr_location</th>
				<th>attr_min_age</th>
				<th>attr_max_age</th>
				<th>attr_min_height</th>
				<th>attr_max_height</th>
				<th>attr_authorize</th>
				<th>attr_regDate</th>
				<th>attr_img</th>
				<th>attr_cardimg</th>
			</tr>
<%
		while(rs.next()){
			out.println("<tr>");
			int attr_id = rs.getInt("attr_id");
			int attr_max = rs.getInt("attr_max");
			int attr_time = rs.getInt("attr_time");
			int attr_price = rs.getInt("attr_price");
			String attr_content = rs.getString("attr_content");
			String attr_name = rs.getString("attr_name");
			int attr_location = rs.getInt("attr_location");
			int attr_min_age = rs.getInt("attr_min_age");
			int attr_max_age = rs.getInt("attr_max_age");
			int attr_min_height = rs.getInt("attr_min_height");
			int attr_max_height = rs.getInt("attr_max_height");
			int attr_authorize = rs.getInt("attr_authorize");
			Date d = rs.getDate("attr_regDate");
			Time t = rs.getTime("attr_regDate");
			String attr_img = rs.getString("attr_img");
			String attr_cardimg = rs.getString("attr_cardimg");
			
			String attr_regdate = "";
			if(d != null){
				attr_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			out.println("<td>" + attr_id + "</td>");
			out.println("<td>" + attr_max + "</td>");
			out.println("<td>" + attr_time + "</td>");
			out.println("<td>" + attr_price + "</td>");
			out.println("<td>" + attr_content + "</td>");
			
			out.println("<td><a href='view.jsp?uid=" + attr_id + "'>" + attr_name + "</a></td>");
			out.println("<td>" + attr_location + "</td>");
			out.println("<td>" + attr_min_age + "</td>");
			out.println("<td>" + attr_max_age + "</td>");
			out.println("<td>" + attr_min_height + "</td>");
			out.println("<td>" + attr_max_height + "</td>");
			
			out.println("<td>" + attr_authorize + "</td>");
			out.println("<td>" + attr_regdate + "</td>");
			out.println("<td>" + attr_img + "</td>");
			out.println("<td>" + attr_cardimg + "</td>");
			
			
			out.println("</tr>");
		} // end while
%>			
		</table>
		<br>
		<button onclick="location.href='write.jsp'">신규등록</button>
<%	
	} catch(Exception e){
		e.printStackTrace();
		// 예외 처리
	} finally {
		// 리소스 해제
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<%-- 위 트랜잭션이 마무리 되면 페이지 보여주기 --%>


</body>
</html>















