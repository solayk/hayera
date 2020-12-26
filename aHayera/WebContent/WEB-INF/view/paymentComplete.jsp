<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하예라</title>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
  <script src="js/bootstrap.js" type="text/javascript"></script>
  <script src="js/orderHistoryScripts.js"></script>
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
  
  <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
  <link href="css/ct-navbar.css" rel="stylesheet" />
  <script src="js/ct-navbar.js"></script>

  <!--     Font Awesome     -->
  <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
  <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
    
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
        width: 600px;
        text-align: center;
    }
    .panel-body{
        float:right;
    }
    /*주문 내역 테이블에 스크롤 만들기는 보류하고 가운데 정렬만.*/
    #orderHistory{
        text-align: center;
        width: 800px;
        /*height : 240px;
        overflow : auto;*/
    }
    table{
    	text-align: center;
    }
    table th{
    	text-align: center;
    }
  </style>
  <script type="text/javascript">
	  // 장바구니에서 바로 결제 클릭 시
	  function clickGopay(){
	      window.location.href="orderCheck.jsp";
	  }
	  // 홈으로 클릭 시
      function clickGohome(){
          location.href="main.jsp";
      };
      // 주문 내역 보기 클릭 시
      function clickGoHistory(){
          location.href="orderHistory.do";
      };
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
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand navbar-brand-logo" href="http://www.creative-tim.com">
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="pe-7s-shopbag">
                                <span class="label">0</span>
                            </i>
                            <p>장바구니</p>
                        </a>
                        <ul class="dropdown-menu">
                          <table class="table table-striped" id="cart">
                            <tr>
                              <td>선택</td>
                              <td>이미지</td>
                              <td>상품명</td>
                              <td>수량</td>
                              <td>가격</td>
                              <td>삭제</td>
                            </tr>
                            <tr>
                              <td>
                                <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="option1" checked>
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
                                  <input type="checkbox" value="option2" checked>
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
                            <li><a href="#">로그인</a></li>
                            <li><a href="#">주문목록</a></li>
                            <li><a href="#">마이페이지</a></li>
                            <!-- <li class="divider"></li>
                            <li><a href="#">Separated link</a></li> -->
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
        <li><img src="images/4star.png"> 별 4개 이상</li>
        <li><img src="images/3star.png"> 별 3개 이상</li>
        <li><img src="images/2star.png"> 별 2개 이상</li>
        <li><img src="images/1star.png"> 별 1개 이상</li>
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
        <h3 class="text-center hayera">주문 성공!</h3>
       <hr/>
       <div style="text-align: center; padding-top: 35px">
       	<img src="images/complete.PNG" style="padding-bottom: 60px"><br/>
       	<p>
		  <button type="button" class="btn btn-primary btn-lg" onclick="clickGohome()">홈으로</button>
		  <button type="button" class="btn btn-success btn-lg" onclick="clickGoHistory()">주문 내역 보기</button>
		</p>
		<hr/>
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