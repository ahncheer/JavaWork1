<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<div class="tester">
	 <table>
	  <tbody>
	   <tr>
	    <th scope="row">
	     <div>동적SELECT BOX</div>
	    </th>
	   </tr>
	   <td>
	    <select id="province" name="province" onchange="citySelect(this.value);">
	    <option value="">전체</option>                                                     
	    <option value="gyeonGi">경기</option>
	    <option value="gangWon">강원</option>                                       
	    </select>
	              
	    <select id="city" name="city">
	    <option value="">전체</option>
	    </select>                                   
	   </td>
	  </tbody>
	 </table>
	</div>
</body>
</html>

<script type="text/javascript">
	//AJAX select box
	function citySelect(province){
	$.ajax({
	 type: "POST",
	 url: "/tc/testSelect.do",
	 dataType:"json",
	 data: {param:province},
	 success: function(result){
	
	  //SELECT BOX 초기화           
	  $("#city").find("option").remove().end().append("<option value=''>전체</option>");
	  
	  //배열 개수 만큼 option 추가
	   $.each(result, function(i){
	    $("#city").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
	   });    
	  },
	   error: function (jqXHR, textStatus, errorThrown) {
	   alert("오류가 발생하였습니다.");
	  }                     
	 });
	}
</script>















