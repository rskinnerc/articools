import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets  = ["query"]

  connect() {
    console.log("Hello, Stimulus!", this.queryTarget.value)
  }

  sendQuery() {
    this.element.requestSubmit()
  }
}
