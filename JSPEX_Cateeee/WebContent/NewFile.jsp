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

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
<<script type="text/javascript">

if(status == "success"){
	var i = 0;
	result = "";
	if(data.status == "OK"){
		var items = data.data;
		var count = data.count;
		$('#choiceOne').removeAttr("disabled");
		
		for( i = 0; i< count; i ++){
			result += "<option value ='"+items[i].uid+"'>"+items[i].name+"</option>\n";
			
		}
		$('#choiceOne').html(result);
		
		   //첫번째 버튼이 클릭되었을 때
		   $("#choiceOne").change(function(){
			   $('#choiceTwo').removeAttr("disabled");
//			   	var items = data.data;
//				var count = data.count;
				
				for( j = 0; j < count; j ++){
					if($(this).val() == data.data[j].parent){
						result +=  "<option value='"+ data.data[j].uid +"'>"+ data.data[j].name + "</option>\n";
                     }
//					result += "<option value ='"+items[j].uid+"'>"+items[j].name+"</option>\n";
					
				}
				$('#choiceTwo').html(result);
				
				//두번째 버튼 클릭되었을때
                  $("#choiceTwo").change(function(){
                	  $('#choiceThree').removeAttr("disabled");
//					   	var items = data.data;
//						var count = data.count;
						
						for( i = 0; i < count; i ++){
							if ($(this).val() == data.data[i].parent){
								result += "<option value='"+ data.data[i].uid +"'>"+ data.data[i].name + "</option>\n";
		                        }
//							result += "<option value ='"+items[j].uid+"'>"+items[j].name+"</option>\n";
					}
					$('#choiceThree').html(result);
              });
         });
	}
}

</script>














