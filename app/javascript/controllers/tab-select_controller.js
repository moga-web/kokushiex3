import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab-select"
export default class extends Controller {
  static targets = ["year", "tag"]
  connect() {
    console.log("TabSelectController connected")
    this.showMockExam()
  }

  showMockExam() {
    this.yearTarget.classList.toggle('hidden', false)
    this.tagTarget.classList.toggle('hidden', true)
  }

  showQuiz() {
    this.yearTarget.classList.toggle('hidden', true)
    this.tagTarget.classList.toggle('hidden', false)
  }
}
