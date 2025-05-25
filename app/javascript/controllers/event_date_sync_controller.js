import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["start", "end"]

  syncEndDate() {
    this.endTarget.value = this.startTarget.value
  }
}

