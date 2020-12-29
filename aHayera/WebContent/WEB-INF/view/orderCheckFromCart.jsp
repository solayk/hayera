<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
    <!-- 하예라 전용 JS Files   -->
    <script src="./js/hayera.js"></script>
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
    // 주문/결제 페이지 내 숫자 표시에 사용한 변수.
   	var point = ${info.points}; // 보유 적립금
   	var points = point.formatNumber(); // 적립금의 세자리 단위 쉼표 형식
   	
    //Jquery 시작
    $(function () {
    	// 배송지_ '새로운 배송지' 선택 시 입력값 초기화.
    	$("#addrCheck input").on('change', function () {
			if($('input[name="inlineRadioOptions"]:checked', '#addrCheck').val()=="option2"){
				$('input[type="text"]','#addrInput').val("");
				$('input[type="tel"]','#addrInput').val("");
				$('input[type="email"]','#addrInput').val("");
			// 배송지_ '회원 정보와 동일' 선택 시 회원 정보 받아와 채우기.
			}else{
				$("#recipientName").val("${info.name}");
				$("#zonecode").val("${addr[0]}");
				$("#addr").val("${addr[1]}");
				$("#detailAddr").val("${addr[2]}");
				$("#extraAddr").val("${addr[3]}");
				$('input[type="tel"]','#addrInput').val("${info.tel}");
				$('input[type="email"]','#addrInput').val("${info.email}");
			}
		});
    	
    	// 장바구니 상품 목록 출력 ajax
    	$.ajax({
            type: 'post',
            url: 'orderListFromCart.do',
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            success: function (data) {
            	
            	var order_price = 0;
            	var discount_price = 0;
            	
            	for (i = 0; i < data.length; i++) {
            		
					order_price += data[i].price * data[i].each_qty;
            		discount_price += (data[i].price - data[i].sales_price)*data[i].each_qty;
       		    	
            		var totalPrice = (data[i].sales_price * data[i].each_qty).formatNumber();
            		var sales_revenue = data[i].sales_price - data[i].sales_cost;
            		
            		$("#orderProduct").append(
            	    		'<tr>'
            	    		+ '<td>' + (i+1) + '</td>' 
            	    		+ '<td><img src="/aHayera/resources/upload/' + data[i].img_url + '" style="width:50px;"></td>'
            	    		+ '<td>' + data[i].prod_name + '</td>'
            	    		+ '<td>' + data[i].each_qty + '</td>'
            	    		+ '<td>' + totalPrice +'원</td>'
            	    		+ '<td>' + '무료배송' + '</td>'
            	    		+ '<input type="hidden" name="order_ProductVOList[' + i + '].sales_price" value="' + data[i].sales_price + '">'
            	    		+ '<input type="hidden" name="order_ProductVOList[' + i + '].sales_cost" value="' + data[i].sales_cost + '">'
            	    		+ '<input type="hidden" name="order_ProductVOList[' + i + '].sales_revenue" value="' + sales_revenue + '">'
            	    		+ '<input type="hidden" name="order_ProductVOList[' + i + '].prod_no" value="' + data[i].prod_no + '">'
            	    		+ '<input type="hidden" name="order_ProductVOList[' + i + '].each_qty" value="' + data[i].each_qty + '">'
            	    		+ '</tr>'
            	    	);
            	}
            	$("#order_price").val(order_price); // form에서 가져갈 데이터임.(DB orderlist 테이블의 order_price에 들어갈 값) = (product의 price * 각 주문 수량)의 합
            	$("#discount_price").val(discount_price); // form에서 가져갈 데이터임.(DB orderlist 테이블의 discount_price에 들어갈 값) = (product 의 price - discount_price)*각 주문 수량 의 합
            },
            error: function (e) {
              alert(e);
            }
          }); // --- end of $.ajax 장바구니 상품 목록 출력
          
    	/* <c:set var = "priceSum" value = "0" />
    	<c:forEach items="${list}" var="list" varStatus="status"> */
    	/*var sales_price = ${list.sales_price};
    	var sales_cost = ${list.sales_cost};
     	var sales_revenue = sales_price - sales_cost;*/
     	
    	/* var each_qty = ${list.each_qty};
    	var x = sales_price * each_qty;
    	var totalPrice = x.formatNumber();
    	
	    	$("#orderProduct").append(
	    		'<tr>'
	    		+ '<td>'+ '${status.count}' + '</td>' 
	    		+ '<td><img src="/aHayera/resources/upload/${list.img_url}" width="80" height="80"></td>'
	    		+ '<td>'+ '${list.prod_name}' +'</td>'
	    		+ '<td>'+ '${list.each_qty}' +'</td>'
	    		+ '<td>'+ totalPrice +'원</td>'
	    		+ '<td>'+'무료배송'+'</td>'
	    		+ '<input type="hidden" name="order_ProductVOList[' + ${status.index} + '].sales_price" value="${list.sales_price}">'
	    		+ '<input type="hidden" name="order_ProductVOList[' + ${status.index} + '].sales_cost" value="${list.sales_cost}">'
	    		+ '<input type="hidden" name="order_ProductVOList[' + ${status.index} + '].sales_revenue" value="${list.sales_price}-${list.sales_cost}">'
	    		+ '<input type="hidden" name="order_ProductVOList[' + ${status.index} + '].prod_no" value="${list.prod_no}">'
	    		+ '<input type="hidden" name="order_ProductVOList[' + ${status.index} + '].each_qty" value="${list.each_qty}">'
	    		+ '</tr>'
	    	); */
	    	/*
	    	// form에서 가져갈 데이터임.(DB orderlist_product 테이블의 sales_price에 들어갈 값)
	    	$("input[name=sales_price]").val(${list.sales_price});
	       	// form에서 가져갈 데이터임.(DB orderlist_product 테이블의 sales_cost에 들어갈 값)
	       	$("input[name=sales_cost]").val(${list.sales_cost});
	       	// form에서 가져갈 데이터임.(DB orderlist_product 테이블의 sales_revenue에 들어갈 값)
	       	$("input[name=sales_revenue]").val(sales_revenue);
	     	// form에서 가져갈 데이터임.(DB orderlist_product 테이블의 prod_no에 들어갈 값)
	       	$("input[name=prod_no]").val(${list.prod_no});
	     	// form에서 가져갈 데이터임.(DB orderlist_product 테이블의 each_qty에 들어갈 값)
	       	$("input[name=each_qty]").val(${list.each_qty});
	     	*/
	    	/* <c:set var= "priceSum" value="${priceSum + list.sales_price*list.each_qty}"/>
    	</c:forEach>
    	<c:out value="${priceSum}"/> */
           	
    	// 주문/결제 페이지 떴을 때 기본적으로 입력되어 있을 계산 금액.
    	$("#priceSum").val("${priceSum}원");  // 결제정보_주문상품 금액 란
    	$("#totalSum").val("${priceSum}원"); // 결제정보_총 결제 금액 란
    	$("#payment").val("${priceSum}원 결제하기"); // 최하단 submit 쪽 value    	
    	
    	// 적립금 입력 안했을 때, form에서 가져갈 데이터 오류 안나도록 처리.
    	$("#point_use").val(0);
    	$("#payment_price").val(${priceSum});
    	
    	// 적립금 '전액사용' 버튼 클릭 시 보유한 적립금 중 주문상품 금액 만큼만 입력됨 + 총 결제 금액에 계산되게
    	$("#button-addon").on('click',function(){
    		$(".form-control").val(point);
    		if($(".form-control").val() > ${priceSum}){
    			alert("주문상품 금액에 맞춰 최대 적립금이 사용됩니다.");
    			$(".form-control").val(${priceSum});
    			$("#discount").val(${priceSum}+"원");
    			$("#totalSum").val(0+"원");
    			$("#payment").val(0+"원 결제하기");
        		$("#point_use").val(${priceSum}); // form에서 가져갈 데이터임.(DB orderlist 테이블의 point_use에 들어갈 값)
        		$("#payment_price").val(0); // form에서 가져갈 데이터임.(DB orderlist 테이블의 payment_price에 들어갈 값)
    		}else{
	    		$("#discount").val(points+"원");
	    		$("#point_use").val(point); // form에서 가져갈 데이터임.(DB orderlist 테이블의 point_use에 들어갈 값)
	    		var money = ${priceSum} - point;
	    		var totalSum = money.formatNumber();
	    		$("#totalSum").val(totalSum+"원");
	    		$("#payment").val(totalSum+"원 결제하기");
	    		$("#payment_price").val(money); // form에서 가져갈 데이터임.(DB orderlist 테이블의 payment_price에 들어갈 값)
    		}
    	});
    	
    	// 적립금 입력값에 따라 결제정보_할인 란에 금액 적용되게 + 총 결제 금액에 계산되게 + 보유 적립금 이상 입력 못하게 + 주문상품 금액 이상 적립금 입력 못하게
    	$(".form-control").on('change', function () {
    		var pointUse = $(".form-control").val();
    		if(pointUse>point){
    			alert("사용 가능한 적립금은 최대 "+points+"원 입니다.")
    			$(".form-control").val(0);
    			$("#discount").val(0+"원");
    			$("#totalSum").val(${priceSum}+"원");
	    		$("#payment").val(${priceSum}+"원 결제하기");
    		}else if(pointUse > ${priceSum}){
    			alert("주문상품 금액 이상 적립금을 사용하실 수 없습니다.")
    			$(".form-control").val(${priceSum});
    			$("#discount").val(${priceSum}+"원");
    			$("#totalSum").val(0+"원");
        		$("#payment").val(0+"원 결제하기");
        		$("#point_use").val(${priceSum}); // form에서 가져갈 데이터임.(DB orderlist 테이블의 point_use에 들어갈 값)
        		$("#payment_price").val(0); // form에서 가져갈 데이터임.(DB orderlist 테이블의 payment_price에 들어갈 값)
    		}else{
				$("#discount").val(pointUse+"원");
				var money = ${priceSum} - pointUse;
				var totalSum = money.formatNumber();
				$("#point_use").val(pointUse); // form에서 가져갈 데이터임.(DB orderlist 테이블의 point_use에 들어갈 값)
				$("#totalSum").val(totalSum+"원");
	    		$("#payment").val(totalSum+"원 결제하기");
	    		$("#payment_price").val(money); // form에서 가져갈 데이터임.(DB orderlist 테이블의 payment_price에 들어갈 값)
    		}
    		
		});
    	
    	// 결제 버튼 클릭 시
        $("#payment").click(function(){
        	var pointUse = $(".form-control").val();
        	var money = ${priceSum} - pointUse;
        	var totalSum = money.formatNumber();
        	confirm(totalSum+"원 결제하시겠습니까?");
        });
    
       	
	})
    </script>
