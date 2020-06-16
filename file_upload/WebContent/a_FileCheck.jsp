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
<c:set var="originalFileNames" value="${paramValues.originalFileName }"/>
<c:set var="fileSystemNames" value="${paramValues.fileSystemName }"/>
<c:set var="cnt" value="${fn:length(paramValues.originalFileName) }"/>

    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>파일 확인 & 다운로드 링크~!~!</title>
<style>
form p {text-decoration: underline;}
form p:hover {cursor: pointer; color:blue;}
</style>
</head>
<body>
<%-- Java 방식 --%>
<h3><%= cnt %>개의 파일 확인</h3>

<%--
	웹 경로에 이미지 저장한 경우
 --%>
<h3>이미지 보기</h3>
<% for(int i = 0; i < originalFileNames.length; i++){ %>
<div style="width: 300px">
	<img style="width:100%; height:auto"
		src="upload/<%=fileSystemNames[i]%>"/>
</div>
<% } %>

</body>
</html>















