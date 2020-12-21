<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>별점 테스트</title>
		<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
		<script type="text/javascript">

			$(document).ready(function () {
				$(".star").on('click', function () {
					var idx = $(this).index();
					$(".star").removeClass("on");
					for (var i = 0; i <= idx; i++) {
						$(".star").eq(i).addClass("on");
					}
				});
			});

		</script>
		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
			}

			.star {
				display: inline-block;
				width: 30px;
				height: 60px;
				cursor: pointer;
			}

			.star_left {
				background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0;
				background-size: 60px;
				margin-right: -3px;
			}

			.star_right {
				background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -30px 0;
				background-size: 60px;
				margin-left: -3px;
			}

			.star.on {
				background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
			}
		</style>
	</head>


	<body>
		<div class="star-box">
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
	</body>

	</html>