/*Get form*/
const form = document.querySelector('#form'),
    initialAction = form.getAttribute("action");

//change action of form
const changeAction = (action) => form.setAttribute("action", initialAction + action)

/*For add or create*/
const addEntity = document.querySelector('#add-entity');
addEntity.addEventListener('click', () => changeAction('add'))

//========== Get data of product ==========//
const dataProduct = document.querySelectorAll(".product__edit");
if (dataProduct) {
//Get fields of form
  const name = document.querySelector('#name-product'),
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
      name.value = i.getAttribute("data-name")
      stock.value = i.getAttribute("data-stock")
      price.value = i.getAttribute("data-price")
      category.value = i.getAttribute("data-category")
      laboratory.value = i.getAttribute("data-laboratory")
      presentation.value = i.getAttribute("data-presentation")
      image.value = i.getAttribute("data-image")
      idProduct.value = i.getAttribute("data-id")
    })
  })
}

//========== Get data of product ==========//
const dataEmployee = document.querySelectorAll(".employee__edit")

if (dataEmployee) {
  //get fields of form
  const name = document.querySelector('#name-employee'),
      role = document.querySelector('#role'),
      lastname = document.querySelector('#last-name'),
      dni = document.querySelector('#dni'),
      email = document.querySelector('#email'),
      password = document.querySelector('#password'),
      phone = document.querySelector('#phone'),
      id = document.querySelector("#id-employee");

  dataEmployee.forEach(i => {
    i.addEventListener('click',() => {
      changeAction('edit')

      name.value = i.getAttribute("data-name")
      role.value = i.getAttribute("data-role")
      lastname.value = i.getAttribute("data-lastname")
      dni.value = i.getAttribute("data-dni")
      email.value = i.getAttribute("data-email")
      password.value = i.getAttribute("data-password")
      phone.value = i.getAttribute("data-phone")
      id.value = i.getAttribute("data-id")
    })
  })
}