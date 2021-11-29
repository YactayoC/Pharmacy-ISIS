const formInput = document.querySelectorAll('.form__input');
//Adorno
formInput.forEach(i => {
  i.addEventListener('focus', () => {
    i.parentElement.classList.toggle('form__field-valid');
  });
  i.addEventListener('blur', () => {
    i.parentElement.classList.remove('form__field-valid');
  });
});

//Change perfil photo
const profileOverlay = document.querySelector('#profile-overlay'),
    photo = document.querySelector('#photo'),
    urlProfileFromDB = photo.getAttribute("data-urlProfile"),
    urlProfile = document.documentElement.style;

urlProfile.setProperty('--url-profile', `url(${urlProfileFromDB})`);

if (profileOverlay) {
  profileOverlay.addEventListener('click', () => {
    photo.click();
  });

  photo.addEventListener('change', ({target: {files}}) => {
    //draw image in screen
    const fileReader = new FileReader();
    fileReader.readAsDataURL(files[0]);
    fileReader.addEventListener('load', ({target: {result}}) => {
      urlProfile.setProperty('--url-profile', `url(${result})`);
    });

    //Send image to servlet
    const idUser = photo.getAttribute("data-idUser");
    const formData = new FormData()
    formData.append("image-profile", files[0]);
    const pathname = photo.getAttribute("data-path")

    let url = `${pathname}/ServletProfile?id=${idUser}`;
    fetch(url, {
      method: 'POST',
      body: formData
    })
        .then(response => console.log(response))
        .catch(err => console.error(err));
  });
}