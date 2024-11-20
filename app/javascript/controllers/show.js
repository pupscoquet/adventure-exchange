import { items } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", items)

export default class extends Controller {
  connect() {
    console.log("Hello World!")
  }
}
