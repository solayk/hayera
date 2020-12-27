
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/aHayera/js/jquery-1.10.2.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/mypage_util.css">
<link rel="stylesheet" type="text/css" href="css/mypage_modify.css">

<script type="text/javascript">
$(function(){
	$('#password').focusout(function () {
		
		
	 	$.ajax({
	 		url:"before_pw.do",
	 		contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
	 		success : function (before_pw) {
	 			
	 			if($('#password').val()!= before_pw){
	 				$('#password').val(""); 	 //비밀번호가 맞지 않는 경우 초기화 해줌
	 				alert("비밀번호가 일치하지 않습니다");
	 				
	 			}	else{
	 				alert("성공");
	 			}	
			},
			err : function (err) {
				console.log(err)
			}
	 	})	

	}) //현재 비밀번호 확인




	$('#last_btn').click(function () {
		 var newpass = $('#password_new').val();
		 var newconfirm = $('#password_new_ch').val();
		
	 if(newpass!=newconfirm) {
		
		 alert("비밀번호를 다시확인해주세요.")
		 $('#password_new').val(""); 
		 $('#password_new_ch').val(""); 
		 
		 return; 
		 }
		
		$.ajax({
			url:"change_pop.do",
			contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
			data: {
				'password_new': $('#password_new').val(),
				'password' : $('#password').val()
			},
			success : function (result) { //1
				alert(result+"성공");
				
				$('#password').val(""); 
				$('#password_new').val(""); 
				$('#password_new_ch').val("");
			},
			err : function (err) {
				console.log(err)
			}
				
		})
		
		
	})//새 비밀번호 비교 확인

	 
		$('#no_pw_btn').click(function () {
			
			//alert("취소")
			window.close()
			
		})
})


</script>
</head>


<body>
	<div class="main">
		<div class="container tim-container category_main"
			style="max-width: 800px; padding-top: 20px">
	
				<form id="frm" method="get" action="updateMypage.do">
					<table>
						<p class="costomer">
						<div class="wrap-input100 validate-input"
							data-validate="Repeat Password is required">
							<span class="label-input100">현재 비밀번호</span>
							<input class="input100" name="password"  type="text" id='password'placeholder="현재비밀번호를 입력하세요"/>
							<spanclass="focus-input100"></span>
						</div>
						<div class="wrap-input100 validate-input"
							data-validate="Name is required">
							<span class="label-input100">새 비밀번호</span>
							<input class="input100" name="password_new" id="password_new" type="text" placeholder="영문,숫자, 특수문자를 혼합하여 입력해주세요.." />
							<spanclass="focus-input100"></span>
						</div>
						
						<div class="wrap-input100 validate-input"
							data-validate="Password is required">
							<span class="label-input100">새 비밀번호 확인</span>
							<input class="input100" name="password_new_ch" id="password_new_ch" type="text" placeholder="영문,숫자, 특수문자를 혼합하여 입력해주세요." />					
							<span class="focus-input100"></span>
							</div>
						
						
						
						</p>
					</table>
				</form>

<!-- 현재 비밀번호 <input name="password"  type="text" id='password'/><br/>
새 비밀번호 <input name="password_new" id="password_new" type="text"/><br/>
새 비밀번호 확인 <input name="password_new_ch" id="password_new_ch" type="text"/><br/> -->

<input type="button" id="last_btn" value="변경">
<input type="button" id="no_pw_btn" value="취소">





</body>
</html>