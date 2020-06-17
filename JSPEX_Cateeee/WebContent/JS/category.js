var depth = 1;
var depth = 1;

$(document).ready(function(){
	loadPage(depth);
})

function loadPage(depth){
	$.ajax({
		url : "cate_list.ajax?depth="+depth,
		type : "get",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				var i = 0;
				result1 = "";
				result2 = "";
				result3 = "";
				if(data.status == "OK"){
					var items = data.data;
					var count = data.count;
					$('#choiceOne').removeAttr("disabled");
					
					for( i = 0; i< count; i ++){
						result1 += "<option value ='"+items[i].uid+"'>"+items[i].name+"</option>\n";
						
					}
					$('#choiceOne').html(result1);
					
					   //첫번째 버튼이 클릭되었을 때
					   $("#choiceOne").change(function(){
						   $('#choiceTwo').removeAttr("disabled");
						   	var items = data.data.data;
							var count = data.data.count;
							
							for( j = 0; j < count; j ++){
								if($(this).val() == data.data[j].parent){
									result2 +=  "<option value='"+ data.data[j].uid +"'>"+ data.data[j].name + "</option>\n";
			                     }
//								result += "<option value ='"+items[j].uid+"'>"+items[j].name+"</option>\n";
								
							}
							$('#choiceTwo').html(result2);
							
							//두번째 버튼 클릭되었을때
			                  $("#choiceTwo").change(function(){
			                	  $('#choiceThree').removeAttr("disabled");
//								   	var items = data.data;
//									var count = data.count;
									
									for( i = 0; i < count; i ++){
										if ($(this).val() == data.data[i].parent){
											result3 += "<option value='"+ data.data[i].uid +"'>"+ data.data[i].name + "</option>\n";
					                        }
//										result += "<option value ='"+items[j].uid+"'>"+items[j].name+"</option>\n";
								}
								$('#choiceThree').html(result3);
		                  });
			         });
				}
			}
		}
	})
}




