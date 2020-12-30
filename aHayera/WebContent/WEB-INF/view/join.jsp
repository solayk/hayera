<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<!-- 타이틀 바 -->
    <link rel="shortcut icon" type="image/x-icon" href="images/logo_only_transparent_small.png" >
	<title>하예라 - 회원가입</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


	<!-- CSS Files -->
    <link href="/aHayera/css/bootstrap.min_join.css" rel="stylesheet" />
	<link href="/aHayera/css/join.css" rel="stylesheet" />
	

	<!-- Fonts and Icons -->
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
	<link href="/aHayera/css/join_themify-icons.css" rel="stylesheet">
	
	
	<!--   Core JS Files   -->
	<script src="/aHayera/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<script src="/aHayera/js/bootstrap.min_join.js" type="text/javascript"></script>
	<script src="/aHayera/js/jquery.bootstrap.wizard_join.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="/aHayera/js/demo_join.js" type="text/javascript"></script>
	<script src="/aHayera/js/paper-bootstrap-wizard_join.js" type="text/javascript"></script>

	<!--  More information about jquery.validate here: https://jqueryvalidation.org/	 -->
	<script src="/aHayera/js/jquery.validate.min.js" type="text/javascript"></script>

 	<!-- 주소 찾기 + 스크롤, 버튼 등.. -->
    <script src="js/orderCheckScripts.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	</head>
	
	<body>
		
	<div class="image-container set-full-height" style="background-color: lightblue">
	    <!--   HAYERA Branding   -->
	   
	         <div class="logo-container">
	            <div class="logo" >
	            <a href="main.jsp">
	                <img src="/aHayera/images/logo_only_transparent_small.png">
	            </div>
	            </a>
	            <div class="brand">HAYERA</div>
	            
	        </div>


	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">

		            <!--      Wizard container        -->
		            <div class="wizard-container">

		                <div class="card wizard-card" data-color="blue" id="wizardProfile">
		                    <form action="" method="">
		                <!--        You can switch " data-color="orange" "  with one of the next bright colors: "blue", "green", "orange", "red", "azure"          -->

		                    	<div class="wizard-header text-center">
		                        	<h3 class="wizard-title">회원가입</h3>
									<p class="category">회원가입에 필요한 당신의 정보를 적어주세요.</p>
		                    	</div>

								<div class="wizard-navigation">
									<div class="progress-with-circle">
									     <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="3" style="width: 21%;"></div>
									</div>
									<ul>
			                            <li>
											<a href="#about" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-user"></i>
												</div>
												기본정보
											</a>
										</li>
			                            <li>
											<a href="#account" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-settings"></i>
												</div>
												추가정보
											</a>
										</li>
			                            <li>
											<a href="#address" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-map"></i>
												</div>
												가입완료
											</a>
										</li>
			                        </ul>
								</div>
		                        <div class="tab-content">
		                            <div class="tab-pane" id="about">
		                            	<div class="row">
											<div class="col-sm-10 col-sm-offset-1">
												<div class="form-group">
													<label>이름</label>
													<input name="name" id="name" type="text" class="form-control" placeholder="Andrew...">
												</div>
												<div class="form-group">
													<label>아이디 </label>
													<input id ="customer_id" name="customer_id" type="text" class="form-control" placeholder="Smith...">
													<div id='idCheckResult' style="width:200px;color:red"></div>
												</div>
												<div class="form-group">
													<label>비밀번호 </label>
													<input name="password" id="password"type="password" class="form-control" placeholder="문자, 숫자, 특수문자조합으로 8자리 이상">
												</div>
												<div class="form-group">
													<label>비밀번호확인</label>
													<input id="passwordconfirm" name="passwordconfirm" type="password" class="form-control" placeholder="문자, 숫자, 특수문자조합으로 8자리 이상">
												</div>
												<div class="form-group">
													<label>성별  </label>
													<input name ='gender' type="radio" value="남성">남성
													<input name ='gender' type="radio" value="여성">여성
												</div>
												<div class="form-group">
													<label>생년월일 </label>
													<input name='birthday' id='birthday' type="date" class="form-control" >
												</div>
											</div>
											<div class="col-sm-10 col-sm-offset-1">
												<div class="form-group">
													<label>전화번호</label>
													<input name="tel" type="tel" id='tel'class="form-control" placeholder="010-1234-5678">
												</div>
												<div class="form-group">
													<label>Email </label>
													<input id='email' name="email" type="email" class="form-control" placeholder="andrew@creative-tim.com">
												</div>
												<div class="form-group">
													<label>주소 </label>
                									<input type="button" value="주소찾기" id="findAddr">
													<input type="text" placeholder="우편번호" id="zonecode" class="form-control">
               										<div>
                  										&emsp;&emsp;&emsp;&emsp;<input type="text" size="35" placeholder="도로명주소 또는 지번주소" id="addr" class="form-control">
                									</div>
               											&emsp;&emsp;&emsp;&emsp;<input type="text" placeholder="상세 주소란" id="detailAddr" class="form-control">    
                									<input type="text" placeholder="동" id="extraAddr" class="form-control">
												</div>
											</div>
										</div>
		                            </div>
		                            <div class="tab-pane" id="account">
		                                <h5 class="info-text"> 당신의 피부 타입은? </h5>
		                                <div class="row">
		                                    <div class="col-sm-8 col-sm-offset-2">
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="skin" value="건성">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-paint-roller"></i>
															<p>건성</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="skin" value="지성">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-pencil-alt"></i>
															<p>지성</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="skin" value="복합성">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-star"></i>
															<p>복합성</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                         <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="skin" value="민감성">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-heart"></i>
															<p>민감성</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                         <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="skin" value="중성">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-camera"></i>
															<p>중성</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                         <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="skin" value="악건성">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-world"></i>
															<p>악건성</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="tab-pane" id="address">
		                                <div class="row">
		                                    <div class="col-sm-12">
		                                        <h5 class="info-text"></h5>
		                                        <h5 class="info-text">HAYERA의 가족이 되신 것을 환영합니다!</h5>
		                                    </div>
		                                    
		                                </div>
		                            </div>
		                        </div>
		                        <div class="wizard-footer">
		                            <div class="pull-right">
		                                <input type='button' class='btn btn-next btn-fill btn-warning btn-wd' name='next' value='Next' />
		                                <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd' name='finish' value='Finish' id='joinbtn'/>
		                            </div>

		                            <div class="pull-left">
		                                <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
		                            </div>
		                            <div class="clearfix"></div>
		                        </div>
		                    </form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	    	</div><!-- end row -->
		</div> <!--  big container -->

	   
		
	</div>
