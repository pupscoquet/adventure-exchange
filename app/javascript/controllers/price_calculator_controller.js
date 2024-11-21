import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calulator"
export default class extends Controller {
  static values = {
    input: String
  }

  static targets = ["input"]

  count(){
    const dates = this.inputTarget.value;
    const date = dates.split(' ')
    const start_range = date[0];
    const end_range = date[2];


    const start = start_range.split('-');
    const end_date = end_range.split('-');

    const mdy_start = start[1] + ' '+ start[0] +' '+ start[2];
    const mdy_end =  end_date[1] + ' '+ end_date[0] +' '+ end_date[2];
    console.log(mdy_start);
    console.log(mdy_end);


    const start_date = Date.parse(mdy_start);
    const final_date = Date.parse(mdy_end);
    console.log(start_date);
    console.log(final_date);

    const difference = final_date - start_date
    console.log(difference)

  }
}
