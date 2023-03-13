import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="infos"
export default class extends Controller {
  static targets = ["i"]

  display() {
    this.iTarget.classList.add("display")
  }
}
