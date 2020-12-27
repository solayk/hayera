
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/aHayera/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="/aHayera/js/jquery.validate.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/mypage_util.css">
<link rel="stylesheet" type="text/css" href="css/mypage_modify.css">

<script type="text/javascript">

$(function(){
	
     $('#password_new_ch').keyup(function(){
     if($('#password_new').val() != ($('#password_new_ch').val())){
        alert("비밀번호가 일치하지 않습니다..");
        return;
    }
    }) 

    
    $('#frm').validate({
		  rules: {
			
		    password_new:{
		    	required:true,
		    	minlength:8,
		    	regx : /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
		    },
		    passwordconfirm:{
		    	equalTo: "#password_new",
		    	required:true
		    	
		    }
		    },
     
      messages:{
      	password_new:{
      		regx:"문자,숫자, 특수문자로 입력해주세요.",
      		required:"필수 입력사항입니다.",
      		minlength : "8자리 이상으로 입력해주세요."
      	},
      	passwordconfirm:{
      		equalTo : "비밀번호가 일치하지 않습니다.",
      		required:"필수 입력사항입니다."
      	},
  
      }
	});
	
	
	/* $("#frm").validate(); 
	$.extend( $.validator.messages, { 
		required: "필수 항목입니다.", 
		remote: "항목을 수정하세요.", 
		email: "유효하지 않은 E-Mail주소입니다.", 
		url: "유효하지 않은 URL입니다.", 
		date: "올바른 날짜를 입력하세요.", 
		dateISO: "올바른 날짜(ISO)를 입력하세요.", 
		number: "유효한 숫자가 아닙니다.", 
		digits: "숫자만 입력 가능합니다.", 
		creditcard: "신용카드 번호가 바르지 않습니다.", 
		equalTo: "같은 값을 다시 입력하세요.", 
		extension: "올바른 확장자가 아닙니다.", 
		maxlength: $.validator.format( "{0}자를 넘을 수 없습니다. " ), 
	minlength: $.validator.format( "{0}자 이상 입력하세요." ), 
	rangelength: $.validator.format( "문자 길이가 {0} 에서 {1} 사이의 값을 입력하세요." ), 
	range: $.validator.format( "{0} 에서 {1} 사이의 값을 입력하세요." ), 
	max: $.validator.format( "{0} 이하의 값을 입력하세요." ), 
	min: $.validator.format( "{0} 이상의 값을 입력하세요." ) } );
 */

	
	
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
							<input class="input100" name="password"  type="text" id='password'placeholder="현재비밀번호를 입력하세요" minlength="10" required/>
							<span class="focus-input100"></span>
						</div>
						<div class="wrap-input100 validate-input"
							data-validate="Name is required">
							<span class="label-input100">새 비밀번호</span>
							<input class="input100" name="password_new" id="password_new" type="text" placeholder="영문,숫자, 특수문자를 혼합하여 입력해주세요.." password_new/>
							<span class="focus-input100"></span>
						</div>
						
						<div class="wrap-input100 validate-input"
							data-validate="Name is required">
							<span class="label-input100">새 비밀번호 확인</span>
							<input class="input100" name="password_new_ch" id="password_new_ch" type="text" placeholder="영문,숫자, 특수문자를 혼합하여 입력해주세요." passwordconfirm />					
							<span class="focus-input100"></span>
						</div>
						
						
						
						</p>
					</table>
				</form>

<!-- 현재 비밀번호 <input name="password"  type="text" id='password'/><br/>
새 비밀번호 <input name="password_new" id="password_new" type="text"/><br/>
새 비밀번호 확인 <input name="password_new_ch" id="password_new_ch" type="text"/><br/> -->
<br>
<br>
<br>

<input type="button" id="last_btn" value="변경">
<input type="button" id="no_pw_btn" value="취소">





</body>
</html>