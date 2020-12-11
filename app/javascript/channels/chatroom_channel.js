import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        document.getElementById('messages').insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
        const notificationLabel = document.querySelector("#notification")
        if (notificationLabel) {
          const numberOfNotifications = Number.parseInt(notificationLabel.innerText)
          notificationLabel.innerText = numberOfNotifications + 1
        }
      },
    });
  }
}

export { initChatroomCable };
