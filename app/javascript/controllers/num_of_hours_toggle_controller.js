import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="num-of-hours-toggle"
export default class extends Controller {
  static targets = [ "duration", "openTimeCheckboxToggle", "numberField" ]
  connect() {
    console.log("Hello, Stimulus!")

  }

  toggle() {
    const boxCheck = this.openTimeCheckboxToggleTarget.checked
    const durationField = this.durationTarget
    const numberField = this.numberFieldTarget
    if (boxCheck) {
      durationField.classList.add("d-none")
      // numberField.required = false
    } else {
      durationField.classList.remove("d-none")
      // numberField.required = true
    }
    numberField.required = !boxCheck;
    // console.log(boxCheck)
    // console.log(numberField.required)
  }
}
