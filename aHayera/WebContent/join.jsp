<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>회원가입</title>

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
	
	
	</head>
	
	<body>
		
	<div class="image-container set-full-height" style="background-color: lightblue">
	    <!--   HAYERA Branding   -->
	   
	         <div class="logo-container">
	            <div class="logo">
	                <img src="/aHayera/images/logo_only_transparent_small.png">
	            </div>
	            <div class="brand">
	                HAYERA
	            </div>
	        </div>


	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">

		            <!--      Wizard container        -->
		            <div class="wizard-container">

		                <div class="card wizard-card" data-color="orange" id="wizardProfile">
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
													<input name="name" type="text" class="form-control" placeholder="Andrew...">
												</div>
												<div class="form-group">
													<label>아이디 </label>
													<input id ="customer_id" name="customer_id" type="text" class="form-control" placeholder="Smith...">
													<input type="button" id='btn' value ='중복확인'>
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
													<input name ='gender'id="gender" type="radio" value="남성">남성
													<input name ='gender' type="radio" value="여성">여성
												</div>
												<div class="form-group">
													<label>생년월일 </label>
													<input name='birthday' type="date" class="form-control" >
												</div>
											</div>
											<div class="col-sm-10 col-sm-offset-1">
												<div class="form-group">
													<label>전화번호</label>
													<input name="tel" type="tel" class="form-control" placeholder="010-1234-5678">
												</div>
												<div class="form-group">
													<label>Email </label>
													<input name="email" type="email" class="form-control" placeholder="andrew@creative-tim.com">
												</div>
												<div class="form-group">
													<label>주소 </label>
													<input name="address" type="text" class="form-control" placeholder="상세주소">
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
		                                                    <i class="ti-paint-roller"></i>
															<p>민감성</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                         <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="skin" value="중성">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-paint-roller"></i>
															<p>중성</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                         <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="skin" value="악건성">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-paint-roller"></i>
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
$('#joinbtn').click(function () {

	$.ajax({
		type :'post',
		async :true,
		url : "join.do",
		contentType:'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
		data : {
			'customer_id':$('#customer_id').val(),
			'password':$('#password').val(),
			'name':$('#name').val(),
			'tel':$('#tel').val(),
			'email':$('#email').val(),
			'address':$('#address').val(),
			'birthday':$('#birthday').val(),
			'gender' : $('input[name="gender"]:checked').val()
			'skintype' :$('input[name="skin"]:checked').val()
			
		},
		sucess :function(result){
			
		},
		err : function(err){consol.log(err)}
		
	});  
})

</script>

</body>

</html>
