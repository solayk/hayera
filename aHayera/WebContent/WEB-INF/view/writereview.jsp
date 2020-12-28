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
	background-color: #0d6efd;
	color: white;
	width : 200px;
	font-weight: bold;
	text-align: center;
	border-color: #0d6efd;
	
}
.body{
	font-family: inherit;
	margin: 0 auto;
	text-align: center;
}
.ta,.btn{
	text-align: center;
}
</style>
</head>
<body>


<input type="hidden" name="prod_no" id="prod_no" value="<%=request.getParameter("prod_no")%>">
<input type="hidden" name="order_no" id="order_no" value="<%=request.getParameter("order_no")%>">

	
		<div style="font-weight: bold; text-align: center;">점수를 선택해주세요</div>
		<div style="text-align: center"><input type='radio' name='rate' value='1'>1 
		<input type='radio' name='rate' value='2'>2
		<input type='radio' name='rate' value='3'>3
		<input type='radio' name='rate' value='4'>4
		<input type='radio' name='rate' value='5'>5
		</div>
		<br/>
	<div class="ta">	
	<textarea  class='contents' id='contents' placeholder="후기를 입력하세요" style="width:400px; height:100px; float: center;"></textarea>
	</div>
	<br/>
<div class="btn">
<input type="button" class="btnreview" value="작성완료" id='btnreview'>
</div>

<script type="text/javascript">

$('#btnreview').click(function () {

	$.ajax({
		url : "reviewWrite.do",
		data : { 'prod_no' : $('#prod_no').val(),
			'order_no' : $('#order_no').val(),
			'rate' :$('input[name="rate"]:checked').val(),
			'contents' : $('#contents').val()
		},
		success: function(data) {
			alert(data);
			window.self.close();
		},
		err : function(err) {
			console.log(err)
		}
	})
})

</script>


</body>
</html>
