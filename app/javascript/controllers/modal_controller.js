import { Controller } from "@hotwired/stimulus"
import { getPostUrl } from "../constants";

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "post"];

  show(event) {
    const postId = event.currentTarget.getAttribute("data-post-id");
    
    fetch(getPostUrl(postId))
      .then(response => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then(data => {
        this.postTarget.innerHTML = data.html;
      })
      .catch(error => {
        console.error("There was a problem with the fetch operation:", error);
      });

    this.modalTarget.classList.remove("hidden");
  }



  close() {
    this.modalTarget.classList.add("hidden");
  }
}
