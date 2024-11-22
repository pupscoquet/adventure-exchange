import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calulator"
export default class extends Controller {
  static values = {
    price: Number
  }

  static targets = ["input", "total", "days"]

  connect() {
    console.log(this.priceValue)
  }

  count(){
    const dates = this.inputTarget.value;
    const date = dates.split(' ')
    const start_range = date[0];
    const end_range = date[2];

    const start = start_range.split('-');
    const end_date = end_range.split('-');

    const mdy_start = start[1] + ' '+ start[0] +' '+ start[2];
    const mdy_end =  end_date[1] + ' '+ end_date[0] +' '+ end_date[2];

    const start_date = Date.parse(mdy_start);
    const final_date = Date.parse(mdy_end);

    const difference = final_date - start_date
    console.log(difference)
    const number_of_days = difference/1000/60/60/24 +1

    const total = number_of_days* this.priceValue
    console.log(total)
    this.totalTarget.innerText = total
    this.daysTarget.innerText = number_of_days

  }
}
