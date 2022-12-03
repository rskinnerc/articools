import { Controller } from "@hotwired/stimulus"
import { Subject } from "rxjs"
import { debounceTime } from "rxjs"

export default class extends Controller {
  static targets  = ["query"]

  newInput = new Subject()

  connect() {
    this.setupInputEvent()
  }

  debounceInput() {
    this.newInput.next(this.queryTarget.value)
  }

  setupInputEvent() {
    this.newInput.pipe(
      debounceTime(300),
    ).subscribe(() => {
      this.element.requestSubmit()
    })
  }
}
