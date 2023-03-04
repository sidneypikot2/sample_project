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

  triggerTurboPaginate() {
    const url = new URL(window.location);
    url.searchParams.set("page", this.element.textContent);
    if(url.searchParams.has('keyword')) {
      url.searchParams.set("keyword", url.searchParams.get('keyword'));
    }
    window.history.pushState({}, "", url)
    this.element.previousElementSibling.getElementsByTagName('button')[0].click()
  }

  triggerTurboSearch() {
    const url = new URL(window.location);
    var keyword = document.getElementById('search').value;
    var search_form = document.getElementById('search_button_container').parentElement.getElementsByTagName('form')[0];
    url.searchParams.delete("page");
    if(url.searchParams.has('keyword')) {
      url.searchParams.set("keyword", keyword);
    }
    window.history.pushState({}, "", url)
    search_form.action = "users/post-index?" + url.searchParams.toString()
    this.element.parentElement.nextElementSibling.getElementsByTagName('button')[0].click()
  }
}