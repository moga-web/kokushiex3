import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello_controller connected")
    this.element.textContent = "Hello World!"
  }
}
