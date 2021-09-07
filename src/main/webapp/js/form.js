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
    //draw image in screen
    const fileReader = new FileReader();
    fileReader.readAsDataURL(files[0]);
    fileReader.addEventListener('load', ({target:{result}}) => {
      document.documentElement.style.setProperty('--url-profile',`url(${result})`);
    });

    //Send image to servlet
    const idUser = photo.getAttribute("data-idUser");
    const formData = new FormData()
    formData.append("image-profile",files[0]);
    const pathname = photo.getAttribute("data-path")

    let url = `${pathname}/ServletProfile?id=${idUser}` ;
    fetch(url, {
      method: 'POST',
      body: formData
    })
        .then(response => console.log(response))
        .catch(err => console.error(err));
  });
}