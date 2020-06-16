<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글작성</title>
</head>
<script>
function chkSubmit(){  // 폼 검증
	frm = document.forms["frm"];
	
	var name = frm["name"].value.trim();
	var subject = frm["subject"].value.trim();
	
	if(name == ""){
		alert("작성자 란은 반드시 입력해야 합니다");
		frm["name"].focus();
		return false;
	}
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	
	
	
	
	
	
	return true;
}

</script>
<body>
<h2>글작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="writeOk.jsp" method="post" onsubmit="return chkSubmit()">
이름: <input type="text" name="name"/><br>
내용: <input type="text" name="content"/><br>
카드사진: <textarea name="card_img"></textarea><br>
메인사진: <textarea name="attr_img"></textarea><br>

소요시간: <input type="number" name="attr_time"/><br>
탑승인원수: <input type="number" name="attr_person"/><br>
가격: <input type="number" name="attr_price"/><br>

<hr>
최소나이: <input type="number" name="attr_minage"/>
최대나이: <input type="number" name="attr_maxage"/><br>

최소키: <input type="number" name="attr_minhei"/>
최대키: <input type="number" name="attr_maxhei"/><br>
장소(실내:0/실외:1):  <input type="number" name="attr_loca"/><br>

<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='list.jsp'">목록으로</button>


</body>
</html>















