<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="spring.mvc.domain.ObjectVO"%>
  <!DOCTYPE html>
  <html>
  
  <!-- 로그인 이후 화면 -->
  <!-- 로그인 이후 화면 -->
  <!-- 로그인 이후 화면 -->
  <!-- 상품 전체목록 띄운 후 우빈이와 합칠 예정 -->

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">

    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
    <link href="css/ct-navbar.css" rel="stylesheet" />
    
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
  	<script src="js/bootstrap.js" type="text/javascript"></script>

 	<script src="js/ct-navbar.js"></script>

    <!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
    <style>
      .fa-heart {
        color: #F74933;
      }
      .space-100 {
        height: 100px;
        display: block;
      }
      pre.prettyprint {
        background-color: #ffffff;
        border: 1px solid #999;
        margin-top: 20px;
        padding: 20px;
        text-align: left;
      }
      .atv,
      .str {
        color: #05AE0E;
      }
      .tag,
      .pln,
      .kwd {
        color: #3472F7;
      }
      .atn {
        color: #2C93FF;
      }
      .pln {
        color: #333;
      }
      .com {
        color: #999;
      }
      /* KOSMO : 장바구니 CSS */
      .table {
        width: 600px;
        text-align: center;
      }
      .panel-body {
        float: right;
      }
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
// mainAfterLogin => 나중에 main.jsp 에도 추가 필요
		// 전체상품목록
		$.ajax({
			url: 'viewAllProduct.do',
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(data){
				console.log(">>>ajax success! viewAllProduct!<<<");
		    console.log(data.length);
            for(i=0; i<data.length; i++){
		          
		        }
			} 
		});
    	
    	$.ajax({
			type : 'post',
			url : 'viewTopSalesedItem.do',
			dataType : 'json',
			/* data : objectVO, */
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(data){
				alert(data[0].prod_name);
				$("#topSalesedItemName").text(objectVO);
			},
			error : function (err) {
				console.log(err);
			}
		});
	 	$.ajax({
			type : 'post',
			url : 'viewTopSalesedItemBrand.do',
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(result){
				$("#topSalesedItemBrand").text(result);
			},
			error : function (err) {
				console.log(err);
			}
		});
	 	$.ajax({
	 		type : 'post',
	 		url : 'main.do',
	 		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
	 		success : function(result){
	 			
	 		},
	 		error : function (err) {
				console.log(err);
			}
	 	});
    })    
    <!-- KOSMO : 장바구니 내 바로결제 버튼 클릭 시 -->
      function clickGopay(){
        window.location.href="orderCheck.jsp";
      }
    </script>
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
              <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand navbar-brand-logo" href="http://www.creative-tim.com">
                <div class="logo">
                  <img src="./images/logo_only_transparent_small.png">
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
                <li class="dropdown open">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
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
                      <th>삭제</th>
                      <tr>
                        <td>
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" value="option1">
                              1
                            </label>
                          </div>
                        </td>
                        <td>
                          <img src="images/product/a.png" width="55" height="55">
                        </td>
                        <td>
                          <a href="#">테라비코스 엔자임 워싱 파우더</a>
                        </td>
                        <td>
                          1
                          <button type="button" class="btn btn-primary btn-xs">
                            <span class="glyphicon glyphicon-chevron-up"></span>
                          </button>
                          <button type="button" class="btn btn-primary btn-xs">
                            <span class="glyphicon glyphicon-chevron-down"></span>
                          </button>
                        </td>
                        <td>
                          28,000원
                        </td>
                        <td>
                          <button type="button" class="btn btn-danger btn-xs">
                            <span class="glyphicon glyphicon-remove"></span>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" value="option2">
                              2
                            </label>
                          </div>
                        </td>
                        <td>
                          <img src="images/product/b.jpg" width="55" height="55">
                        </td>
                        <td>
                          <a href="#">맨 바이오 에센스 컨디셔닝 145ml</a>
                        </td>
                        <td>
                          1
                          <button type="button" class="btn btn-primary btn-xs">
                            <span class="glyphicon glyphicon-chevron-up"></span>
                          </button>
                          <button type="button" class="btn btn-primary btn-xs">
                            <span class="glyphicon glyphicon-chevron-down"></span>
                          </button>
                        </td>
                        <td>
                          24,500원
                        </td>
                        <td>
                          <button type="button" class="btn btn-danger btn-xs">
                            <span class="glyphicon glyphicon-remove"></span>
                          </button>
                        </td>
                      </tr>
                    </table>
                    <div class="panel panel-info">
                      <div class="panel-heading">
                        <h3 class="panel-title">총 결제금액</h3>
                      </div>
                      <div class="panel-body">
                        52,500 원 &emsp;&emsp;
                        <!-- KOSMO : 버튼에 결제창으로 가는 이벤트 부여 --> 
                        <button type="button" class="btn btn-primary" onclick="clickGopay()">바로 결제</button>
                      </div>
                    </div>
                  </ul>

                </li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="pe-7s-user"></i>
                    <p>내 계정 <b class="caret"></b></p>
                  </a>
                  <ul class="dropdown-menu">
