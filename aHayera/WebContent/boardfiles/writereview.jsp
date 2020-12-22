<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="reviewgo.do?prod_no=1">

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
	<textarea  name='contents' placeholder="입력하세요" style="width:500px; height:200px">
	</textarea>
	</td>	
	</tr>
	</table>

<input type="submit" value="작성완료">
</form>


</body>
</html>
