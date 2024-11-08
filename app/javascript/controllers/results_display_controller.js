import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="results-display"
export default class extends Controller {
  static targets = ["errata", "errorRatio"]
  connect() {
    console.log("results-display_Controller connected")
    console.log(this.element)
  }

  switchingDisplayTypes() {
    this.errataTarget.classList.toggle('hidden');
    this.errorRatioTarget.classList.toggle('hidden');
  }
}
