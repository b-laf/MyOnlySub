import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove"
export default class extends Controller {
  static targets = ["removelink", "checkbutton"]

  static values = {
    url5: String,
  }

  exit(event) {
    event.preventDefault()
    fetch(this.url5Value)
    console.log(document.URL.includes)
    if (document.URL.includes("wishlist") || document.URL.includes("sub")) {
      this.element.remove()
    }
    else {
      this.element.classList.toggle('border-add-wishlist')
      this.removelinkTarget.classList.toggle('fa-plus')
      this.removelinkTarget.classList.toggle('fa-trash')
      this.checkbuttonTarget.classList.toggle('fa-solid')
      this.checkbuttonTarget.classList.toggle('fa-check')
      this.checkbuttonTarget.classList.toggle('ticked-add-wishlist')
    }
  }
}
