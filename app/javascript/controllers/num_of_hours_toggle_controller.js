import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="num-of-hours-toggle"
export default class extends Controller {
  static targets = [ "duration", "openTimeCheckboxToggle" ]
  connect() {
    console.log("Hello, Stimulus!")

  }

  toggle() {
    const boxCheck = this.openTimeCheckboxToggleTarget.checked
    const durationField = this.durationTarget
    if (boxCheck == true) {
      durationField.classList.add("d-none")
    } else {
      durationField.classList.remove("d-none")
    }
  }
}
