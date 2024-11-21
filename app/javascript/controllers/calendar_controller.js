import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="calendar"
export default class extends Controller {
  connect(){
    flatpickr(this.element, {
      calendar_enable_time: true,
      calendar_date_format: "d-m-Y",
      mode: "range",
      minDate: "today",
      dateFormat: "d-m-Y"
    })
  }
}
