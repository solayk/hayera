

// input 태그 내 숫자 입력 시 1000 자리마다 , 찍기
function numberWithCommas(x) {
  x = x.replace(/[^0-9]/g, '');   // 입력값이 숫자가 아니면 공백
  x = x.replace(/,/g, '');          // ,값 공백처리
  return x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 
}

// 숫자 3자리 단위로 콤마를 찍어주는 함수_ .formatNumber()로 사용.
Number.prototype.formatNumber = function () {
  if (this == 0) return 0;
  let regex = /(^[+-]?\d+)(\d{3})/;
  let nstr = (this + '');
  while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
  return nstr;
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

function productListing(loc, data, star, discount, mlprice) {
  $(loc).append(
    '<li style="margin:2px;">' + '<a href="productSelected.do?prod_no=' + data[i].prod_no + '">'
    + '<div class="item-img" style="position:relative;">'
    + (data[i].discount_price == '0' ? '' : '<div style="position:absolute; float:left; width:50px; height:48px; text-align:center; background-color:#084A83; color:white; padding-top:2px;">SAVE<br><span style="font-size:22px; line-height:90%;">' + discount + '</span>%</div>')
    + '<img src="/aHayera/resources/upload/' + data[i].img_url + '"></div>'
    + '<div class="item-brand">' + data[i].brand + '</div>'
    + '<div class="item-info" style="width:220px; height:160px;"><div class="item-title">' + data[i].prod_name + '</div></a>'
    + '<div class="item-reviewno"><img src="./images/star_' + star + '.png"> ' + data[i].avg_rating + '</div>'
    + (data[i].discount_price == '0' ? /* 할인 여부에 따라 가격 표시 다르게 */
      '<span class="item-price">' + data[i].price.formatNumber() + '원</span>'
      : '<span class="item-discount_price">' + data[i].discount_price.formatNumber() + '원 </span><span class="item-price" style="color:#BFBFBF; font-size: 15px;"><del>' + data[i].price.formatNumber() + '원</del></span>')
    + '<div class="item-capacity">' + data[i].capacity + ' ml, ml당 ' + mlprice + ' 원</div>'
    + '</li>'
  )
}


// 장바구니 화면에 표시하기
function cartListing(loc, data, price) {
  $(loc).append(
    '<tr>' + '<td style="display: none;">' + data[i].prod_no + '</td>'
    + '<td>' + '<img src="/aHayera/resources/upload/' + data[i].img_url + '" width="55" height="55">' + '</td>'
    + '<td>' + '<a href="#">' + data[i].prod_name + '</a>' + '</td>'
    + '<td>' + data[i].each_qty + ' 개' + ' <button type="button" class="btn btn-primary btn-xs" id="countUp">'
    + '<span class="glyphicon glyphicon-chevron-up"></span>' + '</button>'
    + '<button type="button" class="btn btn-primary btn-xs" id="countDown">'
    + '<span class="glyphicon glyphicon-chevron-down"></span>' + '</button>' + '</td>'
    + '<td>' + data[i].sales_price.formatNumber() + '원</td>'
    + '<td>' + price.formatNumber() + '원</td>'
    + '<td>' + '<button type="button" class="btn btn-danger btn-xs" id="cartRemove">'
    + '<span class="glyphicon glyphicon-remove"></span>'
    + '</button>' + '</td>'
    + '</tr>'
  )

}

