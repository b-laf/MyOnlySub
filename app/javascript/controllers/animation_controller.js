import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animation"
export default class extends Controller {
  static targets = ["platform"]

  connect() {
  }

  growing() {
    this.platformTarget.animate([
      {transform: 'scale(0.4)' },
     ], {
      duration: 2000,
      iteration: Infinity,
    })

    this.platformTarget.animate( [
      {transform: 'scale(1)' },
    ], {
      duration: 2000,
      iteration: Infinity,
    })
  }

  display() {
  }
}
