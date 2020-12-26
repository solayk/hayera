<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<!--   타이틀 넣기   -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>HAYERA!</title>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<link href="css/bootstrap.css" rel="stylesheet" />

<!-- css -->
<link rel="stylesheet" type="text/css" href="css/mypage_util.css">
<link rel="stylesheet" type="text/css" href="css/mypage_modify.css">

<link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href="css/ct-navbar.css" rel="stylesheet" />

<!-- Optional - Adds useful class to manipulate icon font display -->
<link rel="stylesheet" href="css/pe-icon-7-stroke_helper.css">


<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
<script
	src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
<!-- 주소찾기 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 제이쿼리 순서 중요 먼저 있어야 아래를 읽을 수가 있다. -->
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>

<!-- mypage 절대 경로 -->
<script src="js/mypageAddr.js"></script>

<script src="js/bootstrap.js" type="text/javascript"></script>
​
<script src="js/ct-navbar.js"></script>
<style>
.fa-heart {
	color: #F74933;
}

​ .space-100 {
	height: 100px;
	display: block;
}

​ pre.prettyprint {
	background-color: #ffffff;
	border: 1px solid #999;
	margin-top: 20px;
	padding: 20px;
	text-align: left;
}

​ .atv, .str {
	color: #05AE0E;
}

​ .tag, .pln, .kwd {
	color: #3472F7;
}

​ .atn {
	color: #2C93FF;
}

​ .pln {
	color: #333;
}

​ .com {
	color: #999;
}

​ .costomer {
	position: absolute;
	top: 50%;
	left: 30%;
	width: 150px;
	height: 100px;
}

login_wrap {
	position: relative;
}

.costomer {
	width: 500px;
	height: 161px;
	position: absolute;
	left: -110px;
	top: -500px;
	z-index: 15;
	padding: 40px 0 0 30px;
}
​

 .mypageAddr{
 	background:rgba(0,0,0,0);
 	color:skyblue;
 	padding:5px;
 
 }

​

 

​
</style>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
  $(function () {   //클래스 costomer 이름 변경(2020-12-18)
   
  $('#frm').hide();  //숨어있다
  
   $('.pe-7s-id').click(function () {
	   		$('#frm').toggle();   //클릭시 마이페이지 변경 정보 나옴
          $('.costomer').css("top", "500px");
          $('.costomer').css("left", "500px");
        });

        $('.canclebtn').click(function () {
        	
        	//alert('ok');
          $('.costomer').css('top', '-500px');
        });
        
        
    
       
       
       $('#ok_btn').click(function(){
    	  alert('수정되었습니다.')
    	  
    	  $('#frm').submit();
      }); 
       
       $('#pop_btn').click(function () {
		
    	   window.open('POP_changePw.do','비밀변호변경', 'width=5px','heigh=5px');
	})

    
      
      }) //무조건 function 안에서 실행
      
    </script>
</head>

