import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="price-calulator"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
}
