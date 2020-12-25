

// input 태그 내 숫자 입력 시 1000 자리마다 , 찍기
function numberWithCommas(x) {
	x = x.replace(/[^0-9]/g, '');   // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g, '');          // ,값 공백처리
	return x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 
}

// 리뷰 별점 표기
function starRating(rating, star) {
	if (rating >= 4.9) { star = 5; }
	else if (rating >= 4.3 && rating < 4.9) { star = 4.5; }
	else if (rating >= 3.8 && rating < 4.3) { star = 4; }
	else if (rating >= 3.3 && rating < 3.8) { star = 3.5; }
	else if (rating >= 2.8 && rating < 3.3) { star = 3; }
	else if (rating >= 2.3 && rating < 2.8) { star = 2.5; }
	else if (rating >= 1.8 && rating < 2.3) { star = 2; }
	else if (rating >= 1.3 && rating < 1.8) { star = 1.5; }
	else if (rating > 0 && rating < 1.3) { star = 1; }
	else star = 0;
	return star;
}