</head>
<body>
<div id="navbar-full" style="background-image: url(images/main_background_top.png);">
    <div id="navbar">
      <nav class="navbar navbar-ct-blue navbar-fixed-top navbar-transparent" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <a class="navbar-brand navbar-brand-logo" href="main.jsp">
              <div class="logo">
                <img src="images/logo_only_transparent_small.png">
              </div>
              <div class="brand">HAYERA _ 주문/결제</div>
            </a>
          </div>
		    <!-- 주문/결제 페이지 상단에 내 계정 표시 (보류)
		    <ul class="nav navbar-nav navbar-right">
		    	<li class="dropdown">
		        	<a href="#" class="dropdown-toggle">
			      		<i class="pe-7s-user"></i>
			      		<p>내 계정 <b class="caret"></b></p>
			   		</a>
			    <ul class="dropdown-menu">
			      mainAfterLogin 에만 해당
			      <li><a href="mypage.do">마이페이지</a></li>
			      <li><a href="orderHistory.do">주문 내역</a></li>
			      <li><a href="logout.do">로그아웃</a></li>
			    </ul>
			  	</li>
		  	</ul>
		  	-->
        </div>
      </nav>
    </div>
</div>
<form action="paymentCompleteCart.do" method="post" name="pay">  
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
                <a class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">기본 배송지</a>
              </li>
              <li class="nav-item" role="presentation">
                <a class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">직접 입력</a>
              </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                <span style="color: cornflowerblue; font-size: 18px; font-weight: bold;">받는 사람</span> <span style="font-weight: bold;">${info.name}</span><br/> 
                <span style="color: cornflowerblue; font-size: 18px; font-weight: bold;">주소</span> <span style="font-weight: bold;">[${addr[0]}] ${addr[1]} ${addr[2]} ${addr[3]}</span><br/>
                <span style="color: cornflowerblue; font-size: 16px; font-weight: bold;">연락처</span> <span style="font-weight: bold;">${info.tel}</span>
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
	                <input type="text" id="recipientName" name="receive" value="${info.name}">
	                <p></p>
	                <span class="badge bg-light text-dark" style="font-size: 18px;">주소</span>
	                <input type="text" placeholder="우편번호" id="zonecode" name="zonecode" value="${addr[0]}">
	                <input type="button" value="주소찾기" id="findAddr">
	                <div>
	                  &emsp;&emsp;&emsp;&emsp;<input type="text" size="35" placeholder="도로명주소 또는 지번주소" id="addr" name="addr" value="${addr[1]}">
	                </div>
	                &emsp;&emsp;&emsp;&emsp;<input type="text" placeholder="상세 주소란" id="detailAddr" name="detailAddr" value="${addr[2]}">    
	                <input type="text" placeholder="동" id="extraAddr" name="extraAddr" value="${addr[3]}">
	                <p></p>
	                <span class="badge bg-light text-dark" style="font-size: 18px;">연락처</span>
	                <input type="tel" id="tel" name="tel" value="${info.tel}">
	                <p></p>
	                <span class="badge bg-light text-dark" style="font-size: 18px;">이메일</span>
	                <input type="email" id="email" name="email" value="${info.email}">
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
            <table class="table table-striped" id="orderProduct" style="vertical-align: middle;">
                <tr>
                <th>번호</th>
                <th>이미지</th>
                <th>상품명</th>
                <th>수량</th>
                <th>가격</th>
                <th>배송비</th>
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
            <div>적립금<p>(보유: <span style="font-weight: bold;">${info.points}원</span>)</p></div>
            <div class="input-group mb-3">
              <input type="text" class="form-control" aria-label="?" aria-describedby="button-addon" name="usedPoints" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
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
              <input type="text" style="float: right; text-align: right;" id="priceSum" disabled>
              <!-- '주문금액 = 제품 금액*수량' 이, orderlist 테이블의 order_price 컬럼에 저장되게함. ok -->
              <input type="hidden" id="order_price" name="order_price">
            </p>
            <p>할인
              <input type="text" placeholder="0원" style="float: right; text-align: right;" id="discount" disabled>
              <!-- '할인금액 = (제품 금액 - 할인가)*수량' 이, orderlist 테이블의 discount_price 컬럼에 저장되게함. ok -->
              <input type="hidden" id="discount_price" name="discount_price">
            </p>
            <p>배송비
              <input type="text" placeholder="0원" style="float: right; text-align: right;" id="deliveryCharge" disabled>
              <!-- '배송비 = ' 이, orderlist 테이블의 delivery_price 컬럼에 저장되게함.-->
              <!-- <input type="hidden" value="" name="delivery_price"> -->
            </p>
            <span class="badge bg-primary" style="font-size: 18px; font-weight: bold;">총 결제 금액</span>
            <input type="text" style="float: right; text-align: right;" id="totalSum" disabled>
            
            <!-- '결제 금액 = 제품 금액(할인가)*수량 - 포인트 사용액' 이, orderlist 테이블의 payment_price 컬럼에 저장되게함. ok -->
            <input type="hidden" id="payment_price" name="payment_price">
            
            <!-- '적립금 사용액 = '적립금 사용액' 이, orderlist 테이블의 point_use 컬럼에 저장되게함.-->
            <input type="hidden" id="point_use" name="point_use">
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
      <input class="btn btn-primary" type="submit" id="payment"></button>
    </div>
  </div>
</form>
</body>
</html>