<body>

	<div id="navbar-full">
		<div id="navbar">
			<!-- navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange -->
			​
			<nav class="navbar navbar-ct-blue navbar-fixed-top" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand navbar-brand-logo" href="main.jsp">
							<div class="logo">
								<img src="./images/logo_only_transparent_small.png">
							</div>
							<div class="brand">HAYERA</div>
						</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						​
						<ul class="nav navbar-nav navbar-center">
							<li><a href="#"> <i class="pe-7s-drop"> </i>
									<p>모이스처라이저</p>
							</a></li>
							<li><a href="#"> <i class="pe-7s-sun"> </i>
									<p>선크림</p>
							</a></li>
						</ul>
						​
						<ul class="nav navbar-nav navbar-right">
							​
							<!-- KOSMO : NAVBAR에 카테고리 추가 시 사용 -->
							<li><a href="#"> <i class="pe-7s-shopbag"> <span
										class="label">2</span>
								</i>
									<p>장바구니</p>
							</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="pe-7s-user"></i>
									<p>
										내 계정 <b class="caret"></b>
									</p>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">로그인</a></li>
									<li><a href="#">주문목록</a></li>
									<li><a href="#">마이페이지</a></li>
									<!-- <li class="divider"></li>
                            <li><a href="#">Separated link</a></li> -->
								</ul></li>
						</ul>
						​
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
				​
			</nav>
			​
		</div>
		<!--  end navbar -->
		​
	</div>
	<!-- end menu-dropdown -->
	​
	<div class="main">
		<div class="container tim-container category_main"
			style="max-width: 800px; padding-top: 20px">
			<br> <br> <br> <br>
		<!-- 	<h3 class="text-center hayera">마이페이지</h3> -->
			<div class="mypage_window">
				<a class="mypage_table" href="#"> <i class="pe-7s-wallet  pe-5x"></i>
					<label class="pe-4x"> 　　　　</label> <i class="pe-7s-id pe-5x"></i> <label
					class="pe-4x">주문관리</label> <label class="pe-4x"></label> 　　　　　　　　　　　　<label
					class="pe-4x">개인정보수정</label>
				</a> <br> <br> <br> <br> <br>
				<form id="frm" method="get" action="updateMypage.do">
					<table>
						<p class="costomer">
						<div class="wrap-input100 validate-input"
							data-validate="Repeat Password is required">
							<span class="label-input100">아이디</span> <input class="input100"
								type="text" name="customer_id" type="text"
								value="${result.customer_id}" readonly> <span
								class="focus-input100"></span>
						</div>
						<div class="wrap-input100 validate-input"
							data-validate="Name is required">
							<span class="label-input100">이름</span> <input class="input100"
								type="text" name=name = "name" type="text"
								value="${result.name}" readonly> <span
								class="focus-input100"></span>
						</div>
						

						<div class="wrap-input100 validate-input"
							data-validate="Password is required">
							<span class="label-input100">비밀번호</span>
							<span
								class="focus-input100"></span> 
							
								<input type="button" id="pop_btn" value="변경" > <!-- 비밀번호 변경 팝업창 -->							
								<span class="focus-input100"></span>
							</div>
						
						
						<div class="wrap-input100 validate-input"
							data-validate="Username is required">
							<span class="label-input100">전화번호</span> <input class="input100"
								type="text" name="tel" value='${result.tel}'> <span
								class="focus-input100"></span>
						</div>
						<div class="wrap-input100 validate-input"
							data-validate="Valid email is required: ex@abc.xyz">
							<span class="label-input100">Email</span>
							<%-- <input class="input100" type="text" name="email"  value='${result.email}'> --%>
							<input class="input100" type="text" name="email"
								value="${result.email}"> <span class="focus-input100"></span>
						</div>

						<div class="wrap-input100 validate-input"
							data-validate="Password is required">
							<span class="label-input100">주소</span> <span
								class="focus-input100"></span> <input class="mypageAddr" type="button" value="변경"
								id="mypageAddr"> <input class="input100"
								type="text" placeholder="우편번호" id="zonecode" name="zonecode"
								value="${juso[0]}">
							<div>
							<input type="text" size="35"
									placeholder="도로명주소 또는 지번주소" id="addr" name="addr" value="${juso[1]}">
							</div>
							<input type="text" placeholder="상세 주소를 입력하세요"
								id="detailAddr" name="detailAddr" value="${juso[2]}"> 
								<input class="input100" name="extraAddr" type="text" placeholder="동" id="extraAddr"
								value="${juso[3]}"> <span class="focus-input100"></span>
						<tr>
							<td><input type="button" id="ok_btn" value="확인"> 
							<input type="button" id="cancle_btn" value="취소">
							
						</tr>
						</p>
					</table>
				</form>





				​ <br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>​
			</div>
			​
			<div style="clear: both;"></div>
			​
			<p class="text-right legal-info">
				HAYERA 하예라 서울특별시 금천구 가산디지털2로 123 월드메르디앙벤처센터<br> 대표: 김영권 외 3명 /
				사업자등록번호: 111-11-11111 / 개인정보관리자: 지우빈 <br> 메일: admin@hayera.com
				/ Copyright &copy;2020 hayera
				<!-- end container -->
		</div>
		<!-- end main -->
		​
</body>


</html>