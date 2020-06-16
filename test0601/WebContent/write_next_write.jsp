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
<%
int attr_location =  Integer.parseInt(request.getParameter("attr_location"));
int attr_age = Integer.parseInt(request.getParameter("attr_age"));
int attr_height = Integer.parseInt(request.getParameter("attr_height"));
int uid = rs.getInt("attr_id");
int attrlo = rs.getInt("attr_location");
int age_min = rs.getInt("attr_min_age");
int age_max = rs.getInt("attr_max_age");
int height_min= rs.getInt("attr_min_height");
int height_max = rs.getInt("attr_max_height");
String attr_name = rs.getString("attr_name");
String attr_cardimg = rs.getString("attr_cardimg");

age_min < attr_age &&  attr_age <= age_max
height_min < attr_height &&  attr_height <= height_max

//이거밖에 방법이 없나??????
List imgList = new ArrayList(); //이미지리스트 
List nameList = new ArrayList(); //이름리스트
List uidList = new ArrayList(); //uid리스트 --> 확인용

if(attr_location == 2222){
	if(attr_age == 2222){
		if(attr_height == 2222){
			//case1--> 장소상관없음/나이상관없음/키상관없음
			text = "SELECT * FROM attraction ORDER BY attr_id DESC";
		}else if(height_min < attr_height &&  attr_height <= height_max){
			//case2 --> 장소상관없음/나이상관없음/키값있음
		}
	}else if (age_min < attr_age &&  attr_age <= age_max){
		if(attr_height == 2222){
			//case3 --> 장소상관없음/나이값있음/키상관없음
		}else if(height_min < attr_height &&  attr_height <= height_max){
			//case4 --> 장소상관없음/나이값 있음/키값있음
		}
	}
}
else if(attr_location == attrlo){
	if(attr_age == 2222){
		if(attr_height == 2222){
			//case5 --> 장소값있음/나이상관없음/키상관없음
		}else if(height_min < attr_height &&  attr_height <= height_max){
			//case6 --> 장소값있음/나이상관없음/키값있음
		}
	}else if (age_min < attr_age &&  attr_age <= age_max){
		if(attr_height == 2222){
			//case7 --> 장소값있음/나이값있음/키상관없음
		}else if(height_min < attr_height &&  attr_height <= height_max){
			//case8 --> 장소값있음/나이값있음/키값있음
		}
	}
}else{
	out.print("attr_location" + attr_location);
	out.print("attr_age" + attr_age);
	out.print("attr_height" + attr_location);
}

&& attr_height == 2222




%>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>


<%

if(attr_location != 2222){//위치
	
}else{
	
}
if(attr_age != 2222){//나이

}else{
	
}
if(attr_height != 2222){//키
	
}else{
	
}

text = "SELECT * FROM ATTRACTION WHERE";
if(attr_location != 2222){//위치
	if(attr_age != 2222){//나이
		if(attr_height != 2222){//키
			text+="ATTR_LOCATION == attrlo" +
					"AND age_min < attr_age AND attr_age <= age_max " +
					"AND height_min < attr_height AND attr_height <= height_max";
		}else{
			text+="ATTR_LOCATION == attrlo" +
					"AND age_min < attr_age AND attr_age <= age_max ";
		}
	}else{
		if(attr_height != 2222){//키
			text+="ATTR_LOCATION == attrlo" +
					"AND height_min < attr_height AND attr_height <= height_max";
		}else{
			text+="ATTR_LOCATION == attrlo";
		}
	}
}else{
	if(attr_age != 2222){//나이
		if(attr_height != 2222){//키
			text+=" age_min < attr_age AND attr_age <= age_max " +
					"AND height_min < attr_height AND attr_height <= height_max";
		}else{
			text+=" age_min < attr_age AND attr_age <= age_max ";
		}
	}else{
		if(attr_height != 2222){//키
			text+="height_min < attr_height AND attr_height <= height_max";
		}else{
			
		}
	}
}
text+="ORDER BY attr_id DESC";







%>















