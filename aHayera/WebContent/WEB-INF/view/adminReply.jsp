<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <!DOCTYPE html>
        <html class="perfect-scrollbar-on">

        <head>
          <meta charset="utf-8" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

          <!-- 타이틀 바 -->
          <link rel="shortcut icon" type="image/x-icon" href="images/logo_only_transparent_small.png">
          <title>관리자 - 주문관리</title>

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
          <!-- Data Table -->
          <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css" />
          <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
          <script
            src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/dataTables.bootstrap.min.js"></script>
          <script src="https://cdn.datatables.net/plug-ins/1.10.15/sorting/stringMonthYear.js"></script>
          <!-- 아이콘 https://material.io/resources/icons/?style=baseline -->
          <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

          <!-- 전용 CSS 연결 -->
          <link href="./css/hayera.css" rel="stylesheet" />

          <script type="text/javascript">
          
       		// 세션 아이디 변수 sessionId에 저장
          	var admin_id = '<%=session.getAttribute("admin_id")%>';
	        if (admin_id == 'null') { /* 세션 Id가 살아있으면 mainAfterLogin.jsp로 리디렉션 */
            	location.href = "adminLogin.jsp";
          	}
          
            $(document).ready(function () {

              $('.adminInquiry_editTable').hide();

              // 전체 문의 목록
              $.ajax({
                url: 'viewAllInquiry.do',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                async: false, // 검색을 위해 전역변수에 저장하기 위하여 비동기 방식 수행
                success: function (data) {

                  for (i = 0; i < data.length; i++) {
                    $('.viewAllInquiry').append(
                      '<tr>'
                      + '<td>' + data[i].inquiry_id + '</td>'
                      + '<td>' + data[i].prod_no + '</td>'
                      + '<td><img class="adminProduct_Img" src="/aHayera/resources/upload/' + data[i].img_url + '">' + '</td>'
                      + '<td>' + data[i].prod_name + '</td>'
                      + '<td>' + data[i].customer_id + '</td>'
                      + '<td>' + data[i].contents + '</td>'
                      + '<td>' + data[i].qnaday + '</td>'
                      + '<td>' + data[i].reply_contents + '</td>'
                      + '<td>' + data[i].replyday + '</td>'
                      + '<td class="configBtns">'
                      + (data[i].replyday == null ? '<button class="replyToInquiry" type="button" data-toggle="tooltip" data-placement="top" title="답변"><i class="material-icons">question_answer</i></button>' : '')
                      + '</tr>'
                    )
                  }
                  $('.cancelledOrder > td').css("color", "#BFBFBF"); // 취소 아이템 회색 음영 표기
                },
                error: function (e) {
                  alert(e);
                }
              }); // --- end of $.ajax 전체상품목록

              $("#sortTable").DataTable({
                columnDefs: [
                  { type: 'date', targets: [3] }
                ],
                "paging": false
              });

              $('#search-product').on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $('.viewAllInquiry > tr').filter(function () {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
              }); // --- end of #myInput keyup search for product              

              /* 불필요한 정보 삭제 */
              $('#sortTable_wrapper > div:eq(0)').remove();
              /* $('#sortTable_wrapper > div:eq(1)').remove(); */

              /* 답변 버튼 클릭 시 */
              $(document).on('click', '.replyToInquiry', function () {

                $('.adminInquiry_editTable').show();

                $(this).parent().parent().css("background-color", "#C6E5F3");

                /* DB에서 AJAX로 데이터 가져오기 */
                var info = {
                  inquiry_id: $(this).parent().parent('tr').find('td:nth-child(1)').text()
                }
                $.ajax({
                  type: "POST",
                  data: info,
                  dataType: "json",
                  url: "viewAllInquiry.do",
                  contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
                  success: function (data) {
                    $('#replyInquiry > td:nth-child(1) > input').val(data[0].inquiry_id);
                    $('#replyInquiry > td:nth-child(2) > input').val(data[0].prod_name);
                    $('#replyInquiry > td:nth-child(3) > input').val(data[0].contents);
                  },
                  error: function (err) {
                    alert("에러가 발생했습니다: adminProduct.jsp --- 수정할 데이터 불러오기 에러");
                  }
                });
                $('.replyToInquiry').attr("disabled", "disabled");
              }); // --- end of .editProduct click

            }); // --- end of document ready

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
                  <li class="active">
                    <a href="adminReply.do">
                      <i class="now-ui-icons ui-2_chat-round"></i>
                      <p>문의 관리</p>
                    </a>
                  </li>
                  <li>
                    <a href="adminInventory.do">
                      <i class="now-ui-icons files_paper"></i>
                      <p>재고 관리</p>
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
                    <a class="navbar-brand" href="" style="font-size: 30px">문의 답변 관리</a>
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
                        <a class="nav-link" href="adminLogout.do" data-toggle="tooltip" data-placement="top"
                          title="로그아웃">
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

              <div class="panel-header panel-header-sm">
              </div>
              <div class="content">
                <div class="row">

                  <!-- 상품 수정 -->
                  <div class="col-md-12">
                    <div class="card adminInquiry_editTable">
                      <div class="card-header">
                        <h4 class="card-title"> 주문 수정 </h4>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <form action="adminReplyInquiry.do" method='post' enctype='multipart/form-data'>
                            <table class="table">
                              <thead class="adminProduct_tableHeader">
                                <tr>
                                  <th style="max-width: 70px; min-width: 70px;">문의번호</th>
                                  <th style="max-width: 70px; min-width: 70px;">제품이름</th>
                                  <th style="max-width: 200px; min-width: 200px;">문의</th>
                                  <th style="max-width: 70px; min-width: 70px;">관리자</th>
                                  <th style="max-width: 600px; min-width: 600px;">답변</th>
                                </tr>
                              </thead>
                              <tr id="replyInquiry">
                                <td><input type="text" name="inquiry_id" class=".adminProduct_input" id="editCustomer_id" style="border: none;" readonly></td>
                                <td><input type="text" name="" class=".adminProduct_input" style="border: none;" readonly></td>
                                <td><input type="text" name="" class=".adminProduct_input" style="border: none;" readonly></td>
                                <td><input type="text" name="manager_id" class=".adminProduct_input" style="border: none;" value="<%=session.getAttribute("admin_id")%>" readonly></td>
                                <td><input type="text" name="contents" class=".adminProduct_input" required></td>
                              </tr>
                              <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td colspan="2" align="center"><button type="submit" class="btnReply" value="수정">답변하기</button></td>
                              </tr>
                            </table>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="card">

                      <!-- 검색 -->
                      <div class="card-header">
                        <h4 class="card-title">
                          <div class="input-group no-border">
                            <input type="search" value="" class="form-control search-product" id="search-product"
                              placeholder="Search...">
                            <div class="input-group-append">
                              <div class="input-group-text">
                                <i class="now-ui-icons ui-1_zoom-bold"></i>
                              </div>
                            </div>
                          </div>
                        </h4>
                      </div>

                      <div class="card-body">
                        <div class="table-responsive">
                          <form action="" method='post' enctype='multipart/form-data'>
                            <table class="table" id="sortTable">
                              <thead class="adminProduct_tableHeader">
                                <tr class="viewTableHeader">
                                  <th scope="col" style="max-width: 70px; min-width: 70px;">문의번호</th>
                                  <th scope="col" style="max-width: 70px; min-width: 70px;">제품번호</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">제품</th>
                                  <th scope="col" style="max-width: 70px; min-width: 70px;">제품이름</th>
                                  <th scope="col" style="max-width: 70px; min-width: 70px;">아이디</th>
                                  <th scope="col" style="max-width: 250px; min-width: 250px;">문의</th>
                                  <th scope="col" style="max-width: 60px; min-width: 60px;">작성일</th>
                                  <th scope="col" style="max-width: 250px; min-width: 250px;">답변</th>
                                  <th scope="col" style="max-width: 60px; min-width: 60px;">답변일</th>
                                  <th scope="col" style="max-width: 30px; min-width: 30px;"></th>
                                </tr>
                              </thead>

                              <!-- 고객 전체 목록 띄우는 곳 -->
                              <tbody class="viewAllInquiry">
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
                </div>
              </div>

              <footer class="footer">
                <div class=" container-fluid ">
                  <div class="copyright" id="copyright">
                    &copy;
                    <script>
                      document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
                    </script> Designed by <a href="" target="_blank">HAYERA</a>.
                  </div>
                </div>
              </footer>
            </div>
          </div>
          <!-- Core JS Files   -->
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
          <!-- 하예라 전용 JS Files   -->
          <script src="./js/hayera.js"></script>
        </body>

        </html>