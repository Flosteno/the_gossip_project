import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirm"
export default class extends Controller {
  connect() {
  }
  
  confirm(event) {
    if (!confirm(this.element.dataset.confirm)) {
      event.preventDefault()
    }
  }
}
