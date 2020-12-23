<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="update_pw.do">
현재 비밀번호 <input name="password" type="text"/><br/>
새 비밀번호 <input name="password_new" type="text"/><br/>
<input type="hidden" name="customer_id" value="${id.customer_id}"/>
<span><input type="submit" value="변경"/></span>
<a href="mypage.do"><input type="button" value="취소"/></a>
 </form>


</body>
</html>