<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAYERA를 이용해주셔서 감사합니다.</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 부트스트랩 5.0 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
    <script src="https:/cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function clickGohome(){
            window.opener.location.href="main.jsp";
            self.close();
        };
        function clickGoHistory(){
            window.opener.location.href="orderHistory.jsp";
            self.close();
        };
    </script>
</head>
<body>
	<div class="card" style="width: 30rem; height: 26.5rem;">
    	<p></p><p></p>
        <img src="images/complete.PNG" class="card-img-top" alt="...">
        <div class="card-body" style="text-align: center; margin-top: 50px;">
          <a class="btn btn-primary btn-lg" onclick="clickGohome()">홈으로</a>
          <a class="btn btn-success btn-lg" onclick="clickGoHistory()">주문내역보기</a>
        </div>
	</div>
</body>
</html>