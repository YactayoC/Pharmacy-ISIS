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
  chatForm.addEventListener("submit", (e) => {
    e.preventDefault();
  });
  
  chatShow.addEventListener("click", () => {
    chat.classList.toggle("chat__visible");
    document.body.classList.toggle("no-scroll");
  });
  chatClose.addEventListener("click", () => {
    chat.classList.remove("chat__visible");
    document.body.classList.remove("no-scroll");
  });

  /* ========== writer in chat ========== */
  const chatWriter = document.querySelector("#chat-writer"),
    sendBtn = document.querySelector('#send-message'),
    chatBox = document.querySelector('#chat-box');
  
  //create elements view message
  const drawChatMessage = (message, type = 'request') => {
    const boxMessage = document.createElement("LI"),
    messageContent = document.createElement("SPAN");
    
    boxMessage.setAttribute("class", "chat__box");
    messageContent.setAttribute("class", "chat__message");
    boxMessage.appendChild(messageContent);

    if (type !== 'request') type = 'response';
    let typeMessageClass = 'chat__message--' + type;

    boxMessage.classList.add(typeMessageClass);
    messageContent.textContent = message;
     
    return boxMessage;
  };

  sendBtn.addEventListener("click", () => {
    let message = chatWriter.value;
  
    chatBox.appendChild(drawChatMessage(message));
    chatWriter.value = '';
    chatWriter.focus();
  });
}
