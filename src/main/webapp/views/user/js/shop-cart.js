/* ========== Show form of pay ========== */
const btnShowForm = document.querySelector('#show-form'),
  formPay = document.querySelector('#pay-view'),
  btnCloseForm = document.querySelector('#close-form');

btnShowForm.addEventListener('click', () => {
  formPay.classList.toggle('pay--active');
});
btnCloseForm.addEventListener('click', () => {
  formPay.classList.remove('pay--active');
});

/* ========== Change img of card ========== */
const iconCards = document.querySelectorAll('.pay__card-icon'),
  cardImg = document.querySelector('#card-img'),
  svgCards = document.querySelectorAll('.pay__card-icon svg path');

iconCards.forEach( i => {
  i.addEventListener('click', () => {
    cardImg.src = `assets/img/target-${i.dataset.card}.webp`;
    svgCards.forEach( j => {
      j.classList.remove('pay__icon--active');
    });
    i.firstElementChild.firstElementChild.classList.add('pay__icon--active');
  });
});

/* ==========the user want delivery? ========== */
const delivery = document.querySelector('#delivery'),
  formDelivery = document.querySelector('.form__delivery'),
  btnPickOnSite = document.querySelector('#btn-alternate');

delivery.addEventListener('change', (e) => {
  if (e.target.checked) {
    formDelivery.classList.add('form__disabled')
    btnPickOnSite.classList.remove('hidden')
  }else{
    formDelivery.classList.remove('form__disabled')
    btnPickOnSite.classList.add('hidden')
  }
});

/* ========== dynamic quantity subtotal ========== */
const btnUp = document.querySelectorAll('.cart__up-btn'),
  btnDown = document.querySelectorAll('.cart__down-btn'),
  subtotal = document.querySelectorAll('.cart__subtotal'),
  total = document.querySelector('#total');

btnDown.forEach( i => {
  i.addEventListener('click', () => {
    const currentQuantity = i.previousElementSibling;
    const quantity = Number(currentQuantity.textContent);
    
    const price = Number(currentQuantity.dataset.price);
    if (quantity > 1) {
      currentQuantity.textContent = quantity - 1;
      calculateSubtotal(i, quantity - 1, price);
      updateTotal();
    } 
  });
});
btnUp.forEach( j => {
  const maxStock = j.nextElementSibling.dataset.stock;
  
  j.addEventListener('click', () => {
    const currentQuantity = j.nextElementSibling;
    const quantity = Number(currentQuantity.textContent);
    const price = Number(currentQuantity.dataset.price);
    if (quantity < maxStock) {      
      currentQuantity.textContent = quantity + 1;
      calculateSubtotal(j, quantity + 1, price);
      updateTotal();
    }
  });
});


const calculateSubtotal = (element, quantity, price = 1) => {
  const subtotal = element.parentElement.nextElementSibling.firstElementChild;
  subtotal.textContent = price * quantity;
}

const updateTotal = () => {
  let auxTotal = 0; 
  subtotal.forEach( s => {
    auxTotal += Number(s.textContent);
  });
  total.textContent = auxTotal;
}