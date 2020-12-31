<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
<style type="text/css">
.btnreview{
	background-color: #125288;
	color:white;
	padding: 5px;
	width : 200px;
	font-weight: bold;
	text-align: center;
	font-family: 'Noto Sans KR';
	font-size: 18px;
	height: 40px;
}
.body{
	font-family: inherit;
	margin: 0 auto;
	text-align: center;
}
.ta,.btn{
	text-align: center;
}
.contents{
	font-size: 15px;
	font-family: "맑은고딕";
}

.star {
	display: inline-block;
	width: 30px;
	height: 60px;
	cursor: pointer;
	}

.star_left {
	background: url("./images/star.png") no-repeat 0 0;
	background-size: 60px;
	margin-right: -3px;
			}

.star_right {
	background: url("./images/star.png") no-repeat -30px 0;
	background-size: 60px;
	margin-left: -3px;
			}

.star.on {
	background-image: url("./images/star_on.png");
		}

</style>
</head>
<body>

		<div style="font-weight: bold; text-align: center;"><h3>점수를 선택해주세요</h3></div>

		<div class="star-box" style="text-align: center;">
			<span class="star star_left"></span>
			<span class="star star_right"></span>

			<span class="star star_left"></span>
			<span class="star star_right"></span>

			<span class="star star_left"></span>
			<span class="star star_right"></span>

			<span class="star star_left"></span>
			<span class="star star_right"></span>

			<span class="star star_left"></span>
			<span class="star star_right"></span>
		</div>


<input type="hidden" name="prod_no" id="prod_no" value="<%=request.getParameter("prod_no")%>">
<input type="hidden" name="order_no" id="order_no" value="<%=request.getParameter("order_no")%>">


		<br/>
	<div class="ta">	
	<textarea  class='contents' id='contents' placeholder="후기를 입력하세요" style="width:400px; height:100px; float: center;"></textarea>
	</div>
	<br/>
<div class="btn">
<input type="button" class="btnreview" value="작성완료" id='btnreview'>
</div>

<script type="text/javascript">


$(document).ready(function () {
	var idx=0;
	$(".star").on('click', function () {
		idx = $(this).index();
		$(".star").removeClass("on");
	
		for (var i = 0; i <= idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		
	});


$('#btnreview').click(function () {
 var rate = (idx+1) /2;
	$.ajax({
		url : "reviewWrite.do",
		data : { 'prod_no' : $('#prod_no').val(),
			'order_no' : $('#order_no').val(),
			'rate' : rate,
			'contents' : $('#contents').val()
		},
		success: function(data) {
			alert(data);
			opener.location.href = "orderHistory.do";
			window.self.close();
		},
		err : function(err) {
			console.log(err)
		}
	})
})
});
</script>


</body>
</html>
