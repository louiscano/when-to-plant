import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-list"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("hello");
    console.log(this.formTarget);
  }
  toggle(event) {
    event.preventDefault()
    console.log("click");

    this.formTarget.classList.toggle("d-none")
  }

  handleSuccess(event) {
    const [data, status, xhr] = event.detail
    this.insertMessageAndScrollDown(data)
    this.formTarget.reset() // Réinitialise le formulaire après soumission
  }

  insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.scrollToBottom()
  }

  scrollToBottom() {
    // Scrolls to the bottom of the messages container
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }
}
