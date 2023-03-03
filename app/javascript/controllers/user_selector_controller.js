import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select_user"]

  select() {
    var checked_boxes = document.querySelectorAll("input[type='checkbox']:checked.select_user");
    var ids = [];
    checked_boxes.forEach((box) => {
      ids.push(box.id.split("_")[1]);
    })
    document.getElementById("delete_user_button").parentElement.action = "/users/destroy-multiple?ids=" + ids.join(",");
    this.checkIfSomeChecked();
  }

  selectAll() {
    var checkboxes = document.querySelectorAll("input[type='checkbox'].select_user")
    for(var i=0, n=checkboxes.length;i<n;i++) {
      checkboxes[i].checked = this.element.checked;
    }
    this.select();
  }

  checkIfSomeChecked() {
    var checked_boxes = document.querySelectorAll("input[type='checkbox']:checked.select_user");
    var button_element = document.getElementById("delete_user_button");
    if(checked_boxes.length > 0)  {
      button_element.disabled = false;
      button_element.classList.remove("cursor-not-allowed");
    } else {
      button_element.disabled = true;
      button_element.classList.add("cursor-not-allowed");
    }
  }
}