<!-- mainAfterLogin 에만 해당 -->
                    <li><a href="mypage.do">마이페이지</a></li>
                    <li><a href="#">주문목록</a></li>
                    <li><a href="logout.do">로그아웃</a></li>
                  </ul>
                </li>
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
          <li><img src="./images/4star.png"> 별 4개 이상</li>
          <li><img src="./images/3star.png"> 별 3개 이상</li>
          <li><img src="./images/2star.png"> 별 2개 이상</li>
          <li><img src="./images/1star.png"> 별 1개 이상</li>
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
        <br>

        <br>
        <hr>
        <h3 class="text-center hayera">지금 가장 핫한 상품<br>
          <small class="subtitle">이번주 가장 많이 판매된 5가지 상품입니다.</a></small>
        </h3>
        <div class="product">
          <ul class="product-top">
            <li>
              <div class="item-img"><img src="./images/product/1.jpg"></div>
              <div class="item-title">이니스프리</div>
              <div class="item-reviewno"><img src="./images/4star.png"> 231</div>
              <div class="item-price">12,000원</div>
              <div class="item-price-ml">ml당 1,000원</div>
              <div class="item-sale-remaining">세일 2일 남음</div>
            </li>
            <li>
              <img src="./images/product/2.png">
              <div class="item-title">더 심플 데일리 로션</div>
              <div class="item-reviewno"><img src="./images/5star.png"> 231</div>
              <div class="item-price">18,000원</div>
              <div class="item-price-ml">ml당 1,200원</div>
              <div class="item-sale-remaining">세일 3일 남음</div>
            </li>
            <li>
              <img src="./images/product/3.jpeg">
              <div class="item-title">세라마이드 하이드라 플루이드</div>
              <div class="item-reviewno"><img src="./images/4star.png"> 231</div>
              <div class="item-price">36,000원</div>
              <div class="item-price-ml">ml당 3,000원</div>
              <div class="item-sale-remaining">세일 1일 남음</div>
            </li>
          </ul>
        </div>
        <div class="col-md-12">
          <br>
          <hr>

          <h3 class="text-center hayera">전체 상품 목록<br>
            <br>
            <div class="product">
              <ul class="product-top ">
              </ul>
            </div>

          </h3>
          <hr>
          <h3 class="text-center hayera">No.1 Salesed<br>
            <br>
          </h3>
          <div class="product">
	          <ul class="product-top">
	          	<c:forEach items="${productList }" var="product">
		            <li>
		              <div class="item-img"><img src="/aHayera/resources/upload/${product.img_url }"></div>
		              <div class="item-title" id="topSalesedItemName">${product.prod_name }</div>
		              <div class="item-brand" id="topSalesedItemBrand">${product.brand }</div>
		              <div class="item-reviewno"><img src="./images/4star.png"> 231</div>
		              <div class="item-price">12,000원${product.discount_price }</div>
		              <div class="item-price-ml">ml당 1,000원${product.capacity }</div>
		              <div class="item-sale-remaining">세일 2일 남음</div>
		            </li>
	            </c:forEach>
            </ul>
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

        <p class="text-right legal-info">
          HAYERA 하예라 서울특별시 금천구 가산디지털2로 123 월드메르디앙벤처센터<br>
          대표: 김영권 외 3명 / 사업자등록번호: 111-11-11111 / 개인정보관리자: 지우빈 <br>
          메일: admin@hayera.com / Copyright &copy;2020 hayera
          <!-- end container -->
      </div>
      <!-- end main -->

  </body>
  </html>