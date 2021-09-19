import drawChatMessage, {idAdmin} from "../js/drawChat.js"

const btnShowChat = document.querySelector('#chat__show'),
    userData = document.querySelector('#user-data'),
    pathname = document.querySelector('.absolute-path').textContent.trim()

//for client view
if (userData) {
  const idEmitter = userData.getAttribute("data-idUser")

  btnShowChat.addEventListener('click',() => {
    let url = `${pathname}/ServletProfile?emitter=${idEmitter}&receiver=${idAdmin}`
      fetchService(url)
  })
}
const adminData = document.querySelector('#id-admin')
if (adminData) {
  const idEmitter = adminData.getAttribute("data-id"),
    clientItem = document.querySelectorAll('.client__item');

  clientItem.forEach(client => {
    client.addEventListener('click', () =>{
      const idReceiver = client.getAttribute("data-userId")
      let url = `${pathname}/ServletProfile?emitter=${idEmitter}&receiver=${idReceiver}`

      fetchService(url, true)
    })
  })
}

const fetchService = (url, needProfile) => {
  fetch(url)
      .then(response => response.json())
      .then(response => {
        const chatBox = document.querySelector('#chat-box')
        const chatFragment = document.createDocumentFragment()

        for (const element of response) {
          const {message, emitterIsEmployee} = element
          let type = (emitterIsEmployee) ? "request" : "response";

          if (needProfile) chatFragment.appendChild(drawChatMessage(message, type,true))
          else chatFragment.appendChild(drawChatMessage(message, type))
        }

        chatBox.appendChild(chatFragment)
      })
}