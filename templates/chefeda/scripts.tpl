<script>
new WOW().init();

// слик слайдер
$('.slider').slick({
  infinite: true,
  slidesToShow: 4,
  slidesToScroll: 1,
  dots: false,
  autoplay: false,
  autoplaySpeed: 2000,
});
$('.slick-next, .slick-prev').html('');

// раскрывает доп. инфо в карточке товара
$('.item-desc__button, .commentsCount').click(function() {
  $('.item-desc__hidden').slideToggle();

  if($('.item-desc__button').text() === 'Скрыть') {
    $('.item-desc__button').text('Показать больше')
  } else {
    $('.item-desc__button').text('Скрыть')
  }
});

// слайдит корзину при клике на положить в корзину
$('.addToCart').click(function() {
  $('.fixedCart').show("slide", { direction: "right" }, 237);
})

// сабмит при клике на иконку поиска
$('.search-catalogue').click(function(){ $('#queryBox').submit() });

// дропдаун для меню
var catalogueTimer;
$('.header-bottom__button').mouseover(function() {
  $('#catalogue-dropdown').slideDown();
  catalogueTimer = setTimeout(function() {
    $('#catalogue-dropdown').fadeOut('slow');
  }, 2000); 
})
$('#catalogue-dropdown').hover(function() {
  clearTimeout(catalogueTimer);
});
$('#catalogue-dropdown').mouseleave(function() {
  $(this).fadeOut('slow');
}) 

// и личного кабинета
var accountTimer;
$('.hover-account').mouseover(function() {
  $('.dropdown').slideDown();
  accountTimer = setTimeout(function() {
    $('.dropdown').fadeOut('slow');
  }, 2000);
})
$('.dropdown').hover(function() {
  clearTimeout(accountTimer);
});
$('.dropdown').mouseleave(function() {
  $(this).fadeOut('slow');
})

</script>