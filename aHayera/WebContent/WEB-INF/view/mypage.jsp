<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>




<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- 타이틀 바 -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/logo_only_transparent_small.png">
<title>하예라</title>

<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/hayera.css" rel="stylesheet" />
<!-- ↓ 장바구니 화살표 아이콘 -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css"
	rel="stylesheet">

<link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href="css/ct-navbar.css" rel="stylesheet" />

<!-- <!-- 검색 autocomplete 목적-->
<link href="autocomplete/jquery-ui.min.css" rel="stylesheet" />
<link href="autocomplete/jquery-ui.structure.min.css" rel="stylesheet" />
<link href="autocomplete/jquery-ui.theme.min.css" rel="stylesheet" />
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
검색 autocomplete 목적
<script src="autocomplete/jquery-ui.min.js"></script> -->

<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/ct-navbar.js"></script>

<!-- 하예라 전용 JS Files   -->
<script src="./js/hayera.js"></script>

<!--     Font Awesome     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
<script
	src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>



<!-- Optional - Adds useful class to manipulate icon font display -->
<link rel="stylesheet" href="css/pe-icon-7-stroke_helper.css">

<!-- 주소찾기 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- mypage 절대 경로 -->
<script src="js/mypageAddr.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="css/mypage_util.css">
<link rel="stylesheet" type="text/css" href="css/mypage_modify.css">



<style>

/* a태그 기본 style 유지 */
a {
	color: inherit;
	text-decoration: none;
}

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

/* KOSMO : 장바구니 CSS */
.table {
	width: 750px;
	text-align: center;
}

.panel-body {
	float: right;
}

/* 검색창 */
.navbar-search-form fieldset {
	position: relative;
	display: inline-block;
	padding: 0 0 0 40px;
	background: #fff;
	border: none;
	border-radius: 5px;
}

#search, #searchBtn {
	position: relative;
	width: 300px;
	padding: 0;
	display: inline-block;
	float: left;
}

#search {
	color: #666;
	z-index: 2;
	border: 0 none;
	height: 51px;
}

#search:focus {
	outline: 0 none;
}

#search:focus+#searchBtn {
	-webkit-transform: translate(0, 0);
	-ms-transform: translate(0, 0);
	transform: translate(0, 0);
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
}

#search:focus+#searchBtn .fa {
	-webkit-transform: translate(0px, 0);
	-ms-transform: translate(0px, 0);
	transform: translate(0px, 0);
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	color: #fff;
}

#searchBtn {
	z-index: 1;
	width: 50px;
	border: 0 none;
	height: 50px;
	background: #084A83;
	cursor: pointer;
	border-radius: 0 5px 5px 0;
	-webkit-transform: translate(-50px, 0);
	-ms-transform: translate(-50px, 0);
	transform: translate(-50px, 0);
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
}

.fa-search {
	font-size: 1.4rem;
	color: #084A83;
	z-index: 3;
	top: 25%;
	-webkit-transform: translate(-190px, 0);
	-ms-transform: translate(-290px, 0);
	transform: translate(-290px, 0);
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

#ui-id-1 {
	list-style: none;
	width: 390px;
}

.ui-autocomplete {
	position: absolute;
	cursor: default;
	background: white;
	border-color: white;
}

/* workarounds */
html .ui-autocomplete {
	width: 1px;
}

/* without this, the menu expands to 100% in IE6 */
.ui-menu {
	list-style: none;
	padding: 2px;
	margin: 0;
	display: block;
	float: left;
}

.ui-menu .ui-menu {
	margin-top: -3px;
}

.ui-menu .ui-menu-item {
	margin: 0;
	padding: 0;
	zoom: 1;
	float: left;
	clear: left;
	width: 100%;
}

.ui-menu .ui-menu-item a {
	text-decoration: none;
	display: block;
	padding: .2em .4em;
	line-height: 1.5;
	zoom: 1;
}

.ui-menu .ui-menu-item a.ui-state-hover, .ui-menu .ui-menu-item a.ui-state-active
	{
	font-weight: normal;
	margin: -1px;
}

/* 검색 이미지 표기 */
.ui-menu img {
	width: 40px;
	height: 40px;
}

.ui-menu li span {
	/* 자동완성 목록 양식 설정 */
	font-size: 1em;
	padding: 0 0 10px 10px;
	margin: 0 0 10px 0 !important;
	white-space: nowrap;
}

