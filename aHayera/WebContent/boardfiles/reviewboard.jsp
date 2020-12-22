<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="detail-board-content">
<input type="button" value="리뷰 작성하기" id="writereview">
						<div class="detail-review-filter">
							<ul class="detail-radio-filter" role="radiogroup">
								<li class="detail-filter" role="presentation">
									<a href="" class="detail-filter:highsale" role="radio" aria-checked="true">최신순 /</a></li>
								<li class="detail-filter" role="presentation">
									<a href="" class="detail-filter:highreview" role="radio" aria-checked="false">평점 높은순 /</a></li>
								<li class="detail-filter" role="presentation">
									<a href="" class="detail-filter:lowreview" role="radio" aria-checked="false">평점 낮은순</a></li>
							</ul>
						</div>
						<div style="clear: both;"></div>
						</div>
						
						<ul>
							<li class="detail-review-list">
								<div class="list-item">
									<div class="user">
										<div class="user-info">
											<p class="txt">
												<span class="name"><span class="user-name">로니카</span>
												</span> <span class="info"><span class="txt">30세
														· 복합성 </span> </span>
											</p>
										</div>
									</div>
									<p class="review">순하고 좋은거 같아요 몸에도 바르는데 촉촉하고 무향인게 맘에듭니다</p>
								</div>
							</li>
						</ul>
							<div id="reviewgo"></div>
						
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script type="text/javascript">

//리뷰 작성하기 누르면 작성할 수 있는 textarea나오기 + 로그인여부확인
$('#writereview').click(function(){
	var id  = '<%=(String)session.getAttribute("login")%>';
	
	$.ajax({
		
		url :"/aHayera/boardfiles/writereview.jsp?prod_no=<%=request.getParameter("prod_no")%>",
		success : function(data){
			if(id=='null'){
				location.replace("login.do");
			
			}else{
				
				$('#reviewgo').html(data);
				
			}
			
		},
		err: function(err){console.log(err)}
	})
})


</script>

</body>
</html>
