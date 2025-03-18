import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "button"]
  toggle() {
  this.inputTarget.classList.toggle("d-none")
  this.buttonTarget.classList.toggle("d-none")
  }
}
