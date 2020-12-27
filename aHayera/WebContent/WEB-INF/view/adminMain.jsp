<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- 타이틀 바 -->
    <link rel="shortcut icon" type="image/x-icon" href="images/logo_only_transparent_small.png">
    <title>관리자 메인</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
      name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
      integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!-- CSS Files -->
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="./demo/demo.css" rel="stylesheet" />

    <!-- 검색 autocomplete 목적-->
    <link href="autocomplete/jquery-ui.min.css" rel="stylesheet" />
    <link href="autocomplete/jquery-ui.structure.min.css" rel="stylesheet" />
    <link href="autocomplete/jquery-ui.theme.min.css" rel="stylesheet" />
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
    <!-- 검색 autocomplete 목적-->
    <script src="autocomplete/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
    	
		// 세션 아이디 변수 sessionId에 저장
        var admin_id = '<%=session.getAttribute("admin_id")%>';
	    if (admin_id == 'null') { /* 세션 Id가 살아있으면 mainAfterLogin.jsp로 리디렉션 */
        	location.href = "adminLogin.jsp";
        }
	    
	</script>
	
  </head>

  <body class="">
    <div class="wrapper ">
      <div class="sidebar" data-color="blue">
        <div class="logo">
          <a href="adminLogin.jsp" class="simple-text logo-mini">
            <img src="./images/logo_only_transparent_small.png">
          </a>
          <a href="adminLogin.jsp" class="simple-text logo-normal">
            하예라 관리자
          </a>
        </div>
        <div class="sidebar-wrapper" id="sidebar-wrapper">
          <ul class="nav">
            <li class="active">
              <a href="adminLogin.jsp">
                <i class="now-ui-icons design_app"></i>
                <p>관리자 메인</p>
              </a>
            </li>
            <li>
              <a href="adminCustomer.do">
                <i class="logoutIcon now-ui-icons users_single-02"></i>
                <p>고객 관리</p>
              </a>
            </li>
            <li>
              <a href="adminProduct.do">
                <i class="now-ui-icons shopping_bag-16"></i>
                <p>상품 관리</p>
              </a>
            </li>
            <li>
              <a href="adminOrder.do">
                <i class="now-ui-icons shopping_delivery-fast"></i>
                <p>주문 관리</p>
              </a>
            </li>
            <li>
              <a href="adminReply.do">
                <i class="now-ui-icons ui-2_chat-round"></i>
                <p>문의 관리</p>
              </a>
            </li>
            <li>
            <li>
              <a href="adminInventory.do">
                <i class="now-ui-icons files_paper"></i>
                <p>재고 관리</p>
              </a>
            </li>
            <li>
              <a href="adminSales.do">
                <i class="now-ui-icons business_chart-pie-36"></i>
                <p>매출 분석</p>
              </a>
            </li>
          </ul>
        </div>
      </div>
      <div class="main-panel" id="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
          <div class="container-fluid">
            <div class="navbar-wrapper">
              <div class="navbar-toggle">
                <button type="button" class="navbar-toggler">
                  <span class="navbar-toggler-bar bar1"></span>
                  <span class="navbar-toggler-bar bar2"></span>
                  <span class="navbar-toggler-bar bar3"></span>
                </button>
              </div>
              <a class="navbar-brand" href="">월 매출 그래프</a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
              aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-bar navbar-kebab"></span>
              <span class="navbar-toggler-bar navbar-kebab"></span>
              <span class="navbar-toggler-bar navbar-kebab"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
              <form>
                <div class="input-group no-border">
                  <input type="text" value="" class="form-control" placeholder="Search...">
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <i class="now-ui-icons ui-1_zoom-bold"></i>
                    </div>
                  </div>
                </div>
              </form>
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="adminLogout.do" data-toggle="tooltip" data-placement="top" title="로그아웃">
                    <i class="now-ui-icons users_circle-08"></i> LOGOUT
                    <p>
                      <span class="d-lg-none d-md-block">Account</span>
                    </p>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <!-- End Navbar -->


        <div class="panel-header panel-header-lg">
          <canvas id="bigDashboardChart"></canvas>
        </div>
        <div class="content">

          <div class="row">
            <div class="col-lg-4">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">매출추이</h5>
                  <h4 class="card-title">일 매출</h4>
                  <div class="dropdown">
                    <button type="button"
                      class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret"
                      data-toggle="dropdown">
                      <i class="now-ui-icons loader_gear"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                      <a class="dropdown-item text-danger" href="#">Remove Data</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="lineChartExample"></canvas>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">매출추이</h5>
                  <h4 class="card-title">판매수량</h4>
                  <div class="dropdown">
                    <button type="button"
                      class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret"
                      data-toggle="dropdown">
                      <i class="now-ui-icons loader_gear"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                      <a class="dropdown-item text-danger" href="#">Remove Data</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="lineChartExampleWithNumbersAndGrid"></canvas>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">사용자통계</h5>
                  <h4 class="card-title">체류시간</h4>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="barChartSimpleGradientsNumbers"></canvas>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="now-ui-icons ui-2_time-alarm"></i> Last 7 days
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- KOSMO : 관리자 메인 3행 그래프 신규 추가 -->
          <div class="row">
            <div class="col-lg-4">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">사용자통계</h5>
                  <h4 class="card-title">DAU</h4>
                  <div class="dropdown">
                    <button type="button"
                      class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret"
                      data-toggle="dropdown">
                      <i class="now-ui-icons loader_gear"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                      <a class="dropdown-item text-danger" href="#">Remove Data</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="lineChartExample"></canvas>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">사용자통계</h5>
                  <h4 class="card-title">MAU</h4>
                  <div class="dropdown">
                    <button type="button"
                      class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret"
                      data-toggle="dropdown">
                      <i class="now-ui-icons loader_gear"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                      <a class="dropdown-item text-danger" href="#">Remove Data</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="lineChartExampleWithNumbersAndGrid"></canvas>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6">
              <div class="card card-chart">
                <div class="card-header">
                  <h5 class="card-category">사용자통계</h5>
                  <h4 class="card-title">구매전환율</h4>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="barChartSimpleGradientsNumbers"></canvas>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="now-ui-icons ui-2_time-alarm"></i> Last 7 days
                  </div>
                </div>
              </div>
            </div>
          </div>



        </div>

        <footer class="footer">
          <div class=" container-fluid ">
            <nav>
              <ul>
                <li>
                  <a href="">
                    HAYERA 하예라
                  </a>
                </li>

              </ul>
            </nav>
            <div class="copyright" id="copyright">
              Copyright &copy;2020 hayera, Designed by </a>.
            </div>
          </div>
        </footer>
      </div>
    </div>
    <!--   Core JS Files   -->
    <script src="./js/jquery.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/perfect-scrollbar.jquery.min.js"></script>
    <!--  Google Maps Plugin    -->
    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->
    <!-- Chart JS -->
    <script src="./js/chartjs.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="./js/bootstrap-notify.js"></script>
    <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="./js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"></script>
    <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
    <script src="./demo/demo.js"></script>
    <script>
      $(document).ready(function () {
        demo.initDashboardPageCharts(); // Javascript method's body can be found in assets/js/demos.js
      });
    </script>

  </body>

  </html>