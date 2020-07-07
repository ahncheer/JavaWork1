<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 아래 스크립트를 추가햐야 한다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<button id="waterWind" onClick="wwButton"
		style="width: 300px; height: 100px;">물/바람</button>
	<button id="sunderIce" onClick="siButton"
		style="width: 300px; height: 100px;">번개/얼음</button>
	<button id="fireLand" onClick="flButton"
		style="width: 300px; height: 100px;">불/땅</button>
	<br>
	<br>
	<div id="demo"
		style="height: 1000px; width: 100%; background-image: url('https://lh6.googleusercontent.com/ZW4h5MzY6WunFnDevJwBDrS_0JXARfuPq4WLfPKKGHz5eRWMwhVH0s8Zfe6zsHu22H6QdhAC7lb0OuqbW989wnkxLyfppq8rQOo1UD_X7cyEAD43o4zuNMhfsDy8n--o84xmrfWhXA'); background-size: cover;">
		<%@ include file="mob_WW.jsp"%>
		<%@ include file="mob_SI.jsp"%>
		<%@ include file="mob_LF.jsp"%>
	</div>
</body>
<br>
<br>
<br>
<br>
<br>
<br>
</html>


<script>


$(function () {
    $("#attr_search").click(function () {
    	
    		//alert('일단은 숫자입니다 ' + '값은 : ' + ttttest);
	    		$.ajax({
	            type : "get",
	            url : "attrClientListCheck.jsp",
	            data : {
	            	attr_location : $("#attr_location").val(),
	            	attr_age : $("#attr_age").val(),
	            	attr_height : ttttest,
	            },
	            success : function(data){
	                $("#ajaxReturn").html(data);
	                $("#ajaxReturn0").html("");
	                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
	            },
	            error : function(){
	                alert("에러 발생. 페이지를 새로고침합니다.");
	                location.reload();
	            }
	     	   });
    	
    });
});

</script>













