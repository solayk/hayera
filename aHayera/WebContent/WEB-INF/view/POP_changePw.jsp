<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!--  Plugin for the Wizard -->
<script src="/aHayera/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="/aHayera/js/bootstrap_login.js" type="text/javascript"></script>
<script src="/aHayera/js/login-register.js" type="text/javascript"></script>

<!--  More information about jquery.validate here: https://jqueryvalidation.org/	 -->
<script src="/aHayera/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="/aHayera/js/bootstrap-wizard_change_pw.js"></script>

</head>
<!-- 새비밀번호 확인 -->
<script type="text/javascript">


//현재 비밀번호와 새비밀번호 비교

$ ("#chage_btn").click(funtion)(){
	
	alert("나오나");
	

}


</script>






<body>
<span id="password_ck"></span>

<form method="post" action="update_pw.do">
현재 비밀번호 <input name="password"  type="text" id='password'/><br/>
새 비밀번호 <input name="password_new" id="password_new" type="text"/><br/>
새 비밀번호 확인 <input name="password_new_ch" type="text"/><br/>

<input type="hidden" name="customer_id" id='customer_id' value="${id.customer_id}"/>
<input type="button" id="chage_btn" value="변경"/> <!-- 나중에 submit으로 고치자 -->
<a href="mypage.do"><input type="button" value="취소"/></a>
 </form>


</body>
</html>
/* $('#password_new').focusout(function(){
	

$.ajax({
	type:"post",
	async: true,
	url:'update_pw.do',  // 변경되었습니다 알림창 뜬 후 메인으로 감
	contentType: 'application/x-www-form-urlencoded;charset=utf-8',
	data:{'customer_id':$('#customer_id').val(),
		'password':$('#password').val()
		},
	
	success:function(result){
		$('#password_new').text(result);
		
	},
	error: function(err){console.log(err);}
	
	
	
})

}) */