import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update"
export default class extends Controller {
  static targets = ["form", "title", "body", "id"];

  submit(event) {
    event.preventDefault();

    const postId = this.idTarget.value;

    const apiUrl = "http://localhost:3000/api/posts/" + postId + ".json";
    const data = new FormData(this.formTarget);

    fetch(apiUrl, {
      method: "PATCH",
      body: data,
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      }
    })
    .then(response => {
      this.titleTarget.value = '';
      this.bodyTarget.value = '';
      console.log("Post created successfully!");
    })
    .catch(error => console.error('Post sent failed:', error));
  }
}
