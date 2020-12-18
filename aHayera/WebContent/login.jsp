<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>HAYERA 고객 로그인</title>

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
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                 <a class="btn big-login" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">Log in</a>
                 <a class="btn big-register" data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">Register</a></div>
            <div class="col-sm-4"></div>
        </div>


		 <div class="modal fade login" id="loginModal">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content">
    		         <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Login with HAYERA</h4>
                    </div>
                    <div class="modal-body">
                        <div class="box">
                             <div class="content">
                               
                                <div class="division">
                                    <div class="line l"></div>
                                      <span></span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form method="get"  accept-charset="UTF-8">
                                    <div id='errpopup'></div>
                                    <input id="customer_id" class="form-control" type="text" placeholder="아이디를 입력하세요" name="customer_id">
                                    <input id="password" class="form-control" type="password" placeholder="비밀번호를 입력하세요" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="Login" id="login">
                                    </form>
                                </div>
                             </div>
                        </div>
                      
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span>Looking to
                                 <a href="">create an account</a>
                            ?</span>
                        </div>
                        <div class="forgot register-footer" style="display:none">
                             <span>Already have an account?</span>
                             <a href="">Login</a>
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
        		url : "login.do", // login.do로 요청
        		contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
        		data : {
        			'customer_id':$('#customer_id').val(),
        			'password':$('#password').val()
        		},
        		success : function(result){
        			if(result==1){
        				location.replace("loginTest.do");
        			}else if(result==0){
        				$('#errpopup').text("아이디 또는 비밀번호가 일치하지 않습니다.");
        				$('#customer_id').val("");
        				$('#password').val("");
        			}
        		},
        		err: function(err){console.log(err)}
        	});
		});
        
        
    }); 
</script>


</body>
</html>
