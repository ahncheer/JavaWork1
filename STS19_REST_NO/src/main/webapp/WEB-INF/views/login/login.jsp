<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="CSS/style.css" rel="stylesheet" type="text/css">
<title>20's WORLD LOGIN</title>

<script>
	window.onpageshow = function(event) {
		if (event.persisted
				|| (window.performance && window.performance.navigation.type == 2)) {

			location.reload();
		}
	}
</script>

</head>
<body>


<div class="wrapper">

	<div class="login container"
		style="min-height: 700px; max-width: 400px;">
	<div class="loginuser-section">
		<div class="text-center">
			<img src="logo4.jpg" alt="logo" width="200px" height="150px">
		</div>
		<h3 class="text-center">LOGIN</h3>
		<form method="post" action="loginCheck.jsp" name="form"
			onsubmit="return validateForm()">
			<label id="login_label">Your ID *</label> <input type="text"
				name="user_id" id="login_id" placeholder="아이디를 입력해주세요"> <br>
			<label id="login_label">Your PW *</label> <input type="password"
				name="user_pw" id="login_pw" placeholder="비밀번호를 입력해주세요"> <br>
			<input class="login_submit" type="submit" value="로그인">
		</form>
		<hr>
	</div>

	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left" type="button"
						data-toggle="collapse" data-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">아이디찾기
					</button>
				</h2>
			</div>

			<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
				data-parent="#accordionExample">
				<div class="card-body">
					<form method="post" action="idfind.jsp"
						style="text-align: center;">
						<label style="width: 80px; text-align: left;">이름</label> <input
							type="text" id="find_user_name" name="user_name"
							placeholder="이름을 입력하세요"><br> <label
							style="width: 80px; text-align: left;">주민번호</label> <input
							type="text" id="find_user_jumin" name="user_jumin"
							placeholder="주민번호를 입력하세요"><br> <input
							class="find_id_submit" type="submit" value="찾기"> <br>
					</form>

				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" id="headingTwo">
				<h2 class="mb-0">
					<button class="btn btn-link btn-block text-left collapsed"
						type="button" data-toggle="collapse" data-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">비밀번호
						찾기</button>
				</h2>
			</div>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionExample">
				<div class="card-body">
					<form method="post" action="pwfind.jsp" class="text-center">
						<label style="width: 80px; text-align: left;">이름</label> <input
							type="text" id="find_user_name" name="user_name"
							placeholder="이름을 입력하세요"><br> <label
							style="width: 80px; text-align: left;">아이디</label> <input
							type="text" id="find_user_id" name="user_id"
							placeholder="아이디를  입력하세요"><br> <label
							style="width: 80px; text-align: left;">주민번호</label> <input
								type="text" id="find_user_jumin" name="user_jumin"
								placeholder="주민번호를 입력하세요"><br> <input
								class="find_pw_submit" type="submit" value="찾기"> <br>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

</div>


</body>
</html>
