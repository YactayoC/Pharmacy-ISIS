import drawChatMessage from "../../../js/drawChat.js";

/* ========== change data in header chat ========== */
const adminData = document.querySelector('#id-admin'),
    idAdmin = adminData.getAttribute("data-id"),
    pathname = adminData.textContent.trim(),
    host = document.location.host;

const url = `ws://${host}${pathname}/chatIcis/${idAdmin}`;

const ws = new WebSocket(url);
ws.onopen = () => console.log("connect");

let idReceiver;

const clientItem = document.querySelectorAll(".client__item"),
    clientName = document.querySelectorAll(".client__name"),
    clientImgItem = document.querySelectorAll(".client__img-item"),
    client = document.querySelector("#client"),
    clientImg = document.querySelector(".client__img-chat");

if (clientItem) {
  clientItem.forEach((u, i) => {
    u.addEventListener('click', () => {
      document.querySelector('.support__message-overlay').classList.add("hidden")
      client.textContent = clientName[i].textContent
      idReceiver = u.getAttribute("data-userId")
      clientImg.src = clientImgItem[i].getAttribute("src")
    })
  })
}

/* ========== writer in chat for Admin ========== */
const sendMessage = document.querySelector("#send-message-admin"),
    profileClient = document.querySelector(".client-profile-message"),
    profileAdmin = document.querySelector(".admin-profile-message"),
    chatWriter = document.querySelector("#chat-writer"),
    chatBox = document.querySelector('#chat-box');

if (sendMessage) {

  const chatForm = document.querySelector("#chat__form")
  chatForm.addEventListener("submit", (e) => {
    e.preventDefault();
  })


  //receive message
  ws.onmessage = event => {
    const {content, emitterIsEmployee} = JSON.parse(event.data)
    let type = (emitterIsEmployee) ? "request" : "response";
    console.log(content)

    let messageProfile = drawChatMessage(content, type,{profileAdmin, profileClient});
    //messageProfile.firstElementChild.lastElementChild.textContent = "00:00"
    chatBox.appendChild(messageProfile);
  }

//this is a button of admin UI
  sendMessage.addEventListener("click", () => {
    let message = chatWriter.value;

    const messageJSON = {
      idEmitter: idAdmin,
      idReceiver: idReceiver,
      emitterIsEmployee: true,
      relevance: "ADMIN_RESPONSE",
      content: message,
    }
    console.log(messageJSON)
    ws.send(JSON.stringify(messageJSON));

    let messageProfile = drawChatMessage(message,"request",{profileAdmin, profileClient});
    //messageProfile.firstElementChild.lastElementChild.textContent = new Date().getHours().toString();
    //messageProfile.firstElementChild.lastElementChild.textContent = "00:00"
    chatBox.appendChild(messageProfile);

    chatWriter.value = '';
    chatWriter.focus();
  })
}