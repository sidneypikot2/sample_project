import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["delete_user"]

  submit() {
    confirm("Are you sure to execute this action?");
  }
}