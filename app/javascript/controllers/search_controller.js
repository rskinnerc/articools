import { Controller } from "@hotwired/stimulus"
import { Subject, debounceTime } from "rxjs"
import { v4 as uuid } from "uuid"

export default class extends Controller {
  static targets  = ["query", "searchSessionId"]

  newInput = new Subject()

  connect() {
    this.setupInputEvent()
  }

  debounceInput(e) {
    e.keycode !== 13 && this.newInput.next()
  }

  setupInputEvent() {
    this.newInput.pipe(
      debounceTime(500),
    ).subscribe(() => {
      this.queryTarget.value.length > 0 && this.element.requestSubmit()
    })
  }

  submitQuery(e) {
    e.preventDefault()
    this.generateSearchSessionId()
    this.queryTarget.value.length > 0 && this.element.requestSubmit()
  }

  generateSearchSessionId() {
    this.searchSessionIdTarget.value = uuid()
  }
}
