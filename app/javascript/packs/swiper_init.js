// Swiper init compatible con javascript_include_tag y CDN
document.addEventListener('DOMContentLoaded', function() {
  var swiper = new Swiper('.swiper', {
    loop: true,
    autoplay: {
      delay: 3500,
      disableOnInteraction: false,
    },
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    effect: 'fade',
    fadeEffect: { crossFade: true },
  });
});
