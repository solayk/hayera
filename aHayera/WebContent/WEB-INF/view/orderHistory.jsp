<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAYERA!</title>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
  <script src="js/bootstrap.js" type="text/javascript"></script>
  <script src="js/orderHistoryScripts.js" type="text/javascript"></script>
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
  
  <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
  <link href="css/ct-navbar.css" rel="stylesheet" />
  <script src="js/ct-navbar.js"></script>

  <!--     Font Awesome     -->
  <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
  <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
    
  <script type="text/javascript">
  	  // 숫자 3자리 단위로 콤마를 찍어주는 함수_ .formatNumber()로 사용.
	  Number.prototype.formatNumber = function () {
      if (this == 0) return 0;
      let regex = /(^[+-]?\d+)(\d{3})/;
      let nstr = (this + '');
      while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
      return nstr;
      };
      //Jquery 시작
      $(document).ready(function(){
    	  // 스크롤
    	  $(window).scroll(function(){
              $('#orderHistory').css('top', $(document).scrollTop());
          });
    	// 장바구니에 DB 상품 넣기 (동적테이블. 지금은 탑5 불러와서 채워넣은거..구현의도아님.)
        $.ajax({
          type: 'post',
          url: 'viewTopfiveSalesdProduct.do',
          dataType: 'json',
          contentType: 'application/x-www-form-urlencoded;charset=utf-8',
          success: function (data) {
            for (i = 0; i < data.length; i++) {
              $(".main_cart").append(
                '<tr>' + '<td>' + '<div class="checkbox">' + '<label>' + '<input type="checkbox" value="option' + (i + 1) + '" checked>' + (i + 1) + '</label>' + '</div>' + '</td>'
                + '<td>' + '<img src="/aHayera/resources/upload/' + data[i].img_url + '" width="55" height="55">' + '</td>'
                + '<td>' + '<a href="#">' + data[i].prod_name + '</a>' + '</td>'
                + '<td>' + "수량(구현필요)" + '<button type="button" class="btn btn-primary btn-xs" id="countUp">'
                + '<span class="glyphicon glyphicon-chevron-up"></span>' + '</button>'
                + '<button type="button" class="btn btn-primary btn-xs" id="countUp">'
                + '<span class="glyphicon glyphicon-chevron-down"></span>' + '</button>' + '</td>'
                + '<td>' + data[i].discount_price.formatNumber() + '원</td>'
                + '<td>' + data[i].price.formatNumber() + '원</td>'
                + '<td>' + '<button type="button" class="btn btn-danger btn-xs">'
                + '<span class="glyphicon glyphicon-remove"></span>'
                + '</button>' + '</td>'
                + '</tr>'
              )
            }
          },
          error: function (err) {
            console.log(err);
          }
        });

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
        // 주문한 상품들의 정보 받아 오기 (페이지 로딩 시 기본 3개월)
        <c:forEach items="${orderHistory}" var="history">
        var p =${history.payment_price};
        var payment_price = p.formatNumber();
        	$("#orderHistoryTable").append(
        		'<tr>'+
	        	'<td>'+'<p>'+'${history.order_date}'+'</p>'+'['+'${history.order_no}'+']'+'</td>'+
	        	'<td>'+'<img src="resources/upload/${history.img_url}" width="80" height="80">'+'</td>'+
	        	'<td>'+'<a href="productSelected.do?prod_no='+'${history.prod_no}'+'">'+'${history.prod_name}'+'</a>'+'</td>'+
	        	'<td>'+'${history.each_qty}'+'</td>'+
	        	'<td>'+payment_price+'원'+'</td>'+
	        	'<td>'+'${history.delivery_status}'+'</td>'+
	        	'<td>'+'<input type="button" class="btn btn-default" value="리뷰 쓰기" id="writeReview">'+'</td>'+
	        	'</tr>'
	        );
		</c:forEach>
		// 오늘 클릭 시
		$("#today").click(function () {
			$.ajax({
				type : 'post',
				url : 'orderHistoryViewToday.do',
				dataType : 'json',
				contentType: 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){
					$("#orderHistoryTable").find("tr:gt(0)").remove();
					for(i=0 ; i < data.length ; i++){
						var payment_price = data[i].payment_price.formatNumber();
						$("#orderHistoryTable").append(
						'<tr>'+
			        	'<td>'+'<p>'+data[i].order_date+'</p>'+'['+data[i].order_no+']'+'</td>'+
			        	'<td>'+'<img src="resources/upload/'+data[i].img_url+'" width="80" height="80">'+'</td>'+
			        	'<td>'+'<a href="productSelected.do?prod_no='+data[i].prod_no+'">'+data[i].prod_name+'</a>'+'</td>'+
			        	'<td>'+data[i].each_qty+'</td>'+
			        	'<td>'+payment_price+'원'+'</td>'+
			        	'<td>'+data[i].delivery_status+'</td>'+
			        	'<td>'+'<input type="button" class="btn btn-default" value="리뷰 쓰기" id="writeReview">'+'</td>'+
			        	'</tr>'		
						)
					};
				},
				error : function (err) {
					console.log(err);				
				}
			})
		});
		// 1주일 클릭 시
		$("#1week").click(function () {
			$.ajax({
				type : 'post',
				url : 'orderHistoryView1week.do',
				dataType : 'json',
				contentType: 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){
					$("#orderHistoryTable").find("tr:gt(0)").remove();
					for(i=0 ; i < data.length ; i++){
						var payment_price = data[i].payment_price.formatNumber();
						$("#orderHistoryTable").append(
						'<tr>'+
			        	'<td>'+'<p>'+data[i].order_date+'</p>'+'['+data[i].order_no+']'+'</td>'+
			        	'<td>'+'<img src="resources/upload/'+data[i].img_url+'" width="80" height="80">'+'</td>'+
			        	'<td>'+'<a href="productSelected.do?prod_no='+data[i].prod_no+'">'+data[i].prod_name+'</a>'+'</td>'+
			        	'<td>'+data[i].each_qty+'</td>'+
			        	'<td>'+payment_price+'원'+'</td>'+
			        	'<td>'+data[i].delivery_status+'</td>'+
			        	'<td>'+'<input type="button" class="btn btn-default" value="리뷰 쓰기" id="writeReview">'+'</td>'+
			        	'</tr>'		
						)
					};
				},
				error : function (err) {
					console.log(err);				
				}
			})
		});
		// 1개월 클릭 시
		$("#1month").click(function () {
			$.ajax({
				type : 'post',
				url : 'orderHistoryView1month.do',
				dataType : 'json',
				contentType: 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){
					$("#orderHistoryTable").find("tr:gt(0)").remove();
					for(i=0 ; i < data.length ; i++){
						var payment_price = data[i].payment_price.formatNumber();
						$("#orderHistoryTable").append(
						'<tr>'+
			        	'<td>'+'<p>'+data[i].order_date+'</p>'+'['+data[i].order_no+']'+'</td>'+
			        	'<td>'+'<img src="resources/upload/'+data[i].img_url+'" width="80" height="80">'+'</td>'+
			        	'<td>'+'<a href="productSelected.do?prod_no='+data[i].prod_no+'">'+data[i].prod_name+'</a>'+'</td>'+
			        	'<td>'+data[i].each_qty+'</td>'+
			        	'<td>'+payment_price+'원'+'</td>'+
			        	'<td>'+data[i].delivery_status+'</td>'+
			        	'<td>'+'<input type="button" class="btn btn-default" value="리뷰 쓰기" id="writeReview">'+'</td>'+
			        	'</tr>'		
						)
					};
				},
				error : function (err) {
					console.log(err);				
				}
			})
		});
		// 3개월 클릭 시
		$("#3month").click(function () {
			$.ajax({
				type : 'post',
				url : 'orderHistoryViewDefault.do',
				dataType : 'json',
				contentType: 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){
					$("#orderHistoryTable").find("tr:gt(0)").remove();
					for(i=0 ; i < data.length ; i++){
						var payment_price = data[i].payment_price.formatNumber();
						$("#orderHistoryTable").append(
						'<tr>'+
			        	'<td>'+'<p>'+data[i].order_date+'</p>'+'['+data[i].order_no+']'+'</td>'+
			        	'<td>'+'<img src="resources/upload/'+data[i].img_url+'" width="80" height="80">'+'</td>'+
			        	'<td>'+'<a href="productSelected.do?prod_no='+data[i].prod_no+'">'+data[i].prod_name+'</a>'+'</td>'+
			        	'<td>'+data[i].each_qty+'</td>'+
			        	'<td>'+payment_price+'원'+'</td>'+
			        	'<td>'+data[i].delivery_status+'</td>'+
			        	'<td>'+'<input type="button" class="btn btn-default" value="리뷰 쓰기" id="writeReview">'+'</td>'+
			        	'</tr>'		
						)
					};
				},
				error : function (err) {
					console.log(err);				
				}
			})
		});
		// 6개월 클릭 시
		$("#6month").click(function () {
			$.ajax({
				type : 'post',
				url : 'orderHistoryView6months.do',
				dataType : 'json',
				contentType: 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){
					$("#orderHistoryTable").find("tr:gt(0)").remove();
					for(i=0 ; i < data.length ; i++){
						var payment_price = data[i].payment_price.formatNumber();
						$("#orderHistoryTable").append(
						'<tr>'+
			        	'<td>'+'<p>'+data[i].order_date+'</p>'+'['+data[i].order_no+']'+'</td>'+
			        	'<td>'+'<img src="resources/upload/'+data[i].img_url+'" width="80" height="80">'+'</td>'+
			        	'<td>'+'<a href="productSelected.do?prod_no='+data[i].prod_no+'">'+data[i].prod_name+'</a>'+'</td>'+
			        	'<td>'+data[i].each_qty+'</td>'+
			        	'<td>'+payment_price+'원'+'</td>'+
			        	'<td>'+data[i].delivery_status+'</td>'+
			        	'<td>'+'<input type="button" class="btn btn-default" value="리뷰 쓰기" id="writeReview">'+'</td>'+
			        	'</tr>'		
						)
					};
				},
				error : function (err) {
					console.log(err);				
				}
			})
		});
		$("#writeReview").click(function () {
			location.href="";
		});
      }) // --- end of jquery
      
      // 장바구니에서 바로 결제 클릭 시
      function clickGopay(){
          window.location.href="orderCheck.jsp";
      }
  </script>
  <style>
    .fa-heart{
    color: #F74933;
    }   
    .space-100{
        height: 100px;
        display: block;
    }
    pre.prettyprint{
        background-color: #ffffff;
        border: 1px solid #999;
        margin-top: 20px;
        padding: 20px;
        text-align: left;
    }
    .atv, .str{
        color: #05AE0E;
    }
    .tag, .pln, .kwd{
        color: #3472F7;
    }
    .atn{
        color: #2C93FF;
    }
    .pln{
        color: #333;
    }
    .com{
        color: #999;
    }
    /* 장바구니 쪽*/
    #cart{
        width: 750px;
        text-align: center;
    }
    .panel-body{
        float:right;
    }
    /*주문 상품 정보 테이블 스크롤 만들기, 가운데 정렬만.*/
    #orderHistory{
        text-align: center;
        width: 800px;
        height : 450px;
        overflow : auto;
    }
    table{
    	text-align: center;
    }
    table th{
    	text-align: center;
    }
  </style>
