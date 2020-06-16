<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%> <%-- JDBC 관련 import --%>  

<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩 꼭!
	// 입력한 값 받아오기			
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String card_img = request.getParameter("card_img");
	String attr_img = request.getParameter("attr_img");
	
	String attr_time = request.getParameter("attr_time");
	String attr_person = request.getParameter("attr_person");
	String attr_price = request.getParameter("attr_price");
	
	String attr_minage = request.getParameter("attr_minage");
	String attr_maxage = request.getParameter("attr_maxage");
	
	String attr_minhei = request.getParameter("attr_minhei");
	String attr_maxhei = request.getParameter("attr_maxhei");
	String attr_loca = request.getParameter("attr_loca");
	
	// 유효성 체크, 
	// name, subject 는 비어있으면 안된다. NN
	// null 이거나 빈 문자열이면 이전화면으로 돌아가기
	if(name == null || name.trim().equals("") ||
	content == null || content.trim().equals("")||
	card_img == null || card_img.trim().equals("")||
	attr_img == null || attr_img.trim().equals("")||
	attr_time == null || attr_time.trim().equals("")||
	attr_person == null || attr_person.trim().equals("")||
	attr_price == null || attr_price.trim().equals("")||
	attr_minage == null || attr_img.trim().equals("")||
	attr_maxage == null || attr_minage.trim().equals("")||
	attr_minhei == null || attr_minhei.trim().equals("")||
	attr_maxhei == null || attr_maxhei.trim().equals("")||
	attr_loca == null || attr_loca.trim().equals("")
	){
		if(Integer.parseInt(attr_minage) > Integer.parseInt(attr_maxage)){
			%>
			<script>
				alert("최소나이는 최대나이보다 클 수 없습니다.");
				history.back();   // history.go(-1);
			</script>
			<%	
		}else if(Integer.parseInt(attr_minhei) > Integer.parseInt(attr_maxhei)){
			%>
			<script>
				alert("최소키는 최대키보다 클 수 없습니다.");
				history.back();   // history.go(-1);
			</script>
			<%	
		}else{
%>
		<script>
			alert("빈 칸을 채워주세요!");
			history.back();   // history.go(-1);
		</script>
<%		
		return;    // ★ 더 이상 JSP 프로세싱 하지 않도록 종료 ★
		}
	}
%>

  
<%!
	// JDBC 관련 기본 객체변수
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery() 
	int cnt = 0;   // DML 결과, executeUpdate()
	
	// Connection 에 필요한 값 세팅
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "scott0316";
	String upw = "tiger0316";
%>

<%!
	// 쿼리문 준비
	final String SQL_WRITE_INSERT = "INSERT INTO attraction " +
		"(attr_id, attr_name, attr_content, attr_img, attr_cardimg,"
				+ " attr_time, attr_max, attr_price,"
				+ " attr_min_age, attr_max_age, "
				+ "attr_min_height, attr_max_height, attr_location, "
				+ " attr_authorize, attr_regDate) " +
		" VALUES(ATTRACTION_WRITE_SEQ.nextval, ?, ?, ?, ?, " + " ?, ?, ?,"
				+"?, ?, " + " ?, ?, ?, 1, sysdate)";
%>
<%
	try{
		Class.forName(driver);
		out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(url, uid, upw);
		out.println("conn 성공" + "<br>");
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(SQL_WRITE_INSERT);
		
		pstmt.setString(1, name);
		pstmt.setString(2, content);
		pstmt.setString(3, card_img);
		pstmt.setString(4, attr_img);
		
		pstmt.setInt(5, Integer.parseInt(attr_time));
		pstmt.setInt(6, Integer.parseInt(attr_person));
		pstmt.setInt(7, Integer.parseInt(attr_price));
		
		pstmt.setInt(8, Integer.parseInt(attr_minage));
		pstmt.setInt(9, Integer.parseInt(attr_maxage));
		
		pstmt.setInt(10, Integer.parseInt(attr_minhei));
		pstmt.setInt(11, Integer.parseInt(attr_maxhei));
		pstmt.setInt(12, Integer.parseInt(attr_loca));
		
		
		cnt = pstmt.executeUpdate();
		
	} catch(Exception e){
		e.printStackTrace();
		//throw e;
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
<% if(cnt == 0){ %>
		<script>
			alert("등록 실패!!!!!!");
			history.back();   // 브라우저가 기억하는 직전 페이지(입력중 페이지로)
		</script>
<% } else { %>
		<script>
			alert("등록 성공, 리스트를 출력합니다");
			location.href = "list.jsp";
		</script>

<% } %>













































