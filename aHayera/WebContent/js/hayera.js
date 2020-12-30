

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
    + (data[i].discount_price == '0' ? '' : '<div class="discountCard">SAVE<br><span class="discountCardFont">' + discount + '</span>%</div>')
    + '<div class="hayeraImgBox"><img src="/aHayera/resources/upload/' + data[i].img_url + '"></div></div>'
    + '<div class="item-brand">' + data[i].brand + '</div>'
    + '<div class="item-info" style="width:220px; height:160px;"><div class="item-title">' + data[i].prod_name + '</div></a>'
    + '<div class="item-reviewno"><img src="./images/star_' + star + '.png"><span>' + data[i].avg_rating + '</span></div>'
    + (data[i].discount_price == '0' ? /* 할인 여부에 따라 가격 표시 다르게 */
      '<span class="item-price">' + data[i].price.formatNumber() + '원</span>'
      : '<span class="item-price"><del>' + data[i].price.formatNumber() + '원</del></span><span class="item-discount_price"><span class="emph">→</span>' + data[i].discount_price.formatNumber() + '원 </span>')
    + '<div class="item-capacity">' + data[i].capacity + ' ml <span class="item-price-ml">(ml당 ' + mlprice + ' 원)</span></div>'
    + '</li>'
  )
}

// 장바구니 가져오기 
function refreshCart() {
  $.ajax({
    type: 'post',
    url: 'viewCart.do',
    dataType: 'json',
    contentType: 'application/x-www-form-urlencoded;charset=utf-8',
    success: function (data) {

      $(".main_cart").empty();

      var priceSum = 0;

      if (data.length == 0) {
        $('#cartSizeIcon > span').hide();
        $('#cartSize').text("");
      }
      else {
        $('#cartSizeIcon').show();
        $('#cartSize').text(data.length);
      }

      $(".main_cart").append('<tr><th>이미지</th><th>상품명</th><th>수량</th><th>가격</th><th>합계</th><th>삭제</th></tr>');

      for (i = 0; i < data.length; i++) {
        var price = data[i].sales_price * data[i].each_qty;
        priceSum += data[i].sales_price * data[i].each_qty;
        cartListing(".main_cart", data, price);
      }
      $('#cartSumPrice').text(priceSum.formatNumber());
    },
    error: function (err) {
      console.log(err);
    }
  }); // --- end of $.ajax 장바구니 표시 
}

// 장바구니 화면 표시
function cartListing(loc, data, price) {
  $(loc).append(
    '<tr>' + '<td style="display: none;">' + data[i].prod_no + '</td>'
    + '<td>' + '<img src="/aHayera/resources/upload/' + data[i].img_url + '" width="55" height="55">' + '</td>'
    + '<td>' + '<a href="productSelected.do?prod_no='+data[i].prod_no+'">' + data[i].prod_name + '</a>' + '</td>'
    + '<td>'
    + '<button type="button" class="btn btn-primary btn-xs" id="countDown">'
    + '<span class="glyphicon glyphicon-chevron-down"></span>' + '</button>'
    + '<span class="cartEachQty">' + data[i].each_qty + '</span>'
    + '<button type="button" class="btn btn-primary btn-xs" id="countUp">'
    + '<span class="glyphicon glyphicon-chevron-up"></span>' + '</button>'
    + '</td>'
    + '<td>' + data[i].sales_price.formatNumber() + '원</td>'
    + '<td>' + price.formatNumber() + '원</td>'
    + '<td>' + '<button type="button" class="btn btn-danger btn-xs" id="cartRemove">'
    + '<span class="glyphicon glyphicon-remove"></span>'
    + '</button>' + '</td>'
    + '</tr>'
  )
}
