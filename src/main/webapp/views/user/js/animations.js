/* ========== Navbar show ========== */
const navToggle = document.querySelector("#nav__toggle"),
    navClose = document.querySelector("#nav__close"),
    navMenu = document.querySelector("#nav__menu");

if (navToggle && navClose && navMenu) {
  navToggle.addEventListener("click", () => {
    navMenu.classList.toggle("nav__visible");
  });
  navClose.addEventListener("click", () => {
    navMenu.classList.remove("nav__visible");
  });
}
/* ========== carousel products ========== */
const swiperContainer = document.querySelector(".swiper-container");
if (swiperContainer) {
  let carousel = new Swiper(".carousel", {
    loop: true,
    spaceBetween: 28,
    centeredSlides: true,
    grabCursor: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    breakpoints: {
      768:{
        slidesPerView: 2,
      },
      1220:{
        slidesPerView: 3,
      }
    },
    keyboard: true,
  });
}
/* ========== Chat show ========== */
const chatShow = document.querySelector("#chat__show"),
    chatClose = document.querySelector("#chat__close"),
    chat = document.querySelector("#chat"),
    chatForm = document.querySelector("#chat__form");


if (chatShow && chatClose) {
  const userData = document.querySelector('#user-data'),
    chatBlocked = document.querySelector('.chat__blocked');

  chatForm.addEventListener("submit", (e) => {
    e.preventDefault();
  });

  chatShow.addEventListener("click", () => {
    if (userData) chatBlocked.classList.add('hidden')
    chat.classList.add("chat__visible");
    document.body.classList.add("no-scroll");

  });
  chatClose.addEventListener("click", () => {
    chat.classList.remove("chat__visible");
    document.body.classList.remove("no-scroll");
  });
}