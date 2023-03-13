import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="infos"
export default class extends Controller {
  static targets = ["info"]

  display() {
    this.infoTarget.classList.toggle("d-none")
  }
}
