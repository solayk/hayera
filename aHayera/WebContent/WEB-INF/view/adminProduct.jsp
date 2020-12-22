<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

    <!DOCTYPE html>
    <html class="perfect-scrollbar-on">

    <head>
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

      <!-- 타이틀 바 -->
        <link rel="shortcut icon" type="image/x-icon" href="images/logo_only_transparent_small.png">
        <title>관리자 - 상품등록</title>

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

        <!-- CSS adminProduct Only => 추후 css 파일에 통합 -->
        <style type="text/css">
          .adminProduct_Img {
            width: 50px;
          }

          .card-header>h4 {
            text-align: left;
          }

          .card-header>input {
            float: right;
          }

          .adminProduct_addTable {
            background: transparent;
            box-shadow: none;
          }

          .adminProduct_addTable .card-header,
          .adminProduct_addTable .card-footer {
            margin-left: 0;
            margin-right: 0;
            background-color: transparent;
          }

          .adminProduct_addTable .card-body {
            padding-left: 0;
            padding-right: 0;
          }

          .table td>input {
            width: 100%;
          }

          .table td>select {}

          .uploadPreview>img {
            width: 2 00px;
          }
        </style>
        
        <script type="text/javascript">
          $(document).ready(function () {

            $('#file').on('change', function (e) {
              var files = e.target.files;
              var filesArr = Array.prototype.slice.call(files);

              var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

              filesArr.forEach(function (f) {
                if (!f.type.match(reg)) {
                  alert("확장자는 이미지 확장자만 가능합니다.");
                  return;
                }

                sel_file = f;

                var reader = new FileReader();
                reader.onload = function (e) {
                  $(".uploadPreview > img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
                
                console.log($('#file').val());
                $('#file').val('C:\fakepath\6.PNG');
                
              });
              
            });
            
          });

          function getCurrentDate() {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0
            var yyyy = today.getFullYear();

            if (dd < 10) {
              dd = "0" + dd
            }

            if (mm < 10) {
              mm = "0" + mm
            }

            today = mm + "-" + dd + "-" + yyyy;
            return today;
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
              <li>
                <a href="adminLogin.jsp">
                  <i class="now-ui-icons design_app"></i>
                  <p>관리자 메인</p>
                </a>
              </li>
              <li>
                <a href="">
                  <i class="now-ui-icons business_chart-pie-36"></i>
                  <p>매출 분석</p>
                </a>
              </li>
              <li>
              <li>
                <a href="">
                  <i class="now-ui-icons users_single-02"></i>
                  <p>회원 관리</p>
                </a>
              </li>
              <li>
                <a href="./admin_stock.html">
                  <i class="now-ui-icons files_paper"></i>
                  <p>재고 관리</p>
                </a>
              </li>
              <li>
                <a href="./admin_order.html">
                  <i class="now-ui-icons shopping_delivery-fast"></i>
                  <p>주문 관리</p>
                </a>
              </li>
              <li class="active">
                <a href="">
                  <i class="now-ui-icons shopping_bag-16"></i>
                  <p>상품 등록</p>
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
                <a class="navbar-brand" href="#pablo">Dashboard</a>
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
                    <a class="nav-link" href="#pablo">
                      <i class="now-ui-icons media-2_sound-wave"></i>
                      <p>
                        <span class="d-lg-none d-md-block">Stats</span>
                      </p>
                    </a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                      aria-haspopup="true" aria-expanded="false">
                      <i class="now-ui-icons location_world"></i>
                      <p>
                        <span class="d-lg-none d-md-block">Some Actions</span>
                      </p>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#pablo">
                      <i class="now-ui-icons users_single-02"></i>
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

          <div class="panel-header panel-header-sm">
          </div>
          <div class="content">
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title"> 상품현황 </h4>
                    <input class="adminProduct_add" type="button" value="추가">
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <form action="" method='post' enctype='multipart/form-data'>
                        <table class="table">
                          <thead class="text-primary">
                            <tr>
                              <th>제품</th>
                              <th></th>
                              <th>이름</th>
                              <th>브랜드</th>
                              <th>카테고리</th>
                              <th>가격</th>
                              <th>원가</th>
                              <th>할인가</th>
                              <th>용량</th>
                              <th>평균평점</th>
                              <th>총판매량</th>
                              <th>재고</th>
                              <th>향</th>
                              <th>향 평가</th>
                              <th>촉감</th>
                              <th>촉감 평가</th>
                              <th>수정</th>
                            </tr>
                          </thead>

                          <tbody>
                            <c:forEach items="${productList }" var="product">
                              <tr>
                                <td><img class="adminProduct_Img" src="/aHayera/resources/upload/${product.img_url }">
                                </td>
                                <td>${product.prod_no }</td>
                                <td>${product.prod_name }</td>
                                <td>${product.brand }</td>
                                <td>${product.category }</td>
                                <td>${product.price }</td>
                                <td>${product.cost_price }</td>
                                <td>${product.discount_price }</td>
                                <td>${product.capacity }</td>
                                <td>${product.avg_rating }</td>
                                <td>${product.totalsales }</td>
                                <td>${product.stock }</td>
                                <td>${product.scent }</td>
                                <td>${product.scent_rating }</td>
                                <td>${product.feel }</td>
                                <td>${product.feel_rating }</td>
                                <td><input type="button" value="수정"></td>
                              </tr>
                            </c:forEach>

                          </tbody>

                        </table>
                      </form>
                    </div>
                  </div>
                  <div class="card-footer">
                    <div class="stats">
                      <i class="now-ui-icons arrows-1_refresh-69 spin"></i> Just Updated
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-12">
                <div class="card .adminProduct_addTable">
                  <!-- .adminProduct_addTable 클래스 추가 -->
                  <div class="card-header">
                    <h4 class="card-title"> 새상품등록 </h4>
                    <p class="category"> 새로운 상품을 등록하세요. 수량 변경은 다른 메뉴를 이용하시기 바랍니다.</p>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <form action="insertProduct.do" method='post' enctype='multipart/form-data'>
                        <table class="table">
                          <tr>
                            <th>제품번호</th>
                            <th>이름</th>
                            <th>브랜드</th>
                            <th>카테고리</th>
                            <th>가격</th>
                            <th>매입가</th>
                            <th>할인가</th>
                            <th>용량</th>
                            <th>수량</th>
                            <th>향</th>
                            <th>촉감</th>
                          </tr>
                          <tr>
                            <td><input type="text" name="prod_no" class=".adminProduct_input" required></td>
                            <td><input type="text" name="prod_name" class=".adminProduct_input" required></td>
                            <td><input type="text" name="brand" class=".adminProduct_input" required></td>
                            <td>
                              <select name="category">
                                <option value="모이스처라이저">모이스처라이저</option>
                                <option value="선크림">선크림</option>
                              </select>
                            </td>
                            <td><input type="text" name="price" class=".adminProduct_input" required></td>
                            <td><input type="text" name="cost_price" class=".adminProduct_input" required></td>
                            <td><input type="text" name="discount_price" class=".adminProduct_input" required></td>
                            <td><input type="text" name="capacity" class=".adminProduct_input" required></td>
                            <td><input type="text" name="stock" class=".adminProduct_input" required></td>
                            <td><input type="text" name="scent" class=".adminProduct_input" required></td>
                            <td><input type="text" name="feel" class=".adminProduct_input" required></td>
                          </tr>
                          <tr>
                            <td>설명</td>
                            <td colspan="10"><input type="text" name="product_explain" class=".adminProduct_input"
                                required></td>
                          </tr>
                          <tr>
                            <td>사진업로드</td>
                            <td colspan="3"><input type="file" name="file" id="file" required></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td align="center"><input type="submit" value="등록" /></td>
                          </tr>
                        </table>
                      </form>

                      <!-- 미리보기 사진 띄우기 -->
                      <div class="uploadPreview"><img src=""></div>

                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>

          <footer class="footer">
            <div class=" container-fluid ">
              <div class="copyright" id="copyright">
                &copy;
                <script>
                  document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
                </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by <a
                  href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
              </div>
            </div>
          </footer>
        </div>
      </div>
      <!--   Core JS Files   -->
        <script src="./js/jquery.min.js" type="text/javascript"></script>
        <script src="./js/popper.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/perfect-scrollbar.jquery.min.js"></script>
        <!-- Chart JS -->
        <script src="./js/chartjs.min.js"></script>
        <!--  Notifications Plugin    -->
        <script src="./js/bootstrap-notify.js"></script>
        <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="./js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"></script>
        <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
        <script src="./demo/demo.js"></script>
      
    </body>

    </html>