<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%-- JSTL 버젼으로 바뀌니, import 번잡합도 사라진다. JAVA변수 선언도 사라진다 --%>

<script>
var test01 = '';

var value_loca = 0;
var value_age = 0;
var value_hei = 0;</script>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
<form id="frm">
    <div>
        <label>위치</label>
        <!-- <input type="text" name="number" id="number"> -->
        <select name="attr_location" id="attr_location">
			<option value="0">상관없음</option>
			<option value="1">실내</option>
		    <option value="5">실외</option>
		</select>
    </div>
    
    <div>
	    <label>나이</label>
    	<select name="attr_age" id="attr_age">
			<option value="0">상관없음</option>
			<option value="1">4세이하</option>
		    <option value="2">5세이상~65세미만</option>
		    <option value="3">65세이상</option>
		</select>
    </div>
    
        <div>
	    <label>키</label>
    	<select name="attr_height" id="attr_height">
			<option value="0">110미만</option>
			<option value="1">110이상~190미만</option>
		    <option value="2">190이상</option>
		</select>
    </div>
    
    <div style="margin-top: 20px">
        <input type="button" value="button" id="button">
    </div>
    <br><br>
</form>
<div id="ajaxReturn">결과 값</div>



	<hr><hr><hr>
	
	
	<input type="button" value="button2" id="button2">
		<hr><hr><hr>
	
	<h2>리스트</h2>
	<table>
		<tr>
			<th>UID</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
<!-- 
	<c:choose>
		<c:when test="${empty list || fn:length(list) == 0}">
		</c:when>
		<c:otherwise>
		
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.uid } </td>
				<td><a href="view.do?uid=${dto.uid }">${dto.subject }</a></td>
				<td>${dto.name }</td>
				<td>${dto.viewCnt }</td>
				<td>${dto.regDate }</td>
			</tr>
			
		</c:forEach>
		
		</c:otherwise>
	</c:choose>
	 -->

	</table>
	<br>
	<button onclick="location.href='write.do'">신규등록</button>
	<input type="button" id="button1" onclick="button1_click();" value="버튼1" />
	
</body>
</html>



<script>

$(function () {
    $("#button").click(function () {
        $.ajax({
            
            type : "get",
            url : "check.jsp",
            //여러개 데이터 보낼 때 Json 방식
            data : {
            	attr_location : $("#attr_location").val(),
            	attr_age : $("#attr_age").val(),
            	attr_height : $("#attr_height").val(),
            },
            success : function(data){
                //check.jsp에서 DB확인해서 출력은 index에서
                $("#ajaxReturn").html(data);
                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
                test01 = data;
                value_loca = parseInt(test01/100);
            	value_age = parseInt((test01/10)%10);
            	value_hei = parseInt(test01%10);
                alert("success"+ test01);
            },
            error : function(){
                alert("error");
            }
        });
    });
});


function button1_click() {
	alert(value_loca + " -- " + value_age + " -- " + value_hei);
}

$(function () {
    $("#button").click(function () {
		// var date = document.getElementById("date").value.trim();
		 
		 // XML
		 var url = "http://localhost:8082/JSPEX_WebEditor/list.do";
		
		$.ajax({
			url : url,
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success") parseXML(data);
			}
		});
	 });
});

function parseXML(xmlDOM) {
	var table = "<tr><th>호선</th><th>역명</th><th>승차인원</th><th>하차인원</th></tr>";
	$(xmlDOM).find("row").each(function(){
		table += "<tr>";
		table += "<td>" + $(this).find("td").text() + "</td>";
		table += "<td>" + $(this).find("td").text() + "</td>";
		table += "<td>" + $(this).find("td").text() + "</td>";
		table += "<td>" + $(this).find("td").text() + "</td>";		
		table += "<td>" + $(this).find("td").text() + "</td>";		
		table += "</tr>";
	});
	$("#demoXML").html(table);
}
</script>











