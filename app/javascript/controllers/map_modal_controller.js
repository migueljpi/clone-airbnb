import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="map-modal"
export default class extends Controller {
  static targets = ["mapModal"];

  open() {
    this.mapModalTarget.classList.remove("d-none");
  }

  close() {
    this.mapModalTarget.classList.add("d-none");
  }
}
