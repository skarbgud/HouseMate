<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>자유 게시판</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
	<form role="form" method="post" autocomplete="off">
		<p>
			<label for="userId">아이디</label> 
			<input type="text" id="userId" name="userId" />
			<button type="button" class="idCheck">아이디 확인</button>
		</p>
		<p class="result">
			<span class="msg">아이디를 확인해주십시오.</span>
		</p>
		<p>
			<label for="userPass">패스워드</label> 
			<input type="password" id="userPass" name="userPass" required="required" />
		</p>
		<p>
			<label for="userName">닉네임</label> 
			<input type="text" id="userName" name="userName" required="required"/>
		</p>
		<p>
			<button type="submit" id="submit" disabled="disabled">가입</button> <!-- 버튼 비활성화 -->
		</p>
		<p>
			<a href="/">처음으로</a>
		</p>
	</form>
	
	<script>
		$(".idCheck").click(function() {

			var query = {
				userId : $("#userId").val()
			};

			$.ajax({
				url : "/member/idCheck",
				type : "post",
				data : query,
				success : function(data) {

					if (data == 1) {
						$(".result .msg").text("사용 불가");
						$(".result .msg").attr("style", "color:#f00");
						$("#submit").attr("disabled", "disabled");
					} else {
						$(".result .msg").text("사용 가능");
						$(".result .msg").attr("style", "color:#00f");
						$("#submit").removeAttr("disabled");//버튼 비활성화 제거
					}
				}  
			}); // ajax 끝
		});
		//굳이 중복확인해놓고 다른 아이디로 가입할려고 하는 경우 대비
		//ex) aaa로 중복확인하고 bbb로 가입할려고 수정하는 경우
		$("#userId").keyup(function(){
			 $(".result .msg").text("아이디를 확인해주십시오.");
			 $(".result .msg").attr("style", "color:#000");
			 
			 $("#submit").attr("disabled", "disabled");
			 
			});
	</script>
</body>
</html>