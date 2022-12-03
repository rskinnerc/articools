import { Controller } from "@hotwired/stimulus"
import { Subject } from "rxjs"
import { debounceTime } from "rxjs"
import { v4 as uuid } from "uuid"

export default class extends Controller {
  static targets  = ["query", "searchSessionId"]

  newInput = new Subject()

  connect() {
    this.setupInputEvent()
  }

  debounceInput() {
    this.queryTarget.value.length > 0 ? this.newInput.next(this.queryTarget.value) : this.generateSearchSessionId()
  }

  setupInputEvent() {
    this.newInput.pipe(
      debounceTime(500),
    ).subscribe(() => {
      this.element.requestSubmit()
    })
  }

  generateSearchSessionId() {
    this.searchSessionIdTarget.value = uuid()
  }
}
