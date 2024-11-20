import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["booking"]

  book() {
    const button =  this.bookingTarget

  }
}