<script type="text/javascript">
// 주소 찾기
$("#findAddr").click(function(){
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
      
      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ''; // 주소 변수
      var extraAddr = ''; // 참고항목 변수
      
      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else { // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }
      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
      if(data.userSelectedType === 'R'){
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
          extraAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraAddr !== ''){
          extraAddr = ' (' + extraAddr + ')';
        }
        // 조합된 참고항목을 해당 필드에 넣는다.
        $("#extraAddr").val(extraAddr);
      } else {
        $("#extraAddr").val('');
      }
      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      $("#zonecode").val(data.zonecode);
      $("#addr").val(addr);
      // 커서를 상세주소 필드로 이동한다.
      $("#detailAddr").focus();
      // 창 닫기
      self.close();
    }
  })
});

$('#joinbtn').click(function () {
	
	
	$.ajax({
		type :'post',
		async :true,
		url : "joingo.do",
		contentType:'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
		data : {
			'customer_id':$('#customer_id').val(),
			'password':$('#password').val(),
			'name':$('#name').val(),
			'tel':$('#tel').val(),
			'email':$('#email').val(),
			'address':$('#zonecode').val() +"/"+$('#addr').val()+"/"+$('#detailAddr').val()+"/"+$('#extraAddr').val(),
			'birthday':$('#birthday').val(),
			'gender' : $('input[name="gender"]:checked').val(),
			'skintype' :$('input[name="skin"]:checked').val()
			
		},
		success :function(result){
			if(result==1){
				location.replace("main.jsp");
			}
		},
		err : function(err){consol.log(err)}
		
	});  
})

$('#customer_id').focusout(function(){
	
	if($('#customer_id').val().length<3){
		$('#idCheckResult').text('사용불가합니다.');
	}else{
		
	$.ajax({
		type: 'post', //전송방식
    	async : true, //비동기통신
    	url : 'idCheck.do', // ***요청(request)
    	contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
    	data :{'customer_id': $('#customer_id').val()}, //보내는 데이타
    	success : function(result){
    		$('#idCheckResult').text(result);
    	},
    	error: function(err){console.log(err);}
	});
	}
})



</script>

</body>

</html>
