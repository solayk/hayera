<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
	<link href="css/ct-navbar.css" rel="stylesheet" />
	<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
	 <script src="js/bootstrap.js" type="text/javascript"></script>
	<script src="js/ct-navbar.js"></script>
	<!--     Font Awesome     -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
	<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">
	<style>
			.fa-heart {
				color: #F74933;
			}

			​ .space-100 {
				height: 100px;
				display: block;
			}

			​ .prettyprint {
				background-color: #ffffff;
				border: 1px solid #999;
				margin-top: 20px;
				padding: 20px;
				text-align: left;
			}

			​ .atv,
			.str {
				color: #05AE0E;
			}

			​ .tag,
			.pln,
			.kwd {
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
			
			.detail-radio-filter{
				list-style: none;
				float:right;
			}
			.detail-filter{
				float:left;
				display: list-item;
			}
			.detail_button{
				background-color: #084A83;
				width:200px;
				height: 50px;
				font-size: 17px;
				color: white;
			}
			.detail-board-list a{
				cursor: pointer;
			}
		</style>

	<title>상세페이지</title>
	</head>

	<body>
		<div id="navbar-full">
			<div id="navbar">
				<!--    
        navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange  
        -->
				​
				<nav class="navbar navbar-ct-blue navbar-fixed-top" role="navigation">
					<div class="container">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
									class="icon-bar"></span> <span class="icon-bar"></span>
							</button>
							<a class="navbar-brand navbar-brand-logo" href="http://www.creative-tim.com">
								<div class="logo">
									<img src="./images/logo_only_transparent_small.png">
								</div>
								<div class="brand">HAYERA</div>
							</a>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
								<li><a href="#"> <i class="pe-7s-shopbag"> <span class="label">2</span>
										</i>
										<p>장바구니</p>
									</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i
											class="pe-7s-user"></i>
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
									</ul>
								</li>
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
		​ ​
		<div class="main">
			<div class="container tim-container category_main" style="max-width: 800px; padding-top: 20px">
				<br> <br> <br> <br> <br>
				<div class='detail_product'>
					<div class="detail_product-img">
						<img src="./images/product/1.jpg">
					</div>
					<div class="detail-product-list">
						<div class="detail_product-brand">이니스프리 (innisfree)</div>
						<div class="detail-product-product_name">
							<h3>그린티 씨드 에센스 인 로션</h3>
						</div>
						<div class="detail-product-volume_price">
							100ml / <span class="detail-product-price">20,000</span>원
						</div>
						<br>
						<div>
							<table class="detail-info-table">
								<tbody>​
									<tr class="detail-table-info">
										<th class="info__th"><span class="title">설명</span></th>
										<td class="info__td">
											<div class="info__description">
												뷰티 그린티의 풍부한 수분감이 오랜시간 지속되는 이중 수분잠금막 에센스인로션<br> <br>-
												에센스와 로션의 농축된 영양감을 전달하여 촉촉한 피부 선사<br>- 초밀착 밀크텍스처로 이중 수분
												잠금효과 선사 <br>- 에센스의 긴 수분 지속력과 로션의 부드러운 발림의 에센스로션
											</div>
										</td>
									</tr>​
									<tr class="detail-table-count">
										<th class="info__th"><span class="title">수량</span></th>
										<td class="info__td">
											<div class="countcheck">
												​ ​ <input id="spinner" type="text" value="1" />
												<button type="button" id='countup' class="btn btn-primary btn-xs" onclick="change(1)">
                          					  	<span class="glyphicon glyphicon-chevron-up"></span>
                         						 </button>
                          						<button type="button" id='countdown' class="btn btn-primary btn-xs" onclick="change(-1)">
                           						<span class="glyphicon glyphicon-chevron-down"></span>
                          						</button>
												​
											</div>
										</td>
									</tr>
									<!---->
								</tbody>
							</table>
							<div>
								<input class='detail_button' id='gokeep' type="button" value="장바구니 추가"> 
								<input class='detail_button' id='goorder' type="button" value="바로 결제하기">
							</div>
							
						</div>

					</div>

				</div>
				<!-- end of detail-product -->
				<br> ​
				<div style="clear: both;"></div>
				<br> <br> <br>
				<div class='detail-board'>
					<div class='detail-board-list'>
						<div>
							<a data-url="boardfiles/reviewboard.jsp"><span>리뷰게시판</span></a>
						</div>
						<div>
							<a data-url="boardfiles/qnaboard.jsp"><span>문의게시판</span></a>
						</div>
					</div>
					<br>
					<div style="clear: both;"></div>
					<article class="detail-boardmenu">
					<div class="detail-board-content">
						<input type="button" value="리뷰 작성하기" id="writereview">
						
						<div class="detail-review-filter">
							<ul class="detail-radio-filter" role="radiogroup">
								<li class="detail-filter" role="presentation">
									<a href="" class="detail-filter:highsale" role="radio" aria-checked="true">최신순 /</a></li>
								<li class="detail-filter" role="presentation">
									<a href="" class="detail-filter:highreview" role="radio" aria-checked="false">평점 높은순 /</a></li>
								<li class="detail-filter" role="presentation">
									<a href="" class="detail-filter:lowreview" role="radio" aria-checked="false">평점 낮은순</a></li>
							</ul>
						</div>
						<div style="clear: both;"></div>
						</div>
						
						<ul>
							<li class="detail-review-list">
								<div class="list-item">
									<div class="user">
										<div class="user-info">
											<p class="txt">
												<span class="name"><span class="user-name">로니카</span>
												</span> <span class="info"><span class="txt">30세
														· 복합성 </span> </span>
											</p>
										</div>
									</div>
									<p class="review">순하고 좋은거 같아요 몸에도 바르는데 촉촉하고 무향인게 맘에듭니다</p>
								</div>
							</li>
						</ul>
						<div id="reviewgo"></div>
						</article>
						​ </div>​
					</div>
					​ ​
				</div>
				​ ​ <br /> <br /> ​
				<p class="text-right legal-info">
					HAYERA 하예라 서울특별시 금천구 가산디지털2로 123 월드메르디앙벤처센터<br> 대표: 김영권 외 3명 /
					사업자등록번호: 111-11-11111 / 개인정보관리자: 지우빈 <br> 메일: admin@hayera.com
					/ Copyright &copy;2020 hayera
			</div>
			<!-- end container -->
		</div>
		<!-- end main -->
		
		<!-- 수량 확인 -->
		<% String customer_id = (String)session.getAttribute("login"); %>
		<script type="text/javascript">
		function change(num){
			
			var x = $('#spinner').val();
			var y = Number(x)+num;
			
			if(x==1 & num<0) {
				$('#spinner').val('1');}
			else{$('#spinner').val(y);}
		}
		
		//게시판 눌렀을 때 ajax로 변환
		$('.detail-board-list a').click(function() {
			var liurl = $(this).attr('data-url');
	
			$.ajax({
				type :'get',
				url : liurl,
        		contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
				success : function(data){
					$('.detail-boardmenu').html(data);
				},
				err: function(err){console.log(err)}
			});
		
		})
		
		//리뷰 작성하기 누르면 작성할 수 있는 textarea나오기 + 로그인여부확인
		$('#writereview').click(function(){
			
			$.ajax({
				
				url :"boardfiles/writereview.jsp",
				contentType:'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
				success : function(data){
					if(customer_id!=null){
						alert("성공");
					$('#reviewgo').html(data);
					}
					else{
						alert("실패")
					}
				},
				err: function(err){console.log(err)}
				
			})
			
			
		})
		

		</script>
		
	</body>


	</html>