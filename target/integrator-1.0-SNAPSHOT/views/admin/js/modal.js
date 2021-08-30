const btnCancel = document.querySelectorAll('.cancel-modal'),
  btnAddEntity = document.querySelector('#add-entity'),
  btnEditEntity = document.querySelectorAll('.edit-entity'),
  btnRemoveProduct = document.querySelectorAll('.remove-entity'),
  modalForm = document.querySelector('#modal-form'),
  modalConfirm = document.querySelector('#modal-confirm');


// show all modals
btnAddEntity.addEventListener('click', () => {
  modalForm.classList.remove('hidden');
});
btnEditEntity.forEach(btn => {
  btn.addEventListener('click', () => {
    modalForm.classList.remove('hidden');
  })
})
btnRemoveProduct.forEach(btn => {
  btn.addEventListener('click', () => {
    modalConfirm.classList.remove('hidden');
  })
})
// close modal
btnCancel.forEach(btn => {
  btn.addEventListener('click', () => {
    modalForm.classList.add('hidden');
    modalConfirm.classList.add('hidden');
  })
})