<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%> <%-- JDBC 관련 import --%>  
<%@ page import = "java.text.SimpleDateFormat" %>  

<%  // parameter 받아오기
	int uid = Integer.parseInt(request.getParameter("attr_id"));
	// ※ 이 단계에서 parameter 검증 필요
%>

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
	//final String SQL_WRITE_INC_VIEWCNT =  // 조회수 증가
	//	"UPDATE attraction SET wr_viewcnt = wr_viewcnt + 1 WHERE wr_uid = ?";

	final String SQL_WRITE_SELECT_BY_UID =  // 글 읽어 오기
		"SELECT * FROM attraction WHERE attr_id = ?";
%>

<%
	String name = "";
	String subject = "";
	String content = "";
	String regdate = "";
	int viewcnt = 0;
%>


<%
	try{
		Class.forName(DRIVER);
		out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공" + "<br>");
		
		// 트랜잭션 실행
		// Auto-commit 비활성화
		conn.setAutoCommit(false);
		
		// 조회수 올리는거 안함
		//pstmt = conn.prepareStatement(SQL_WRITE_INC_VIEWCNT);
		//pstmt.setInt(1, uid);
		//cnt = pstmt.executeUpdate();
		
		pstmt.close();
		
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT_BY_UID);
		pstmt.setInt(1, uid);
		rs = pstmt.executeQuery();
		
		// 한개의 레코드만 select 된다.
		if(rs.next()){
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
		} else {
			// uid 값의 레코드가 없는 뜻
%>
			<script>
				alert("해당 정보가 삭제되거나 없습니다");
				history.back();
			</script>
<%			
			return;   // ★더이상 JSP 프로세싱 하지 않고 종료★
		} // end if
		
		// 모든 쿼리 성공하면 commit
		conn.commit();
	} catch(Exception e){
		e.printStackTrace();
		// 예외 처리
		conn.rollback();
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
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>읽기 <%= subject %></title> <!-- title에 글제목 넣기 -->
</head>
<script>
function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk.jsp?uid=' + uid;
	}
}
</script>
<body>
<h2>읽기 <%= subject %></h2>
<br>
UID : <%= uid %><br>
작성자 : <%= name %><br>
제목 : <%= subject %><br>
등록일 : <%= regdate %><br>
조회수 : <%= viewcnt %><br>
내용: <br>
<hr>
<div>
<%= content %>
</div>
<hr>
<br>
<button onclick="location.href='update.jsp?uid=<%= uid%>'">수정하기</button>
<button onclick="location.href = 'list.jsp'">목록보기</button>
<button onclick="chkDelete(<%= uid %>)">삭제하기</button>
<button onclick="location.href = 'write.jsp'">신규등록</button>

</body>
</html>















