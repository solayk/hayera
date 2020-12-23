

// input 태그 내 숫자 입력 시 1000 자리마다 , 찍기
function numberWithCommas(x) {
	x = x.replace(/[^0-9]/g, '');   // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g, '');          // ,값 공백처리
	return x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 
}

