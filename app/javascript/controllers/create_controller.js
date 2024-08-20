import { Controller } from "@hotwired/stimulus"
import { createPostUrl } from "../constants";

// Connects to data-controller="create"
export default class extends Controller {
  static targets = ["form", "title", "body"];

  submit(event) {
    event.preventDefault();

    const data = new FormData(this.formTarget);
    const method = this.formTarget.method;

    fetch(createPostUrl, {
      method: method,
      body: data,
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      }
    })
    .then(response => {
      this.titleTarget.value = '';
      this.bodyTarget.value = '';
      alert("Post created successfully!");
    })
    .catch(error => alert('Post sent failed:'));
  }
}
