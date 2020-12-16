searchVisible = 0;
transparent = true;
hasTransparent = false;

$(document).ready(function(){
   if($('nav[role="navigation"]').hasClass('navbar-transparent')){
        hasTransparent = true;
   }
   $('[data-toggle="search"]').click(function(){
        if(searchVisible == 0){
            searchVisible = 1;
            $(this).parent().addClass('active');
            $(this).children('p').html('Close');
            $('.navbar-search-form').fadeIn(function(){
                $('.navbar-search-form input').focus();
            });
        } else {
            searchVisible = 0;
            $(this).parent().removeClass('active');
            $(this).children('p').html('Search');
            $(this).blur();
            $('.navbar-search-form').fadeOut(function(){
                $('.navbar-search-form input').blur();
            });
        } 
    });
    
});

$(document).scroll(function() {
   if(hasTransparent){
        // KOSMO : NAVBAR 전환을 위한 마우스 스크롤 설정
        if( $(this).scrollTop() > 60 ) {
            if(transparent) {
                transparent = false;
                $('nav[role="navigation"]').removeClass('navbar-transparent');
                $('.navbar-search-form').hide();
                $('.event-open').hide();
            }
        } else {
            if( !transparent ) {
                transparent = true;
                $('nav[role="navigation"]').addClass('navbar-transparent');
                $('.navbar-search-form').show();
                $('.event-open').show();
            }
        }
    }
});













