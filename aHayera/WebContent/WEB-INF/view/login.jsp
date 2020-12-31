<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>

	<!-- 타이틀 바 -->
    <link rel="shortcut icon" type="image/x-icon" href="images/logo_only_transparent_small.png" >
    <title>하예라 - 로그인</title>

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


	<style>body{padding-top: 60px;}</style>

    <link href="/aHayera/css/bootstrap_login.css" rel="stylesheet" />

	<link href="/aHayera/css/login-register.css" rel="stylesheet" />
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

	<script src="/aHayera/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<script src="/aHayera/js/bootstrap_login.js" type="text/javascript"></script> 
	<script src="/aHayera/js/login-register.js" type="text/javascript"></script>

</head>
<body>
    <div class="container">

		 <div class="modal fade login" id="loginModal">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content">
    		         <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        
                        <div class="modal-title" style="text-align: center; font-family: '레시피코리아'; font-size: 20px;">로그인 with HAYERA</div>
                    </div>
                    <div class="modal-body">
                        <div class="box">
                             <div class="content">
                             
                                <div class="form loginBox">
                                    <form method="get"  accept-charset="UTF-8">
                                    <div id='errpopup'></div>
                                    <input id="customer_id" class="form-control" type="text" placeholder="아이디를 입력하세요" name="customer_id">
                                    <input id="password" class="form-control" type="password" placeholder="비밀번호를 입력하세요" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="Login" id="login">
                                    <br/>
                                    </form>
                                </div>
                                <div style="text-align: center">
                                    <a href="join.do">
                            		회원가입
                               		</a>을 원하시면 클릭해주세요
                             </div>
                             </div>
                        </div>
                      
                    </div>
                  
    		      </div>
		      </div>
		  </div>
    </div>
<script type="text/javascript">
  $(document).ready(function(){
        openLoginModal();
        $('#login').click(function () {
			
        	if($.trim($('#customer_id').val())==''){
        		alert('아이디를 입력해 주세요');
        		$('#customer_id').focus();
        		return;
        	}
        	if($.trim($('#password').val())==''){
        		alert("비밀번호입력해주세요.");
        		$('#password').focus();
        		return;
        	}
        	
        	
        	$.ajax({
        		type :'post',
        		async : true,
        		url : "logingo.do", // logingo.do로 요청
        		contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
        		data : {
        			'customer_id':$('#customer_id').val(),
        			'password':$('#password').val()
        		},
        		success : function(result){
        			if(result==0){
        				$('#errpopup').text("아이디 또는 비밀번호가 일치하지 않습니다.");
        				$('#customer_id').val("");
        				$('#password').val("");
        			}
        			else if(result==1){
        				location.replace("mainAfterLogin.do");
        			}
        		},
        		err: function(err){console.log(err)}
        	});
		});
        
        
    }); 
  
  
  function openLoginModal(){
	    showLoginForm();
	    setTimeout(function(){
	        $('#loginModal').modal('show');    
	    }, 230);
	    
	};
	
  function showLoginForm(){
	  //  $('#loginModal').fadeOut('fast',function(){
	        $('.loginBox').fadeIn('fast');
	      
	        
	   //     $('.modal-title').html('Login with');
	  //  });       
	   //  $('.error').removeClass('alert alert-danger').html('');
	}

</script>


</body>
</html>
