//create elements view message
export default function drawChatMessage(message, type = 'request', needProfile) {

  const boxMessage = document.createElement("LI"),
      messageContent = document.createElement("SPAN");

  boxMessage.setAttribute("class", "chat__box");
  messageContent.setAttribute("class", "chat__message");
  boxMessage.appendChild(messageContent);

  if (type !== 'request') type = 'response';
  let typeMessageClass = 'chat__message--' + type;

  boxMessage.classList.add(typeMessageClass);
  messageContent.textContent = message;

  if (needProfile) {
    const {profileAdmin, profileClient} = needProfile;
    if (type === "request") {
      boxMessage.append(profileAdmin.cloneNode(true));
    } else {
      boxMessage.prepend(profileClient.cloneNode(true));
    }
  }
  return boxMessage;
}

export const idAdmin = '612c4334830bd85439865cb7';