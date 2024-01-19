import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="page-refresh"
export default class extends Controller {
  static targets = [ "pageRefresh" ]
  connect() {
    console.log("Hello, from page-refresh-controller.js!")
  }

  refresh() {
    window.location.reload()
  }
}
