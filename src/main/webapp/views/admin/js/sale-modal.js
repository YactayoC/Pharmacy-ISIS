// show modal
const viewDetailsModal = document.querySelectorAll('.sale__details');

const hideDetailModal = document.querySelector('.modal__close'),
modal = document.querySelector('.modal');

viewDetailsModal.forEach(item => {
  item.addEventListener('click', (e) => {
    modal.classList.remove('hidden');
  });
});

hideDetailModal.addEventListener('click', (e) => {
  modal.classList.add('hidden');
});