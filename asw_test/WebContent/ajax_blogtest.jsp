<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
 
<div style="width: 500px; margin: auto; margin-top: 100px">
<form id="frm">
    <div>
        <label>위치</label>
        <!-- <input type="text" name="number" id="number"> -->
        <select name="attr_location" id="attr_location">
			<option value="0">상관없음</option>
			<option value="1">실내</option>
		    <option value="2">실외</option>
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
    
    <div id="ajaxReturn">결과 값</div>
    
</form>
</div>
 
<script type="text/javascript">
$(function () {
    $("#button").click(function () {
        $.ajax({
            
            type : "get",
            url : "./check.jsp",
            //여러개 데이터 보낼 때 Json 방식
            data : {
            	attr_location : $("#attr_location").val(),
            	attr_age : $("#attr_age").val(),
            	attr_height : $("#attr_height").val(),
            },
            success : function(data){
                alert("success");
                //check.jsp에서 DB확인해서 출력은 index에서
                $("#ajaxReturn").html(data);
                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
            },
            error : function(){
                alert("error");
            }
        });
    });
});
</script>
 
</body>
</html>









