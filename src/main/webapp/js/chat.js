import drawChatMessage, {idAdmin} from "../js/drawChat.js";

let ws;

const userData = document.querySelector('#user-data'),
    idEmitter = userData.getAttribute("data-idUser"),
    pathname = userData.textContent.trim(),
    host = document.location.host;

//create URL
const url = `ws://${host}${pathname}/chatIcis/${idEmitter}`;

//create connection with Websocket
ws = new WebSocket(url);

ws.onopen = () => console.log("connect")
ws.onerror = (e) => console.log(e)

/* ========== writer in chat for User ========== */
const chatWriter = document.querySelector("#chat-writer"),
    sendBtn = document.querySelector('#send-message'),
    chatBox = document.querySelector('#chat-box'),
    relevancy = document.querySelectorAll(".message-relevance");

//send message

let relevance
//choose relevance
relevancy.forEach(r => {
  r.addEventListener('click', () => {
    relevancy.forEach(m => m.classList.remove("chat__message-active"))
    r.classList.add("chat__message-active")
    relevance = r.getAttribute("data-relevance")
  })
})

//block relevance when the user send a message
const blockRelevancy = () => relevancy.forEach(r => r.classList.add('field-disabled'))

//send message
sendBtn.addEventListener("click", () => {
  let message = chatWriter.value;
  console.log("message" + message)
  const messageJSON = {
    idEmitter: idEmitter,
    idReceiver: idAdmin,
    emitterIsEmployee: false,
    relevance: relevance ?? "TECHNICAL",
    content: message,
  }
  console.log(messageJSON)
  ws.send(JSON.stringify(messageJSON));

  blockRelevancy()

  chatBox.appendChild(drawChatMessage(message));
  chatWriter.value = '';
  chatWriter.focus();
});

//receive message
ws.onmessage = event => {
  const {content, emitterIsEmployee} = JSON.parse(event.data)
  let type = (emitterIsEmployee) ? "response" : "request";
  console.log(content)

  chatBox.appendChild(drawChatMessage(content, type));
}