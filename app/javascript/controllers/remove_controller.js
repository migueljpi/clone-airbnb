import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove"
export default class extends Controller {
  static targets = [ "removableElement" ]

  connect() {
    console.log("Connected to remove controller")
  }

  fire(){
    this.removableElementTarget.classList.toggle("d-none")
    console.log("This is a test")
  }
}
