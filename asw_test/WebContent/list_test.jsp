<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%> <!-- 선언부 밑에 위치해야한다. -->
<%@page import="java.util.ArrayList"%>
<%@page import="asw_test.DramaVO"%>
<%-- <%@include file="DramaVO.jsp" %>--%>
 
<%
    List<String> news = new ArrayList<String>(); 
    news.add("MBC 납량특집 드라마 M");
    news.add("MBC 납량특집 드라마 거미");
    news.add("KBS 납량특집 전설의 고향");
    news.add("SBS 토요 미스테리");
    DramaVO vo = null;
    
    List<DramaVO> dramas = new ArrayList<DramaVO>();
    for( int i = 0; i < 4; i++ ) {
        vo = new DramaVO();
        vo.setBroadcastStation("MBC");
        vo.setDramaName("M" + i);
        dramas.add(vo);
    }
%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table border="1">
        <tr>
            <th> 방송사 </th>
            <th> 드라마 제목 </th>
        </tr>
<%
    for( DramaVO drama : dramas ){
%>
        <tr>
            <td><%= drama.getBroadcastStation() %></td>
            <td><%= drama.getDramaName() %></td>
        </tr>
<% } %>
    </table>
 
</body>
</html>


출처: https://best421.tistory.com/26 [Updates available]