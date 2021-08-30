/* ========== zipped and unzipped ========== */
const zippedBtn = document.querySelector('#zipped-nav'),
  unzippedBtn = document.querySelector('#unzipped-nav'),
  header = document.querySelector('#header'),
  username = document.querySelector('#user-name'),
  userImage = document.querySelector('#user-image');
  
zippedBtn.addEventListener('click', () => {
  zippedBtn.classList.remove('nav__menu-active');
  unzippedBtn.classList.toggle('nav__menu-active');
  header.classList.toggle('nav__zipped');
  userImage.classList.toggle('nav__zipped-img');
  username.classList.toggle('nav__zipped-user');
});
unzippedBtn.addEventListener('click', () => {
  unzippedBtn.classList.remove('nav__menu-active');
  zippedBtn.classList.toggle('nav__menu-active');
  header.classList.remove('nav__zipped');
  userImage.classList.remove('nav__zipped-img');
  username.classList.remove('nav__zipped-user');
});
