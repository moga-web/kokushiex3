import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab"
export default class extends Controller {
  static targets = ["year", "tag"]
  connect() {
    console.log("Tab_Controller connected")
    console.log(this.element)
  }

  switchingExamTypes() {
    this.yearTarget.classList.toggle('hidden');
    this.tagTarget.classList.toggle('hidden');
  }

  showYearTypes() {
    this.yearTarget.classList.remove('hidden');
    this.tagTarget.classList.add('hidden');
  }

  showTagTypes() {
    this.yearTarget.classList.add('hidden');
    this.tagTarget.classList.remove('hidden');
  }
}

