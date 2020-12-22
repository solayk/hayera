<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        
        <!-- 타이틀 바 -->
    	<link rel="shortcut icon" type="image/x-icon" href="images/logo_only_transparent_small.png" >
    	<title>카테고리 - ${categoryName}</title>
        
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- 추후 CSS 정리 통합 예정 -->
        <link href="css/hayera.css" rel="stylesheet" />
        <!-- ↓ 장바구니 화살표 아이콘 -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">

        <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
        <link href="css/ct-navbar.css" rel="stylesheet" />

        <!-- 검색 autocomplete 목적-->
        <link href="autocomplete/jquery-ui.min.css" rel="stylesheet" />
        <link href="autocomplete/jquery-ui.structure.min.css" rel="stylesheet" />
        <link href="autocomplete/jquery-ui.theme.min.css" rel="stylesheet" />
        <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
        <!-- 검색 autocomplete 목적-->
        <script src="autocomplete/jquery-ui.min.js"></script>


        <script src="js/bootstrap.js" type="text/javascript"></script>

        <script src="js/ct-navbar.js"></script>

        <!--     Font Awesome     -->
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

        <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
        <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
        <style>
          /* a태그 기본 style 유지 */
          a {
            color: inherit;
            text-decoration: none;
          }

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

          #search,
          #searchBtn {
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

          .ui-menu .ui-menu-item a.ui-state-hover,
          .ui-menu .ui-menu-item a.ui-state-active {
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
        </style>
        <script type="text/javascript">

          // 숫자 3자리 단위로 콤마를 찍어주는 함수_ .formatNumber()로 사용.
          Number.prototype.formatNumber = function () {
            if (this == 0) return 0;
            let regex = /(^[+-]?\d+)(\d{3})/;
            let nstr = (this + '');
            while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
            return nstr;
          };

          // Jquery 시작
          $(document).ready(function () {

        // 검색을 위해 전역변수 선언
        var dataList;

            // 전체상품목록 => 띄우진 않고 검색을 위해 dataList 에 저장 목적 ONLY 
            $.ajax({
              url: 'viewAllProduct.do',
              dataType: 'json',
              contentType: 'application/x-www-form-urlencoded;charset=utf-8',
              async: false, // 검색을 위해 전역변수에 저장하기 위하여 비동기 방식 수행
              success: function (data) {

                for (i = 0; i < data.length; i++) {
                  data[i].value = data[i].prod_name; // 검색 자동완성 인식을 위해 JSON 데이터 추가
                }
                dataList = data; // 검색을 위한 데이터 저장
              },
              error: function (e) {
                alert(e);
              }
            }); // --- end of $.ajax 전체상품목록

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

          });

          // 장바구니 내 바로결제 버튼 클릭 시 --> 주문결제 페이지로 이동
          function clickGopay() {
            window.location.href = "orderCheck.jsp";
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
                  <a class="navbar-brand navbar-brand-logo" href="main.jsp">
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

                </div><!-- /.navbar-collapse -->
                <!-- 검색 -->
                <form action="searchResult.do" class="navbar-form navbar-right navbar-search-form" role="search"
                  method="get">
                  <div class="form-group">
                    <fieldset>
                      <input type="search" id="search" name="search" placeholder="검색하기">
                      <button type="submit" id="searchBtn">
                        <i class="fa fa-search">
                        </i>
                      </button>
                    </fieldset>
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
            <br>
            <div class="col-md-12">

              <!-- 카테고리 이름 -->
                <h3 class="text-center hayera">" ${categoryName} "<br>
              <br><br>
              <div class="product">
                <ul class="product-top viewAllProduct">
                  <c:forEach var="vo" items="${categoryList}">
                    <li>
                      <a href="productSelected.do?prod_no=${vo.prod_no}">
                        <div class="item-img"><img src="/aHayera/resources/upload/${vo.img_url}"></div>
                        <div class="item-title">${vo.prod_name}</div>
                        <div class="item-reviewno"><img src="./images/star_4.png"></div>
                        <div class="item-price">${vo.price} 원</div>
                        <div class="item-price-ml">ml당' + '원</div>
                        <div class="item-sale-remaining">세일 2일 남음</div>
                      </a>
                    </li>
                  </c:forEach>
                </ul>
              </div>
              <hr>
              <br><br>
              <br><br>
              <br><br>
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