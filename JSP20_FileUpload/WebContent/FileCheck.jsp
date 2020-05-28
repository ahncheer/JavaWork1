<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.*" %> <%-- URLEncoder 외 --%>

<%-- JSTL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<% request.setCharacterEncoding("utf-8"); %>

<%-- parameter 받기 : Java --%>
<%
	String [] originalFileNames = request.getParameterValues("originalFileName");
	String [] fileSystemNames = request.getParameterValues("fileSystemName");
	int cnt = originalFileNames.length;
%>

<%-- parameter 받기 : JSTL --%>
<%-- TODO --%>

    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파일 확인 & 다운로드 링크</title>
<style>
form p {text-decoration: underline;}
form p:hover {cursor: pointer; color:blue;}
</style>
</head>
<body>
<%-- Java 방식 --%>
<h3><%= cnt %>개의 파일 확인</h3>
<ul>
<%
	for(int i = 0; i < cnt; i++){
		out.println("<li>파일: " + (i + 1) + "</li>");
		out.println("<ul>");
		out.println("<li>원본이름: " + originalFileNames[i] + "</li>");
		out.println("<li>파일시스템: " + fileSystemNames[i] + "</li>");
		out.println("</ul>");
	}
%>
</ul>


<%-- JSTL 방식 --%>
<%
out.println("sda  ???? ds");
%>



<%-- TODO --%>




</body>
</html>















