<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAYERA!</title>
	<link href="css/hayera.css" rel="stylesheet" />
	<!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 부트스트랩 5.0 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
    <script src="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <!-- navbar 관련 css, js 연결-->
    <link href="css/ct-navbar.css" rel="stylesheet">
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
    <script src="js/ct-navbar.js"></script>
    <!-- 주소 찾기 + 스크롤, 버튼 등.. -->
    <script src="js/orderCheckScripts.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
    /* 주문 상품에 스크롤 만들기 & 테이블 텍스트 가운데 정렬*/
    #orderlist{
    height : 200px;
    overflow : auto;
    }
    table{
        text-align: center;
    }
    </style>
    <script type="text/javascript">
    $(function () {
    	//alert("${info.address}");
    	// 배송지_ '새로운 배송지' 선택 시 입력값 초기화.
    	$("#addrCheck input").on('change', function () {
			if($('input[name="inlineRadioOptions"]:checked', '#addrCheck').val()=="option2"){
				$('input[type="text"]','#addrInput').val("");
				$('input[type="tel"]','#addrInput').val("");
				$('input[type="email"]','#addrInput').val("");
			// 배송지_ '회원 정보와 동일' 선택 시 회원 정보 받아와 채우기.
			}else{
				$("#recipientName").val("${info.name}");
				$("#zonecode2").val("${addr[0]}")
				$("#addr").val("${addr[1]}")
				$("#detailAddr").val("${addr[2]}")
				$("#extraAddr").val("${addr[3]}")
				$('input[type="tel"]','#addrInput').val("${info.tel}");
				$('input[type="email"]','#addrInput').val("${info.email}");
			}
		});
    	// 할인_ 적립금 '전액사용' 버튼 클릭 시 보유한 적립금 전부 입력됨.
    	$("#button-addon").on('click',function(){
    		$(".form-control").val("${info.points}원");
    		$("#collapseFour p:eq(1)>input[type='text']").val("${info.points}원");
    	});
    	// 적립금 입력값에 따라 결제정보_할인 란에 금액 적용되게.
    	$(".form-control").on('change', function () {
    		var pointUse = $(".form-control").val();
			$("#collapseFour p:eq(1)>input[type='text']").val(pointUse+"원");
		});
    	// 주문 상품 정보 받아 오기
	})
    </script>