.spanBrand {
	/* 자동완성 목록 내 브랜드 */
	color: #BFBFBF;
}

.liSelected>div {
	color: #084A83;
	font-size: 16px;
	text-decoration: underline;
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

​

 .mypageAddr {
	background: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}

​


  .cartEachQty {
	/* 장바구니 수량 칸 너비 */
	padding-left: 10px;
	padding-right: 10px;
}



.label-input100{
  font-family: '레시피코리아';
}

​
</style>

<script type="text/javascript">
	$(function() {


		

		$('.canclebtn').click(function() {

			//alert('ok');
			$('.costomer').css('top', '-500px');
		});

		$('#ok_btn').click(function() {
			alert('수정되었습니다.')

			$('#frm').submit();
		});

		$('#pop_btn').click(
				function() {

					window.open('POP_changePw.do', "popupNo1",
							'left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-430)/2+', width=660px,height=800px',
							"scrollbars=no");

				})

				


				
				
		$('.pe-7s-wallet').click(function() {

			location.href = "orderHistory.do";

		})

	})

	//장바구니 아이콘 결제 팝업

      $(document).ready(function () {

        // 세션 아이디 변수 sessionId에 저장
        var sessionId = '<%=session.getAttribute("login")%>';

        if (sessionId == '' || sessionId == 'null') { /* 세션이 만료되면 main.jsp로 이동 */
          alert("로그인 시간을 초과했습니다. 다시 로그인 해주세요.");
          location.href = "main.jsp";
        }

        $('.viewFilteredProduct').parent('div').hide();

        refreshCart(); // 장바구니 가져오기 (반복 부분에 이 함수 사용)

        // 장바구니 #countUp 버튼
        $(document).on('click', '#countUp', function () {

          var qty = $(this).parent().parent('tr').find('.cartEachQty');

          qty.text(parseInt(qty.text()) + 1);

          var info = {
            prod_no: $(this).parent().parent('tr').find('td:nth-child(1)').text(),
            each_qty: qty.text()
          }

          $.ajax({
            type: 'post',
            data: info,
            url: 'editCart.do',
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            success: function () {
              refreshCart(); // 장바구니 다시 가져오기
            },
            error: function (err) {
              console.log(err);
            }
          }); // --- end of $.ajax 장바구니 #countUp 버튼
        }); // --- end of 장바구니 #countUp 버튼

        $(document).on('click', '#countDown', function () {

          var qty = $(this).parent().parent('tr').find('.cartEachQty');

          if (qty.text() == 1) {
            alert("최소 수량은 1개입니다.");
          }
          else {
            qty.text(parseInt(qty.text()) - 1);

            var info = {
              prod_no: $(this).parent().parent('tr').find('td:nth-child(1)').text(),
              each_qty: qty.text()
            }

            $.ajax({
              type: 'post',
              data: info,
              url: 'editCart.do',
              dataType: 'json',
              contentType: 'application/x-www-form-urlencoded;charset=utf-8',
              success: function () {
                refreshCart(); // 장바구니 다시 가져오기
              },
              error: function (err) {
                console.log(err);
              }
            }); // --- end of $.ajax 장바구니 #countDown 버튼
          }
        }); // --- end of 장바구니 #countDown 버튼

        $(document).on('click', '#cartRemove', function () {

          var info = {
            prod_no: $(this).parent().parent('tr').find('td:nth-child(1)').text(),
            remove: 'yes'
          }

          $.ajax({
            type: 'post',
            data: info,
            url: 'editCart.do',
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            success: function () {
              refreshCart(); // 장바구니 다시 가져오기
            },
            error: function (err) {
              console.log(err);
            }
          }); // --- end of $.ajax 장바구니 #cartRemove 버튼
        }); // --- end of 장바구니 #cartRemove 버튼

        var dataList; // 검색을 위해 전역변수 선언

        // 전체상품목록
        $.ajax({
          url: 'viewAllProduct.do',
          dataType: 'json',
          contentType: 'application/x-www-form-urlencoded;charset=utf-8',
          async: false, // 검색을 위해 전역변수에 저장하기 위하여 비동기 방식 수행
          success: function (data) {

            // 상품목록 배열 처리
            for (i = 0; i < data.length; i++) {

              var rating = parseFloat(data[i].avg_rating).toFixed(1); /* 별점 0.5 단위 표기, 사실 rating 으로 소수점 첫째자리까지 반올림은 필요 없긴 함 */
              var star = starRating(rating);
              var discount = parseInt(((data[i].price - data[i].discount_price) / data[i].price) * 100);
              if (data[i].discount_price == '0') var mlprice = parseInt(data[i].price / data[i].capacity);
              else var mlprice = parseInt(data[i].discount_price / data[i].capacity);

              productListing(".viewAllProduct", data, star, discount, mlprice);

              data[i].value = data[i].prod_name; // 검색 자동완성 인식을 위해 JSON 데이터 추가
            }

            dataList = data; // 검색을 위한 데이터 저장
          },
          error: function (e) {
            alert(e);
          }
        }); // --- end of $.ajax 전체상품목록

        // 누적 판매 베스트 4
        $.ajax({
          type: 'post',
          url: 'viewTopFourSalesdProduct.do',
          dataType: 'json',
          contentType: 'application/x-www-form-urlencoded;charset=utf-8',
          success: function (data) {
            for (i = 0; i < data.length; i++) {

              var rating = parseFloat(data[i].avg_rating).toFixed(1); /* 별점 0.5 단위 표기, 사실 rating 으로 소수점 첫째자리까지 반올림은 필요 없긴 함 */
              var star = starRating(rating);
              var discount = parseInt(((data[i].price - data[i].discount_price) / data[i].price) * 100);
              if (data[i].discount_price == '0') var mlprice = parseInt(data[i].price / data[i].capacity);
              else var mlprice = parseInt(data[i].discount_price / data[i].capacity);

              productListing(".viewTopFour", data, star, discount, mlprice);
            }
          },
          error: function (err) {
            console.log(err);
          }
        });

        // No.1 salesed Item
        $.ajax({
          type: 'post',
          url: 'viewTopSalesedItem.do',
          dataType: 'json',
          contentType: 'application/x-www-form-urlencoded;charset=utf-8',
          success: function (data) {
            for (i = 0; i < data.length; i++) {

              var rating = parseFloat(data[i].avg_rating).toFixed(1); /* 별점 0.5 단위 표기, 사실 rating 으로 소수점 첫째자리까지 반올림은 필요 없긴 함 */
              var star = starRating(rating);
              var discount = parseInt(((data[i].price - data[i].discount_price) / data[i].price) * 100);
              if (data[i].discount_price == '0') var mlprice = parseInt(data[i].price / data[i].capacity);
              else var mlprice = parseInt(data[i].discount_price / data[i].capacity);

              productListing(".viewTopSalesedItem", data, star, discount, mlprice);
            }
          },
          error: function (err) {
            console.log(err);
          }
        });

        // 검색 자동완성
        $("#search").autocomplete({
          source: dataList,
          minLength: 1,
          select: function (event, ui) {
            /* 클릭시 페이지 이동*/
            var url = ui.item.prod_no;
            if (url != '') {
              location.href = 'productSelected.do?prod_no=' + url + '';
            }
          },
          html: true,
          open: function (event, ui) {
            $(".ui-autocomplete").css("z-index", 1000);
          },
          position: { my: "center top", at: "center bottom" }
        })

          .autocomplete("instance")._renderItem = function (ul, item) {
            return $('<li><div><img src="/aHayera/resources/upload/' + item.img_url + '"><span>' + item.value + '</span><span class="spanBrand">' + item.brand + '</span></div></li>').appendTo(ul);
          };

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

        // 필터 평균평점 클릭 시 클래스 추가
        $('.filter-review > li').click(function () {
          $('.filter-review > li').removeClass('liSelected');
          $(this).addClass('liSelected');
        });

        // 필터 ajax
        $('.filter-window').on('click', function () {

          var avg_rating = 0;
          var feel = "";
          var scent = "";

          avg_rating = $('.liSelected > div > label').text();

          var arr_feel = [];
          if ($('#water').is(":checked")) arr_feel.push($('#water').val());
          if ($('#soft').is(":checked")) arr_feel.push($('#soft').val());
          if ($('#mat').is(":checked")) arr_feel.push($('#mat').val());
          if ($('#hard').is(":checked")) arr_feel.push($('#hard').val());

          var arr_scent = [];
          if ($('#no').is(":checked")) arr_scent.push($('#no').val());
          if ($('#flower').is(":checked")) arr_scent.push($('#flower').val());
          if ($('#oe').is(":checked")) arr_scent.push($('#oe').val());
          if ($('#chem').is(":checked")) arr_scent.push($('#chem').val());

          for (var i = 0; i < arr_feel.length; i++) {
            if (i != arr_feel.length - 1) feel += arr_feel[i] + "|";
            else feel += arr_feel[i];
          }

          for (var i = 0; i < arr_scent.length; i++) {
            if (i != arr_scent.length - 1) scent += arr_scent[i] + "|";
            else scent += arr_scent[i];
          }

          var info = {
            avg_rating: avg_rating,
            feel: feel,
            scent: scent
          }

          $.ajax({
            type: 'post',
            data: info,
            url: 'viewFilteredProduct.do?category=',
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            async: false, // 검색을 위해 전역변수에 저장하기 위하여 비동기 방식 수행
            success: function (data) {

              console.log("길이: " + data.length);

              $('.viewFilteredProduct').empty();

              // 상품목록 배열 처리
              for (i = 0; i < data.length; i++) {

                console.log("체크: " + data[i].prod_no);

                var rating = parseFloat(data[i].avg_rating).toFixed(1);
                var star = starRating(rating);
                var discount = parseInt(((data[i].price - data[i].discount_price) / data[i].price) * 100);
                if (data[i].discount_price == '0') var mlprice = parseInt(data[i].price / data[i].capacity);
                else var mlprice = parseInt(data[i].discount_price / data[i].capacity);

                $('.viewFilteredProduct').append(
                  '<li style="margin:2px;">' + '<a href="productSelected.do?prod_no=' + data[i].prod_no + '">'
                  + '<div class="item-img" style="position:relative;">'
                  + (data[i].discount_price == '0' ? '' : '<div style="position:absolute; float:left; width:50px; height:48px; text-align:center; background-color:#084A83; color:white; padding-top:2px;">SAVE<br><span style="font-size:22px; line-height:90%;">' + discount + '</span>%</div>')
                  + '<img src="/aHayera/resources/upload/' + data[i].img_url + '"></div>'
                  + '<div class="item-brand">' + data[i].brand + '</div>'
                  + '<div class="item-info" style="width:220px; height:160px;"><div class="item-title">' + data[i].prod_name + '</div></a>'
                  + '<div class="item-reviewno"><img src="./images/star_' + star + '.png"> ' + data[i].avg_rating + '</div>'
                  + (data[i].discount_price == '0' ? /* 할인 여부에 따라 가격 표시 다르게 */
                    '<span class="item-price">' + data[i].price.formatNumber() + '원</span>'
                    : '<span class="item-discount_price">' + data[i].discount_price.formatNumber() + '원 </span><span class="item-price" style="color:#BFBFBF; font-size: 15px;"><del>' + data[i].price.formatNumber() + '원</del></span>')
                  + '<div class="item-capacity">' + data[i].capacity + ' ml, ml당 ' + mlprice + ' 원</div>'
                  + '</li>'
                )

              }

              $('.viewFilteredProduct').parent('div').show();
              $('.viewTopFour').parent('div').hide();
              $('.viewTopSalesedItem').parent('div').hide();
              $('.viewAllProduct').parent('div').hide();

            },
            error: function (e) {
              alert(e);
            }
          }); // --- end of $.ajax 필터

        }); // --- end of 필터 ajax

      }); // --- end of jquery document ready

      // 장바구니 내 바로결제 버튼 클릭 시 --> 주문결제 페이지로 이동
      function clickGoFromCart() {
        window.location.href = "orderFromCart.do";
      }

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
							<li><a href="category.do?category=모이스처라이저"> <i
									class="pe-7s-drop"> </i>
									<p>모이스처라이저</p>
							</a></li>
							<li><a href="category.do?category=선크림"> <i
									class="pe-7s-sun"> </i>
									<p>선크림</p>
							</a></li>
						</ul>
						​
						<ul class="nav navbar-nav navbar-right">

							<!-- KOSMO : NAVBAR에 카테고리 추가 시 사용 -->
							<li class="dropdown"><a href="#" class="dropdown-toggle">
									<i class="pe-7s-shopbag" id="cartSizeIcon"> <span
										class="label" id="cartSize"></span>
								</i>
									<p>장바구니</p>
							</a>
								<ul class="dropdown-menu">
									<table class="main_cart">
										<!-- 장바구니 동적 테이블 자리 -->
									</table>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">총 결제금액</h3>
										</div>
										<div class="panel-body">
											<span id="cartSumPrice"></span> 원 &emsp;&emsp;
											<!-- 버튼에 결제창으로 가는 이벤트 부여 -->
											<button type="button" class="btn btn-primary"
												onclick="clickGoFromCart()">바로 결제</button>
										</div>
									</div>
								</ul></li>

							<li class="dropdown">
								<!-- mainAfterLogin 에만 해당 --> <a href="#"
								class="dropdown-toggle"> <i class="pe-7s-user"></i>
									<p>
										내 계정 <b class="caret"></b>
									</p>
							</a>
								<ul class="dropdown-menu">

									<%--   <li><a href="mypage.do?customer_id=${sessionScope.login}">마이페이지</a></li> --%>
									<li><a href="orderHistory.do">주문 내역</a></li>
									<li><a href="logout.do">로그아웃</a></li>
								</ul>
							</li>
						</ul>

					</div>
					<!-- /.navbar-collapse -->

					<!-- 검색 -->
					<form action="searchResult.do"
						class="navbar-form navbar-right navbar-search-form" role="search"
						method="get">
						<div class="form-group">
							<fieldset>
								<input type="search" id="search" name="search"
									placeholder="검색하기">
								<button type="submit" id="searchBtn">
									<i class="fa fa-search"> </i>
								</button>
							</fieldset>
						</div>
						<br>
					</form>

				</div>
				<!-- /.container-fluid -->

			</nav>

			<div class="blurred-container">
				<div class="img-src"
					style="background-image: url('images/main_background_top.png')"></div>
			</div>
		</div>
		<!--  end navbar -->

	</div>
	<!-- end menu-dropdown -->

	​
	<div class="main">
		<div class="container tim-container category_main"
			style="max-width: 800px; padding-top: 20px">
			<br> <br> <br> <br>


			<form id="frm" method="get" action="updateMypage.do">
				<table>
					<p class="costomer">​
					<div class="wrap-input100 validate-input wcustomer_id"
						data-validate="Repeat Password is required">
						<span class="label-input100">아이디</span> <input class="input100"
							type="text" name="customer_id" type="text"
							value="${result.customer_id}" readonly> <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input wname"
						data-validate="Name is required">
						<span class="label-input100">이름</span> <input class="input100"
							type="text" name= "name"  type="text" value="${result.name}"
							readonly> <span class="focus-input100"></span>
					</div>


					<div class="wrap-input100 validate-input wpop_btn"
						data-validate="Password is required">
						<span class="label-input100">비밀번호</span> <span
							class="focus-input100"></span> <input type="button" name="pop_btn" id="pop_btn"
							value="변경">
						<!-- 비밀번호 변경 팝업창 -->
						<span class="focus-input100"></span>
					</div>


					<div class="wrap-input100 validate-input wtel"
						data-validate="Username is required">
						<span class="label-input100">전화번호</span> <input class="input100"
							type="text" name="tel" value='${result.tel}'> <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input wemail"
						data-validate="Valid email is required: ex@abc.xyz">
						<span class="label-input100">Email</span>
						<%-- <input class="input100" type="text" name="email"  value='${result.email}'> --%>
						<input class="input100" type="text" name="email"
							value="${result.email}"> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input edirAddress"
						data-validate="Password is required">
						<span class="label-input100">배송주소</span> <span
							class="focus-input100"></span> <input class="mypageAddr"
							type="button" value="변경" id="mypageAddr"><br> <input
							type="text" placeholder="우편번호" id="zonecode" name="zonecode"
							value="${juso[0]}">

						<div>

							<input type="text" size="35" placeholder="기본주소" id="addr"
								name="addr" value="${juso[1]}">
						</div>
						<div>
							<input placeholder="동" id="extraAddr" name="extraAddr"
								type="text" value="${juso[3]}">
						</div>
						<div>
							<input type="text" placeholder="나머지주소" id="detailAddr"
								name="detailAddr" value="${juso[2]}">
						</div>

						<tr>
							<td><input type="button" id="ok_btn" value="확인"> <input
								type="button" id="cancle_btn" value="취소"></td>
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
			사업자등록번호: 111-11-11111 / 개인정보관리자: 지우빈 <br> 메일: admin@hayera.com /
			Copyright &copy;2020 hayera
			<!-- end container -->
	</div>
	<!-- end main -->
</body>


</html>