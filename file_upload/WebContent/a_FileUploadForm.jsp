<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일업로드 FORM~!~!</title>
</head>
<body>
<h2>파일업로드 FORM</h2>
<form action="a_FileUpload.jsp" method="post" 
	enctype="Multipart/form-data">
	<hr>	
	파일1: <input type="file" name="file1"><br> <%-- part: file1 --%>
	<hr>
	파일2: <input type="file" name="file2"><br> <%-- part: file2 --%>
	<br>
	<button type="submit" value="button" id="attr_imginfo">사진보ads기</button>
	
    <div id="imgAjaxReturn">사진나오는곳</div>
</form>
</body>
</html>


<script>

$(function () {
    $("#attr_imginfo").click(function () {
        $.ajax({
            
            type : "get",
            url : "a_FileUpload.jsp",
            //여러개 데이터 보낼 때 Json 방식
            data : {
            	attr_location : $("#file1").files(),
            	attr_age : $("#file2").files(),
            },
            success : function(data){
                //check.jsp에서 DB확인해서 출력은 index에서
                $("#imgAjaxReturn").html(data);
                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
            },
            error : function(){
                alert("error");
            }
        });
        
    });
});

</script>


