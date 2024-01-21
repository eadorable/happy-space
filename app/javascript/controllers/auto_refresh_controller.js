import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-refresh"
export default class extends Controller {
  connect() {
    this.startAutoRefresh();
  }

  startAutoRefresh() {
    const refreshInterval = 60000; // Set your desired refresh interval in milliseconds
    setInterval(() => {
      this.reloadPage();
    }, refreshInterval);
  }

  reloadPage() {
    location.reload(true);
  }
}
