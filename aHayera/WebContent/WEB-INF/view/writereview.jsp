<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<body>


<input type="hidden" name="prod_no" id="prod_no" value="<%=request.getParameter("prod_no")%>">
<input type="hidden" name="order_no" id="order_no" value="<%=request.getParameter("order_no")%>">
<table border="1" width='700px'>
	<tr height='50px'>
		<th bgcolor="lightblue" width='200px'>점수를 선택해주세요</th>
		<td><input type='radio' name='rate' value='1'>1 
		<input type='radio' name='rate' value='2'>2
		<input type='radio' name='rate' value='3'>3
		<input type='radio' name='rate' value='4'>4
		<input type='radio' name='rate' value='5'>5
		</td>
	</tr>

	<tr height='200px'>
		<th bgcolor="lightblue" width='200px'>상품 후기를 남겨주세요</th>
		<td>
	<textarea  name='contents' id='contents' placeholder="입력하세요" style="width:500px; height:200px"></textarea>
	
	</td>	
	</tr>
	</table>

<input type="button" value="작성완료" id='btnreview'>


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
