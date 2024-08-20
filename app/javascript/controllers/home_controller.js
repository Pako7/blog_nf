import { Controller } from "@hotwired/stimulus";
import { allPostsUrl } from "../constants";

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["posts"];

  connect() {
    fetch(allPostsUrl)
      .then(response => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then(data => {
        this.postsTarget.innerHTML = data.html;
      })
      .catch(error => {
        console.error("There was a problem with the fetch operation:", error);
      });
  }
}
