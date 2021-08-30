const detailUp = document.querySelector('#detail-up'),
  detailDown = document.querySelector('#detail-down'),
  currentQuantity = document.querySelector('#current-quantity'),
  currentPrice = document.querySelector('#current-price');

  let price = Number(currentPrice.textContent);
  let quantity = Number(currentQuantity.textContent);
detailDown.addEventListener('click', () => {
  if (quantity > 1) {
    quantity -= 1;
    currentQuantity.textContent = quantity;
    currentPrice.textContent = price * quantity;
  }
});
detailUp.addEventListener('click', () => {
  quantity += 1.0
  currentQuantity.textContent = quantity;
  currentPrice.textContent = price * quantity;
})