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
          <title>관리자 - 상품관리</title>

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
          <!-- 추가 아이콘 -->
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

              $('.adminProduct_editTable').hide();

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
                });
              });

              // 검색을 위해 전역변수 선언
              var dataList;

              // 전체상품목록
              $.ajax({
                url: 'viewAllProduct.do',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                async: false, // 검색을 위해 전역변수에 저장하기 위하여 비동기 방식 수행
                success: function (data) {

                  /* 다음 등록 상품 번호 자동 입력 */
                  var nextProd_no = parseInt(data[data.length-1].prod_no) + 1;
                  $('#nextProd_no').val(nextProd_no);

                  for (i = 0; i < data.length; i++) {
                    $('.viewAllProduct').append(
                      '<tr>' + '<td><img class="adminProduct_Img" src="/aHayera/resources/upload/' + data[i].img_url + '">' + '</td>'
                      + '<td style="text-align:right;">' + data[i].prod_no + '</td>'
                      + '<td>' + data[i].prod_name + '</td>'
                      + '<td>' + data[i].brand + '</td>'
                      + '<td>' + data[i].category + '</td>'
                      + '<td data-table-header="가격">' + numberWithCommas(String(data[i].price)) + '</td>'
                      + '<td>' + numberWithCommas(String(data[i].cost_price)) + '</td>'
                      + '<td>' + numberWithCommas(String(data[i].discount_price)) + '</td>'
                      + '<td>' + numberWithCommas(String(data[i].capacity)) + '</td>'
                      + '<td>' + data[i].avg_rating + '</td>'
                      + '<td>' + numberWithCommas(String(data[i].totalsales)) + '</td>'
                      + '<td>' + numberWithCommas(String(data[i].stock)) + '</td>'
                      + '<td>' + data[i].scent + '</td>'
                      + '<td>' + data[i].scent_rating + '</td>'
                      + '<td>' + data[i].feel + '</td>'
                      + '<td>' + data[i].feel_rating + '</td>'
                      + '<td class="configBtns"><button class="editProduct" type="button" data-toggle="tooltip" data-placement="top" title="수정"><i class="material-icons">&#xE254;</i></button>'
                      + '<button class="deleteProduct" type="button" data-toggle="tooltip" data-placement="top" title="삭제"><i class="material-icons">&#xE872;</i></button></td>'
                      + '</tr>'
                    )
                    data[i].value = data[i].prod_name; // 검색 자동완성 인식을 위해 JSON 데이터 추가
                  }
                  dataList = data; // 검색을 위한 데이터 저장
                },
                error: function (e) {
                  alert(e);
                }
              }); // --- end of $.ajax 전체상품목록

              $("#sortTable").DataTable({
                columnDefs: [
                  { type: 'date', targets: [3] }
                ],
              });

              $('#search-product').on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $('.viewAllProduct > tr').filter(function () {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
              }); // --- end of #myInput keyup search for product              

              /* 불필요한 정보 삭제 */
              $('#sortTable_wrapper > div:eq(0)').remove();
              $('#sortTable_wrapper > div:eq(1)').remove();

              /* 수정버튼 클릭 시 */
              $(document).on('click', '.editProduct', function () {

                $('.adminProduct_editTable').show();
                $('.adminProduct_addTable').hide();

                $(this).parent().parent().css("background-color", "#C6E5F3");

                /* DB에서 AJAX로 데이터 가져오기 */
                var info = {
                  prod_no: $(this).parent().parent('tr').find('td:nth-child(2)').text()
                }
                $.ajax({
                  type: "POST",
                  data: info,
                  dataType: "json",
                  url: "adminEditTarget.do",
                  contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
                  success: function (data) {
                    $('#editProductItems > td:nth-child(1) > input').val(data.prod_no);
                    $('#editProductItems > td:nth-child(2) > input').val(data.prod_name);
                    $('#editProductItems > td:nth-child(3) > input').val(data.brand);
                    $('#editProductItems > td:nth-child(4) > select').val(data.category);
                    $('#editProductItems > td:nth-child(5) > input').val(numberWithCommas(String(data.price)));
                    $('#editProductItems > td:nth-child(6) > input').val(numberWithCommas(String(data.cost_price)));
                    $('#editProductItems > td:nth-child(7) > input').val(numberWithCommas(String(data.discount_price)));
                    $('#editProductItems > td:nth-child(8) > input').val(numberWithCommas(String(data.capacity)));
                    $('#editProductItems > td:nth-child(9) > input').val(numberWithCommas(String(data.stock)));
                    $('#editProductItems > td:nth-child(10) > select').val(data.scent);
                    $('#editProductItems > td:nth-child(11) > select').val(data.feel);
                    $('#editProductExplain').val(data.product_explain);
                    $('#editExplain_url').val(data.explain_url);
                  },
                  error: function (err) {
                    alert("에러가 발생했습니다: adminProduct.jsp --- 수정할 데이터 불러오기 에러");
                  }
                });
                $('.editProduct').attr("disabled", "disabled");
                $('.deleteProduct').attr("disabled", "disabled");

              }); // --- end of .editProduct click

              /* 삭제버튼 클릭 시 */
              $(document).on('click', '.deleteProduct', function () {
                
            	var prod_no = $(this).parent().parent('tr').find('td:nth-child(2)').text();
                var test = confirm(prod_no + "번 상품 정보를 삭제하시겠습니까?");  
            	
                /* 재확인 OK 시 삭제 진행 */
                if (test) {
                
	            	/* DB에서 AJAX로 데이터 삭제하기 */
	                var info = {
	                  prod_no: $(this).parent().parent('tr').find('td:nth-child(2)').text()
	                }
	                $.ajax({
	                  type: "POST",
	                  data: info,
	                  url: "adminRemoveProduct.do",
	                  contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
	                  success: function () {
	                    location.href = "adminProduct.do";
	                  },
	                  error: function (err) {
	                    alert("에러가 발생했습니다: adminProduct.jsp --- .deleteProduct 에러");
	                  }
	                });
                }
                else {
                	alert("삭제를 취소하셨습니다.");
                }
              }); // --- end of .deleteProduct click

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
                  <li class="active">
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
                    <a class="navbar-brand" href="" style="font-size: 30px">상품 관리</a>
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

                  <!-- 새 상품 등록 -->
                  <div class="col-md-12">
                    <div class="card adminProduct_addTable">
                      <div class="card-header">
                        <h4 class="card-title"> 새 상품 등록</h4>
                        <p class="">
                          - 새로운 상품을 등록하세요.<br>
                          - 수량 변경은 다른 메뉴를 이용하시기 바랍니다.
                        </p>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <form action="insertProduct.do" method='post' enctype='multipart/form-data'>
                            <table class="table">
                              <thead class="adminProduct_tableHeader">
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
                              </thead>
                              <tr>
                                <td><input type="text" name="prod_no" class=".adminProduct_input" id="nextProd_no"
                                    style="border: none;" readonly></td>
                                <td><input type="text" name="prod_name" class=".adminProduct_input" required></td>
                                <td><input type="text" name="brand" class=".adminProduct_input" required></td>
                                <td>
                                  <select name="category">
                                    <option value="모이스처라이저">모이스처라이저</option>
                                    <option value="선크림">선크림</option>
                                  </select>
                                </td>
                                <td><input type="text" name="s_price" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td><input type="text" name="s_cost_price" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td><input type="text" name="s_discount_price" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" value="0"></td>
                                <td><input type="text" name="s_capacity" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td><input type="text" name="s_stock" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td>
                                  <select name="scent" required>
                                    <option value="무향">무향</option>
                                    <option value="꽃">꽃</option>
                                    <option value="오이">오이</option>
                                    <option value="원료">원료</option>
                                  </select>
                                </td>
                                <td>
                                  <select name="feel" required>
                                    <option value="흐름">흐름</option>
                                    <option value="부드러움">부드러움</option>
                                    <option value="매트">매트</option>
                                    <option value="하드">하드</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td>설명</td>
                                <td colspan="10"><input type="text" name="product_explain" class=".adminProduct_input"
                                    required></td>
                              </tr>
                              <tr>
                                <td>상품정보</td>
                                <td colspan="10"><input type="text" name="explain_url" class=".adminProduct_input"
                                    required></td>
                              </tr>
                              <tr>
                                <td>사진업로드</td>
                                <td colspan="3">
                                  <div class="filebox"><label for="file">업로드</label><input type="file" name="file"
                                      id="file" required></div>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td colspan="2" align="center"><button type="submit" class="btnRegister" value="등록"><i
                                      class="fa fa-plus"></i> 등록하기</button></td>
                              </tr>
                            </table>
                          </form>
                          <!-- 미리보기 사진 띄우기 -->
                          <div class="uploadPreview"><img src=""></div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- 상품 수정 -->
                  <div class="col-md-12">
                    <div class="card adminProduct_editTable">
                      <div class="card-header">
                        <h4 class="card-title"> 상품 수정 </h4>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <form action="adminEditProduct.do" method='post' enctype='multipart/form-data'>
                            <table class="table">
                              <thead class="adminProduct_tableHeader">
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
                              </thead>
                              <tr id="editProductItems">
                                <td><input type="text" name="prod_no" class=".adminProduct_input" id="editProd_no"
                                    style="border: none;" readonly></td>
                                <td><input type="text" name="prod_name" class=".adminProduct_input" required></td>
                                <td><input type="text" name="brand" class=".adminProduct_input" required></td>
                                <td>
                                  <select name="category">
                                    <option value="모이스처라이저">모이스처라이저</option>
                                    <option value="선크림">선크림</option>
                                  </select>
                                </td>
                                <td><input type="text" name="s_price" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td><input type="text" name="s_cost_price" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td><input type="text" name="s_discount_price" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td><input type="text" name="s_capacity" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td><input type="text" name="s_stock" class=".adminProduct_input"
                                    onkeyup="this.value = numberWithCommas(this.value);" required></td>
                                <td>
                                  <select name="scent" required>
                                    <option value="무향">무향</option>
                                    <option value="꽃">꽃</option>
                                    <option value="오이">오이</option>
                                    <option value="원료">원료</option>
                                  </select>
                                </td>
                                <td>
                                  <select name="feel" required>
                                    <option value="흐름">흐름</option>
                                    <option value="부드러움">부드러움</option>
                                    <option value="매트">매트</option>
                                    <option value="하드">하드</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td>설명</td>
                                <td colspan="10"><input type="text" name="product_explain" class=".adminProduct_input"
                                    id="editProductExplain" required></td>
                              </tr>
                              <tr>
                                <td>상품정보</td>
                                <td colspan="10"><input type="text" name="explain_url" class=".adminProduct_input"
                                    id="editExplain_url" required></td>
                              </tr>
                              <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td colspan="2" align="center"><button type="submit" class="btnEdit" value="수정">
                                    수정하기</button></td>
                              </tr>
                            </table>
                          </form>
                          <!-- 미리보기 사진 띄우기 -->
                          <div class="uploadPreview"><img src=""></div>
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
                                  <th scope="col">제품</th>
                                  <th scope="col" style="max-width: 40px; min-width: 40px;">번호</th>
                                  <th scope="col" style="width: 150px; min-width: 150px;">이름</th>
                                  <th scope="col" style="max-width: 80px; min-width: 80px;">브랜드</th>
                                  <th scope="col" style="max-width: 80px; min-width: 80px;">카테고리</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">가격</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">원가</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">할인가</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">용량</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">평점</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">판매</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">재고</th>
                                  <th scope="col" style="max-width: 50px; min-width: 50px;">향</th>
                                  <th scope="col"></th>
                                  <th scope="col" style="max-width: 50px;min-width: 50px;">촉감</th>
                                  <th scope="col"></th>
                                  <th scope="col" style="width: 60px; max-width: 60px;min-width: 60px;"></th>
                                </tr>
                              </thead>

                              <!-- 상품 전체 목록 띄우는 곳 -->
                              <tbody class="viewAllProduct">
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