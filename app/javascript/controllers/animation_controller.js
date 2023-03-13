import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animation"
export default class extends Controller {
  static targets = ["platform"]

  connect() {
  }

  addingimage() {
    this.platformTarget.classList.add("image")
  }

  removingimage() {
    this.platformTarget.classList.remove("image")
  }

  display() {

  }
}
