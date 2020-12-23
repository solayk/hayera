<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<!-- <link rel="apple-touch-icon" sizes="76x76" href="images/logo_only_transparent_small.png">
   		<link rel="icon" type="image/png" href="images/logo_only_transparent_small.png"> -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<!-- 타이틀 바 -->
		<link rel="shortcut icon" type="image/x-icon" href="images/logo_only_transparent_small.png">
		<title>하예라 관리자 로그인</title>
		<meta charset="utf-8" />

		<style type="text/css">
			.admin_login_background {
				padding-top: 60px;
				background-color: #125288;
			}

			.modal-title {
				color: #125288;
			}

			.admin_login {
				width: 400px;
				background: #125288;
				padding-top: 30px;
				padding-bottom: 30px;
				margin-left: auto; /* 배치 중앙정렬 */
				margin-right: auto; /* 배치 중앙정렬 */
				text-align: center;
				position: relative;
				background-color: #C6E5F3;
				border: 1px solid #999999;
				border: 1px solid rgba(0, 0, 0, 0.2);
				border-radius: 6px;
				outline: none;
				box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
				background-clip: padding-box;
			}
			.adminLoginInput {
				display: block;
				width: 50%;
				margin-left: auto; /* 배치 중앙정렬 */
				margin-right: auto; /* 배치 중앙정렬 */
				height: 34px;
				padding: 6px 12px;
				font-size: 14px;
				line-height: 1.428571429;
				color: #555555;
				vertical-align: middle;
				background-color: #ffffff;
				background-image: none;
				border: 1px solid #cccccc;
				border-radius: 4px;
				-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
				box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
				-webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
				transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
			}
			.adminLoginInput:focus {
				border-color: #125288;
			}
		</style>

		<link href="/aHayera/css/bootstrap_login.css" rel="stylesheet" />
		<link href="/aHayera/css/login-register.css" rel="stylesheet" />
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
		<script src="/aHayera/js/jquery-3.5.1.min.js" type="text/javascript"></script>
		<script src="/aHayera/js/bootstrap_login.js" type="text/javascript"></script>
		<script src="/aHayera/js/login-register.js" type="text/javascript"></script>
		
		<script type="text/javascript">
	    // 세션 관리자 아이디 변수 sessionAdminId에 저장
	    // 제이쿼리 document ready에 걸면 화면 띄운 후 동작해 전환 느림
	    var sessionAdminId = '<%=session.getAttribute("admin_id")%>';
	            
	    if(sessionAdminId != 'null'){ /* 세션 Id가 살아있으면 mainAfterLogin.jsp로 리디렉션 */ 
	    	location.href = "adminMain.do"; 
	    }
		</script>
		
	</head>

	<body class="admin_login_background">
		<div class="admin_login">
			<div class="modal-header">
				<h4 class="modal-title">하예라 관리자 로그인</h4>
			</div>
			<div class="modal-body">
				<div class="box">
					<div class="content">

						<div class="division">
							<div class="line l"></div>
							<span></span>
							<div class="line r"></div>
						</div>
						<div class="error alert alert-danger" style="display:none"></div>

						<div class="AdminLoginBox">
							<form method="post" class="adminLoginForm">
								<input id="manager_id" class="adminLoginInput" type="text" placeholder="아이디"
									name="manager_id">
								<input id="manager_password" class="adminLoginInput" type="password" placeholder="비밀번호"
									name="manager_password">
								<br>
								<input id="adminLoginBtn" type="button" value="로그인">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- END OF admin_login -->

		<script type="text/javascript">
			$('#adminLoginBtn').click(function () {
				var info = {
					manager_id: $('#manager_id').val(),
					manager_password: $('#manager_password').val()
				}
				var showMsg = $('.admin_login > div > div > div > .alert-danger');
				$.ajax({
					type: "POST",
					data: info,
					dataType: "text",
					url: "adminLogin.do",
					contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
					success: function (result) {
						if (result == 1) location.replace("adminMain.do");
						else if (result == -1) {
							showMsg.text("비밀번호가 일치하지 않습니다.");
							showMsg.show();
							$('#manager_password').val("");
							$('#manager_password').focus();
						}
						else if (result == 0) {
							showMsg.text("존재하지 않는 아이디입니다.");
							showMsg.show();
							$('#manager_id').val("");
							$('#manager_password').val("");
							$('#manager_id').focus();
						}
					},
					error: function (err) {
						alert("에러가 발생했습니다: adminLogin.jsp --- 관리자 로그인 에러"); /* 에러 발생시 메시지 */
					}
				});
			});
		</script>

	</body>

	</html>