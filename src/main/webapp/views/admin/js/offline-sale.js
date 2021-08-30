/* ========== carousel products ========== */
const swiperContainer = document.querySelector(".swiper-container");
if (swiperContainer) {  
  let carousel = new Swiper(".carousel", {
    loop: true,
    spaceBetween: 28,
    centeredSlides: true,
    grabCursor: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    breakpoints: {
      360:{
        slidesPerView: 1,
      },
      768:{
        slidesPerView: 2,
      },
      1220:{
        slidesPerView: 5,
      }
    },
    keyboard: true,
  });
}