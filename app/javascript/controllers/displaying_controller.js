import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="displaying"
export default class extends Controller {
  static targets = ["sub"]

  connect() {
  }

  display() {
    this.subTarget.classList.remove("d-none")
  }
}
