/*Get form*/
const form = document.querySelector('#form'),
    initialAction = form.getAttribute("action");

//change action of form
const changeAction = (action) => {
  form.setAttribute("action", initialAction + action);
}

/*For add or create*/
const addEntity = document.querySelector('#add-entity');
addEntity.addEventListener('click', () => changeAction('add'))

//Get data of product
const dataProduct = document.querySelectorAll(".product__edit");
if (dataProduct) {
//Get fields of form
  const nameProduct = document.querySelector('#name-product'),
      stock = document.querySelector('#stock'),
      price = document.querySelector('#price'),
      category = document.querySelector('#category'),
      laboratory = document.querySelector('#laboratory'),
      presentation = document.querySelector('#presentation'),
      image = document.querySelector('#image'),
      idProduct = document.querySelector('#id-product');

//Event for each button
  dataProduct.forEach(i => {
    i.addEventListener('click', () => {
      changeAction('edit')
      nameProduct.value = i.getAttribute("data-name")
      stock.value = i.getAttribute("data-stock")
      price.value = i.getAttribute("data-price")
      category.value = i.getAttribute("data-category")
      laboratory.value = i.getAttribute("data-laboratory")
      presentation.value = i.getAttribute("data-presentation")
      image.value = i.getAttribute("data-image")
      idProduct.value = i.getAttribute("data-edit")
    })
  })
}