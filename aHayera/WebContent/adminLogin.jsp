<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>HAYERA 관리자 로그인</title>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


		<style type="text/css">
			.admin_login_background {
				padding-top: 60px;
				background-color: #125288;
			}

			.admin_login {
				width: 400px;
				background: #125288;
				padding-top: 30px;
				padding-bottom: 30px;
				margin-left: auto; /* 표 화면 중앙정렬 */
				margin-right: auto; /* 표 화면 중앙정렬 */
				text-align: center;
				position: relative;
				background-color: #ffffff;
				border: 1px solid #999999;
				border: 1px solid rgba(0, 0, 0, 0.2);
				border-radius: 6px;
				outline: none;
				box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
				background-clip: padding-box;
			}
		</style>

		<link href="/aHayera/css/bootstrap_login.css" rel="stylesheet" />
		<link href="/aHayera/css/login-register.css" rel="stylesheet" />
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
		<script src="/aHayera/js/jquery-3.5.1.min.js" type="text/javascript"></script>
		<script src="/aHayera/js/bootstrap_login.js" type="text/javascript"></script>
		<script src="/aHayera/js/login-register.js" type="text/javascript"></script>
	</head>

	<body class="admin_login_background">
		<div class="admin_login">
			<div class="modal-header">
				<h4 class="modal-title">HAYERA 관리자 로그인</h4>
			</div>
			<div class="modal-body">
				<div class="box">
					<div class="content">

						<div class="division">
							<div class="line l"></div>
							<span></span>
							<div class="line r"></div>
						</div>
						<div class="error alert alert-danger"></div>
						
						<div class="form loginBox">
							<form method="" action="main.jsp" accept-charset="UTF-8">
								<input id="adminId" class="form-control" type="text" placeholder="아이디" name="adminId">
								<input id="adminPassword" class="form-control" type="password" placeholder="비밀번호" name="adminPassword">
								<br>	
								<input class="adminLogin" type="button" value="로그인">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- END OF admin_login -->

	<script type="text/javascript">
		$('.adminLogin').click(function(){
		});
	</script>

	</body>
</html>