</head>
<body>
<div id="navbar-full">
    <div id="navbar">
       <!--    
        navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange  
        -->
        <nav class="navbar navbar-ct-blue navbar-fixed-top navbar-transparent" role="navigation">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand navbar-brand-logo" href="main.jsp">
                    <div class="logo">
                    <img src="images/logo_only_transparent_small.png">
                    </div>
                    <div class="brand"> HAYERA </div>
              </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

              <ul class="nav navbar-nav navbar-center">
                <li>
                  <a href="#">
                      <i class="pe-7s-drop">
                      </i>
                      <p>모이스처라이저</p>
                  </a>
                </li>
                <li>
                  <a href="#">
                      <i class="pe-7s-sun">
                      </i>
                      <p>선크림</p>
                  </a>
                </li> 
              </ul>

              <ul class="nav navbar-nav navbar-right">
                    <!-- <li>
                        <a href="javascript:void(0);" data-toggle="search" class="hidden-xs">
                            <i class="pe-7s-search"></i>
                            <p>Search</p>
                        </a>
                    </li> -->
                    
                    <!-- KOSMO : NAVBAR에 카테고리 추가 시 사용 -->
                    <li class="dropdown">
	                    <a href="#" class="dropdown-toggle">
	                        <i class="pe-7s-shopbag">
	                            <span class="label">0</span>
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
                          <li><a href="mypage.do">마이페이지</a></li>
                          <li><a href="orderHistory.do">주문 내역</a></li>
                          <li><a href="logout.do">로그아웃</a></li>
                        </ul>
                      </li>
                    </c:if>
               </ul>
            </div><!-- /.navbar-collapse -->
            <form class="navbar-form navbar-right navbar-search-form" role="search">                  
              <div class="form-group">
                <!-- <i class="pe-7s-search"></i> -->
                <input type="text" value="" class="form-control" placeholder=" 검색하기">
              </div> 
              <br>
           </form>
           
          </div><!-- /.container-fluid -->
          
        </nav>
        
       <div class="blurred-container">
          <!-- <div class="event-open text-center">
            지금 가입하시고 포인트 1,000원 받아가세요! >
          </div> -->
        <div class="img-src" style="background-image: url('images/main_background_top.png')"></div>
       </div>
    </div><!--  end navbar -->

