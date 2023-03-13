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
    url.searchParams.set("page", this.element.previousElementSibling.getElementsByTagName('button')[0].textContent);
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
    url.searchParams.set("keyword", keyword);
    window.history.pushState({}, "", url)
    search_form.action = "users/post-index?" + url.searchParams.toString()
    this.element.parentElement.nextElementSibling.getElementsByTagName('button')[0].click()
  }

  triggerTurboChange() {
    const image_container = document.getElementById("image-container");
    const image_input = document.getElementById("dropzone-file");
    const file = image_input.files[0]
    var i = `<img class="rounded-full h-36 w-36 m-auto" alt="image description" id="image-output" data-controller="user-selector" data-action="click->user-selector#triggerTurboChange" src=${URL.createObjectURL(file)}>`
    image_container.innerHTML = i
  }
}