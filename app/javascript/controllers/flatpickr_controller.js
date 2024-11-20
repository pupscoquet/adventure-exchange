import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    flatpickr(".fp_date_time", {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
    }
    );

    flatpickr(".fp_date"); 
  };
};