</head>
<body>
<div id="navbar-full" style="background-image: url(images/main_background_top.png);">
    <div id="navbar">
      <nav class="navbar navbar-ct-blue navbar-fixed-top navbar-transparent" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <a class="navbar-brand navbar-brand-logo" href="#">
              <div class="logo">
                <img src="images/logo_only_transparent_small.png">
              </div>
              <div class="brand">HAYERA _ 주문/결제</div>
            </a>
          </div>
		    <!-- 주문/결제 페이지 상단에 내 계정 표시 (보류) 
		    <ul class="nav navbar-nav navbar-right">
		    	<li class="dropdown">
		        	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			      		<i class="pe-7s-user"></i>
			      		<p>내 계정 <b class="caret"></b></p>
			   		</a>
			    <ul class="dropdown-menu">
			      mainAfterLogin 에만 해당
			      <li><a href="mypage.do">마이페이지</a></li>
			      <li><a href="#">주문목록</a></li>
			      <li><a href="logout.do">로그아웃</a></li>
			    </ul>
			  	</li>
		  	</ul> -->
        </div>
      </nav>
    </div>
  </div>
  
  <div class="container tim-container" style="max-width:800px; padding-top:20px">
    <div class="accordion" id="accordionExample">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingOne">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            배송지
          </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
              <li class="nav-item" role="presentation">
                <a class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">최근 배송지</a>
              </li>
              <li class="nav-item" role="presentation">
                <a class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">직접 입력</a>
              </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                <a style="color: cornflowerblue; font-size: 18px; font-weight: bold;">기본</a> <span>${info.name}</span> 
                <div id="zonecode1">[${addr[0]}] <span>${addr[1]}${addr[2]}${addr[3]}</span> </div>
                <div>연락처 <span>${info.tel}</span></div>
              </div>
              <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
              	<div id="addrCheck">
	                <div class="form-check form-check-inline">
	                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
	                  <label class="form-check-label" for="inlineRadio1">회원 정보와 동일</label>
	                </div>
	                <div class="form-check form-check-inline">
	                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
	                  <label class="form-check-label" for="inlineRadio2">새로운 배송지</label>
	                </div>
                </div>
                <p></p>
                <div id="addrInput">
	                <span class="badge bg-light text-dark" style="font-size: 18px;">받는 사람</span>
	                <input type="text" id="recipientName" value="${info.name}">
	                <p></p>
	                <span class="badge bg-light text-dark" style="font-size: 18px;">주소</span>
	                <input type="text" placeholder="우편번호" id="zonecode2">
	                <input type="button" value="주소찾기" id="findAddr">
	                <div>
	                  &emsp;&emsp;&emsp;&emsp;<input type="text" size="35" placeholder="도로명주소 또는 지번주소" id="addr">
	                </div>
	                &emsp;&emsp;&emsp;&emsp;<input type="text" placeholder="상세 주소란" id="detailAddr">    
	                <input type="text" placeholder="동" id="extraAddr">
	                <p></p>
	                <span class="badge bg-light text-dark" style="font-size: 18px;">연락처</span>
	                <input type="tel" id="tel" value="${info.tel}">
	                <p></p>
	                <span class="badge bg-light text-dark" style="font-size: 18px;">이메일</span>
	                <input type="email" id="email" value="${info.email}">
                </div>
              </div>
            </div>
          </div>
          <select class="form-select" aria-label="Default select example">
            <option selected>배송시 요청사항 선택(선택 사항)</option>
            <option value="1">배송 전에 미리 연락바랍니다.</option>
            <option value="2">부재 시 문 앞에 놓아주세요.</option>
            <option value="3">택배함에 보관해주세요.</option>
          </select>
        </div>
      </div>
    </div>

    <div class="accordion" id="accordionExample2">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingTwo">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
            주문상품
          </button>
        </h2>
        <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample2">
          <div class="accordion-body" id="orderlist">
            <table class="table table-striped">
              <tr>
                <td>번호</td>
                <td>이미지</td>
                <td>상품명</td>
                <td>수량</td>
                <td>가격</td>
                <td>배송비</td>
              </tr>
              <!-- 동적 테이블 들어와야 함. -->
              <tr>
                <td>1</td>
                <td>
                  <img src="images/product/a.png" width="80" height="80">
                </td>
                <td>
                  <a href="#">테라비코스 엔자임 워싱 파우더</a>
                </td>
                <td>1</td>
                <td>28,000원</td>
                <td>무료배송</td>
              </tr>
              <tr>
                <td>2</td>
                <td>
                  <img src="images/product/b.jpg" width="80" height="80">
                </td>
                <td>
                  <a href="#">맨 바이오 에센스 컨디셔닝 145ml</a>
                </td>
                <td>1</td>
                <td>
                  24,500원
                </td>
                <td>무료배송</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>

    <div class="accordion" id="accordionExample3">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingThree">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
            할인
          </button>
        </h2>
        <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample3">
          <div class="accordion-body">
            <div>적립금<p>(사용 가능: ${info.points}원)</p></div>
            <div class="input-group mb-3">
              <input type="text" class="form-control" placeholder="${info.points}원" aria-label="?" aria-describedby="button-addon">
              <button class="btn btn-outline-primary" type="button" id="button-addon">전액사용</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="accordion" id="accordionExample4">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingFour">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
            결제정보
          </button>
        </h2>
        <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour" data-bs-parent="#accordionExample4">
          <div class="accordion-body" id="paymentInfo">
            <p>주문상품
              <input type="text" placeholder="n원" style="float: right; text-align: right;" disabled>
            </p>
            <p>할인
              <input type="text" placeholder="n원" style="float: right; text-align: right;" disabled>
            </p>
            <p>배송비
              <input type="text" placeholder="n원" style="float: right; text-align: right;" disabled>
            </p>
            <span class="badge bg-primary" style="font-size: 18px;">총 결제 금액</span>
            <input type="text" placeholder="n원" style="float: right; text-align: right;" disabled>
          </div>
        </div>
      </div>
    </div>

    <div class="accordion" id="accordionExample5">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingFive">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
            결제수단
          </button>
        </h2>
        <div id="collapseFive" class="accordion-collapse collapse show" aria-labelledby="headingFive" data-bs-parent="#accordionExample5">
          <div class="accordion-body">
            <select class="form-select" aria-label="Default select example">
              <option selected>결제수단을 선택해주세요.</option>
              <option value="1">핸드폰 결제</option>
              <option value="2">카드 결제</option>
              <option value="3">무통장입금</option>
            </select>
            <br/>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
              <label class="form-check-label" for="flexCheckDefault">
                결제수단과 입력정보를 다음에도 사용
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="d-grid gap-2">
      <button class="btn btn-primary" type="button" id="payment">n원 결제하기</button>
    </div>
  </div>

</body>
</html>