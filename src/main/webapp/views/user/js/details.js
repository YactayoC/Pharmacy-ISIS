const products = document.querySelectorAll('.product__img');

products.forEach( p => {
  p.addEventListener('click', () => {
    // here you can get the attributes of the product
    //how src, 
    // the name, price, description, etc you get of target 
    window.location.href = 'views/user/detail-product.jsp';
  });
});

/* ========== dynamic quantity ========== */

const detailUp = document.querySelector("#detail-up"),
  detailDown = document.querySelector("#detail-down"),
  currentQuantity = document.querySelector("#current-quantity"),
  currentPrice = document.querySelector("#current-price");

if (detailUp && detailDown && currentQuantity && currentPrice) {
  let price = Number(currentPrice.textContent);
  let quantity = Number(currentQuantity.textContent);
  detailDown.addEventListener("click", () => {
    if (quantity > 1) {
      quantity -= 1;
      currentQuantity.textContent = quantity;
      currentPrice.textContent = price * quantity;
    }
  });
  detailUp.addEventListener("click", () => {
    quantity += 1.0;
    currentQuantity.textContent = quantity;
    currentPrice.textContent = price * quantity;
  });
}