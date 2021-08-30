/* ========== Create element of errors ========== */
/*
const iconError = document.createElement('I'),
  textError = document.createElement('SPAN');

iconError.setAttribute('class', 'isax isax-information form__icon-alert');
textError.setAttribute('class', 'form__text-alert');
//<i class="isax isax-slash form__icon-alert"></i> 
//<i class="isax isax-warning-2 form__icon-alert"></i> 
//<i class="isax isax-verify form__icon-alert"></i>
*/

const formInput = document.querySelectorAll('.form__input');
//form__field-valid
  formInput.forEach(i => {
    i.addEventListener('focus', () => {
      i.parentElement.classList.toggle('form__field-valid');
    });
    i.addEventListener('blur', () => {
      i.parentElement.classList.remove('form__field-valid');
    });
});

const profileOverlay = document.querySelector('#profile-overlay'),
  photo = document.querySelector('#photo');
if (profileOverlay) {
  profileOverlay.addEventListener('click', () => {
    photo.click();
  });

  photo.addEventListener('change', ({target:{files}})=> {
    const fileReader = new FileReader();
    fileReader.readAsDataURL(files[0]);
    fileReader.addEventListener('load', ({target:{result}}) => {
      document.documentElement.style.setProperty('--url-profile',`url(${result})`);
    });
  });
}