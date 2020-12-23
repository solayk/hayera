<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			/* KOSMO : 장바구니 CSS */
		    .table {
		        width: 750px;
		        text-align: center;
		    }
			.panel-body{
				float: right;
			}
			/* 여기까지 */
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
	<script type="text/javascript">
		// 숫자 3자리 단위로 콤마를 찍어주는 함수_ .formatNumber()로 사용.
		Number.prototype.formatNumber = function () {
        if (this == 0) return 0;
        let regex = /(^[+-]?\d+)(\d{3})/;
        let nstr = (this + '');
        while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
        return nstr;
      	};
      	
      	// 바로 결제하기 클릭 시
      	function clickGopay(){
			var id = '<%=(String)session.getAttribute("login")%>'
			if(id=='null'){
				location.href="login.do";
			}else{
	      		var form = document.goodsCountform;
	      		form.submit();
			}
      	}
      	// Jquery 시작
      	$(document).ready(function () {
      		// 장바구니 클릭하면 열려진 상태 유지하기. 다시 누르면 or 메인화면 다른 구역 클릭하면 닫히기
            $('li.dropdown a').on('click', function (event) {
              $(this).parent().toggleClass('open');
            });
            $('body').on('click', function (e) {
              if (!$('li.dropdown').is(e.target)
                && $('li.dropdown').has(e.target).length === 0
                && $('.open').has(e.target).length === 0
              ) {
                $('li.dropdown').removeClass('open');
              }
            });
		})
	</script>
      
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
							<a class="navbar-brand navbar-brand-logo" href="main.jsp">
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
				                <li class="dropdown">
				                  <a href="#" class="dropdown-toggle">
				                    <i class="pe-7s-shopbag">
				                      <span class="label">2</span>
				                    </i>
				                    <p>장바구니</p>
				                  </a>
				                  <ul class="dropdown-menu">
				                    <table class="main_cart">
				                      <th>선택</th>
				                      <th>이미지</th>
				                      <th>상품명</th>
				                      <th>수량</th>
				                      <th>가격</th>
				                      <th>합계</th>
				                      <th>삭제</th>
				                      <!-- ajax 활용한 동적 테이블 들어오는 자리. -->
				                    </table>
				                    <div class="panel panel-info">
				                      <div class="panel-heading">
				                        <h3 class="panel-title">총 결제금액</h3>
				                      </div>
				                      <div class="panel-body">
				                        (합산 기능 구현 필요) 원 &emsp;&emsp;
				                        <!-- 버튼에 결제창으로 가는 이벤트 부여 -->
				                        <button type="button" class="btn btn-primary" onclick="clickGopay()">바로 결제</button>
				                      </div>
				                    </div>
				                  </ul>
				                </li>
								<!-- 로그인 세션이 존재하지 않으면 -->
			                    <c:if test="${login eq null}">
			                      <li>
			                        <!-- 로그인 클릭 시 login.jsp로 이동. 로그인 화면이 팝업 형태인데 화면 전환이 조금 어색한 상태 -->
			                        <a href="login.do">
			                          <i class="pe-7s-user"></i>
			                          <p>로그인</p>
			                        </a>
			                      </li>
			                    </c:if>
			
			                    <!-- 로그인 세션이 존재하면 -->
			                    <c:if test="${login ne null}">
			                      <li class="dropdown">
			                        <a href="#" class="dropdown-toggle">
			                          <i class="pe-7s-user"></i>
			                          <p>내 계정 <b class="caret"></b></p>
			                        </a>
			                        <ul class="dropdown-menu">
			                          <!-- mainAfterLogin 에만 해당 -->
			                          <li><a href="mypage.do?customer_id=${sessionScope.login}">마이페이지</a></li>
			                          <li><a href="#">주문목록</a></li>
			                          <li><a href="logout.do">로그아웃</a></li>
			                        </ul>
			                      </li>
			                    </c:if>
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
		<div class="main">
			<div class="container tim-container category_main" style="max-width: 800px; padding-top: 20px">
				<br> <br> <br> <br> <br>
				<div class='detail_product'>
					<div class="detail_product-img">
						<img src="/aHayera/resources/upload/${productSelected.img_url }">
					</div>
					<div class="detail-product-list">
						<div class="detail_product-brand">${productSelected.brand }</div>
						<div class="detail-product-product_name">
							<h3>${productSelected.prod_name }</h3>
						</div>
						<div class="detail-product-volume_price">
							${productSelected.capacity }ml / 정가: <span class="detail-product-price">${productSelected.price}</span>원<br/>
							<span style="font-size: 20px; font-weight: bold;">할인가 :</span>
							<input type="text" value="${productSelected.discount_price}" name="discount_price" style="text-align: center; font-weight: bold; width:65px;" disabled>원
						</div>
						<br>
						<div>
							<form action="goOrderFromProductDetail.do?customer_id=${sessionScope.login}&prod_no=${productSelected.prod_no}" name="goodsCountform" method="post">
								<table class="detail-info-table">
									<tbody>​
										<tr class="detail-table-info">
											<th class="info__th"><span class="title">설명</span></th>
											<td class="info__td">
												
												<!-- DB 추가 필요 -->
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
													​ ​ <input id="spinner" type="text" value="1" name="goodsCount" />
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
							</form>
							<div>
								<input class='detail_button' type="button" value="장바구니 추가" onclick="addCart()"> 
								<input class='detail_button' type="button" value="바로 결제하기" onclick="clickGopay()">
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
							<a ><span id='reviewboard'>리뷰게시판</span></a>
						</div>
						<div>
							<a ><span id='qnaboard'>문의게시판</span></a>
						</div>
					</div>
					<br>
					<div style="clear: both;"></div>
					<article class="detail-boardmenu">
					<div class="detail-board-content">
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
						<c:forEach items="${reviewList }" var="review">
						<ul>
							<li class="detail-review-list">
								<div class="list-item">
									<div class="user">
										<div class="user-info">
											<p class="txt">
												<span class="reviewgogo">
														<span id="customer_id">${review.customer_id}</span>
														<span id='birthday'>${review.gender }</span>
														<span id='skintype'>· ${review.skintype }  </span>
														<span id='rate'> · <img src="/aHayera/images/star_${review.rate }.png"></span>
														<span style='float:right' id='writeday'>· ${review.writeday} 시간 전</span>
												</span>
											</p>
										</div>
									</div>
									<p class="review">${review.contents}</p>
								</div>
							</li>
						</ul>
						</c:forEach>
						</article>
						<article class="detail-boardmenu-qna">
						qna 시작
						</article>
						
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
		
		<script type="text/javascript">
		// 수량 변경
		function change(num){
			var x = $('#spinner').val();
			var y = Number(x)+num;
			
			if(x==1) $('#spinner').val(1);
			$('#spinner').val(y);
			// 수량에 1 이상만 들어올 수 있게
			if(y<1){
				alert("한 개 이상 가능합니다.");
				$("#spinner").val(1);
			}
		} // end of change(num)

		//qna게시판 눌렀을 때 qna로 
		$('#qnaboard').click(function() {
			$('.detail-boardmenu').hide();
			$('.detail-boardmenu-qna').show();
		
		});
		
		//review게시판 눌렀을 때 review로
		$('#reviewboard').click(function () {
			$('.detail-boardmenu-qna').hide();
			$('.detail-boardmenu').show();
		});
		
		//처음화면은 review
		 $(function() {
			$('.detail-boardmenu-qna').hide();
			
		}) 
		
		</script>
	</body>


	</html>