</div> <!-- end menu-dropdown -->

<div class="main">
    <div class="filter-window">
      <ul class="filter-review">
        평균평점
        <li><img src="./images/star_4.png"> 별 4개 이상</li>
        <li><img src="./images/star_3.png"> 별 3개 이상</li>
        <li><img src="./images/star_2.png"> 별 2개 이상</li>
        <li><img src="./images/star_1.png"> 별 1개 이상</li>
      </ul> <!-- /.filter-review -->
      <ul class="filter-feeling">
        발림성
        <li><input type="checkbox" name="feeling" id="water"> 흐름</li>
        <li><input type="checkbox" name="feeling" id="soft"> 부드러움</li>
        <li><input type="checkbox" name="feeling" id="mat"> 매트</li>
        <li><input type="checkbox" name="feeling" id="hard"> 하드</li>
      </ul> <!-- /.filter-feeling -->
      <ul class="filter-favor">
        향
        <li><input type="checkbox" name="favor" id="no"> 무향</li>
        <li><input type="checkbox" name="favor" id="flower"> 꽃</li>
        <li><input type="checkbox" name="favor" id="oe"> 오이</li>
        <li><input type="checkbox" name="favor" id="chem"> 화학제품</li>
      </ul> <!-- /.filter-feeling -->
    </div> <!-- /.filter-window -->
    <div class="container tim-container" style="max-width:800px; padding-top:20px">
        <h3 class="text-center hayera">주문 내역</h3>
       <hr/>
       <div class="orderHistory">
        <div class="btn-group">
            <button type="button" class="btn btn-default hayera" id="today">오늘</button>
            <button type="button" class="btn btn-default hayera" id="1week">1주일</button>
            <button type="button" class="btn btn-default hayera" id="1month">1개월</button>
            <button type="button" class="btn btn-default hayera" id="3month">3개월</button>
            <button type="button" class="btn btn-default hayera" id="6month">6개월</button>
        </div>
        <input type="date" id="startDate"> ~ <input type="date" id="endDate">
        <button type="button" class="btn btn-default hayera" id="view">조회</button>
        <br/><br/>
        <div>
            <li class="hayera">기본적으로 최근 3개월간의 자료가 조회됩니다.</li>
            <li class="hayera">상품정보를 클릭하시면 해당 상품에 대한 상세 페이지를 확인하실 수 있습니다.</li>
        </div>
        <hr/>
        <h3 class="hayera">주문 상품 정보</h3>
        <hr/>
        <div id="orderHistory">
            <table class="table table-striped" id="orderHistoryTable">
                <th>주문일자[주문번호]</th>
                <th>이미지</th>
                <th>상품명</th>
                <th>수량</th>
                <th>결제금액</th>
                <th>주문처리상태</th>
                <th>리뷰</th>
            </table>
        </div>
        <div style="padding-left: 320px;">
        	<!-- 페이징 나중에  -->
	        <ul class="pagination">
	            <li><a href="#">&laquo;</a></li>
	            <li><a href="#">1</a></li>
	            <li><a href="#">&raquo;</a></li>
	        </ul>
        </div>
       </div>
       <br>
       <br>
       <br>
       <br> 
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br> 
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       

   
    </div>

    <div class="space-100"></div>
    <div class="space-100"></div>
    <p class="text-right legal-info">
      HAYERA 하예라 서울특별시 금천구 가산디지털2로 123 월드메르디앙벤처센터<br>
      대표: 김영권 외 3명 / 사업자등록번호: 111-11-11111 / 개인정보관리자: 지우빈 <br>
      메일: admin@hayera.com / Copyright &copy;2020 hayera
<!-- end container -->
</div>
<!-- end main -->
</body>
</html>