<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/aHayera/js/jquery-1.10.2.js" type="text/javascript"></script>

</head>
<body>

현재 비밀번호 <input name="password"  type="text" id='password'/><br/>
새 비밀번호 <input name="password_new" id="password_new" type="text"/><br/>
새 비밀번호 확인 <input name="password_new_ch" id="password_new_ch" type="text"/><br/>

<input type="button" id="last_btn" value="변경">


<script type="text/javascript">

$('#password').focusout(function () {
	
	
 	$.ajax({
 		url:"before_pw.do",
 		contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
 		success : function (before_pw) {
 			
 			if($('#password').val()!= before_pw){
 				alert("비밀번호가 일치하지않습니다")
 			}	else{
 				alert("실패")
 			}	
		},
		err : function (err) {
			console.log(err)
		}
 	})	

})




$('#last_btn').click(function () {
	 var newpass = $('#password_new').val();
	 var newconfirm = $('#password_new_ch').val();
	
 if(newpass!=newconfirm) alert("비밀번호를 다시확인해주세요.")
	
	$.ajax({
		url:"change_pop.do",
		contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
		data: {
			'password_new': $('#password_new').val(),
			'password' : $('#password').val()
		},
		success : function (result) {
			alert(result);
		},
		err : function (err) {
			console.log(err)
		}
		
	
	})
	 
})


</script>



</body>
</html>